#![no_std]
#![allow(non_snake_case)]
#![feature(const_fn)]

extern crate pwasm_abi;
extern crate pwasm_abi_derive;
extern crate pwasm_ethereum;
extern crate pwasm_std;
extern crate rlay_ontology;
extern crate tiny_keccak;

pub mod utils {
    use tiny_keccak::Keccak;
    use pwasm_abi::types::*;

    pub const fn slot_position(key: u8) -> H256 {
        H256([
            key, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0,
        ])
    }

    pub fn slot_position_address(key: u8, address: Address) -> H256 {
        let mut keccak = Keccak::new_keccak256();
        let mut res = H256::new();
        keccak.update(address.as_ref());
        keccak.update(Into::<[u8; 32]>::into(U256::from(key)).as_ref());
        // keccak.update(spender.as_ref());
        keccak.finalize(&mut res);
        res
    }
}

pub mod storage {
    use pwasm_ethereum;
    use pwasm_abi::types::*;
    use pwasm_abi_derive::eth_abi;
    use rlay_ontology::prelude::*;

    #[eth_abi(ClassStorageEndpoint, ClassStorageClient)]
    pub trait IClassStorage {
        fn storeClass(
            &mut self,
            _annotations: Vec<Vec<u8>>,
            _superClassExpression: Vec<Vec<u8>>,
        ) -> Vec<u8>;

        #[constant]
        fn retrieveClass(&mut self, _cid: Vec<u8>) -> (Vec<Vec<u8>>, Vec<Vec<u8>>);
        #[event]
        fn ClassStored(_cid: Vec<u8>);
    }

    static CID_PREFIX_CLASS: [u8; 6] = [0x01, 0x80, 0x80, 0x03, 0x1b, 0x20];

    // mapping (bytes32 => ClassCodec.Class) private class_hash_map;

    #[derive(Default)]
    pub struct ClassStorage;

    impl IClassStorage for ClassStorage {
        fn storeClass(
            &mut self,
            _annotations: Vec<Vec<u8>>,
            _superClassExpression: Vec<Vec<u8>>,
        ) -> Vec<u8> {
            let instance = Class {
                annotations: _annotations,
                super_class_expression: _superClassExpression,
            };
            unimplemented!()
            // ClassCodec.Class memory _instance = ClassCodec.Class(_annotations, _superClassExpression);
            // bytes32 hash = hashClass(_instance);

            // class_hash_map[hash] = _instance;

            // bytes memory _cid = cid.wrapInCid(cidPrefixClass, hash);
            // emit ClassStored(_cid);
            // return _cid;
        }

        fn retrieveClass(&mut self, _cid: Vec<u8>) -> (Vec<Vec<u8>>, Vec<Vec<u8>>) {
            unimplemented!()
            // function retrieveClass(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
            // bytes32 _hash = cid.unwrapCid(_cid);
            // ClassCodec.Class memory _instance = class_hash_map[_hash];
            // return (_instance.annotations, _instance.superClassExpression);
            // }
        }
    }

    impl ClassStorage {
        fn hash_class(instance: &Class) -> H256 {
            unimplemented!()
            // bytes memory enc = ClassCodec.encode(_instance);
            // bytes32 hash = keccak256(enc);

            // return hash;
        }

        // function calculateCidClass(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        // ClassCodec.Class memory _instance = ClassCodec.Class(_annotations, _superClassExpression);
        // bytes32 _hash = hashClass(_instance);
        // return cid.wrapInCid(cidPrefixClass, _hash);
        // }
    }
}

pub mod token {
    use utils::{slot_position, slot_position_address};
    use pwasm_ethereum;
    use pwasm_abi::types::*;
    use pwasm_abi_derive::eth_abi;

    static TOTAL_SUPPLY_KEY: H256 = slot_position(0);
    static OWNER_KEY: H256 = slot_position(1);
    static BALANCES_SLOT: u8 = 2;

    #[eth_abi(TokenEndpoint, TokenClient)]
    pub trait TokenInterface {
        /// The constructor
        fn constructor(&mut self, _total_supply: U256);
        /// Total amount of tokens
        #[constant]
        fn totalSupply(&mut self) -> U256;
        /// What is the balance of a particular account?
        #[constant]
        fn balanceOf(&mut self, _owner: Address) -> U256;
        /// Transfer the balance from owner's account to another account
        fn transfer(&mut self, _to: Address, _amount: U256) -> bool;
        /// Event declaration
        #[event]
        fn Transfer(&mut self, indexed_from: Address, indexed_to: Address, _value: U256);
    }

    pub struct TokenContract;

    impl TokenInterface for TokenContract {
        fn constructor(&mut self, total_supply: U256) {
            let sender = pwasm_ethereum::sender();
            // Set up the total supply for the token
            pwasm_ethereum::write(&TOTAL_SUPPLY_KEY, &total_supply.into());
            // Give all tokens to the contract owner
            pwasm_ethereum::write(&balance_key(&sender), &total_supply.into());
            // Set the contract owner
            pwasm_ethereum::write(&OWNER_KEY, &H256::from(sender).into());
        }

        fn totalSupply(&mut self) -> U256 {
            U256::from_big_endian(&pwasm_ethereum::read(&TOTAL_SUPPLY_KEY))
        }

        fn balanceOf(&mut self, owner: Address) -> U256 {
            read_balance_of(&owner)
        }

        fn transfer(&mut self, to: Address, amount: U256) -> bool {
            let sender = pwasm_ethereum::sender();
            let senderBalance = read_balance_of(&sender);
            let recipientBalance = read_balance_of(&to);
            if amount == 0.into() || senderBalance < amount || to == sender {
                false
            } else {
                let new_sender_balance = senderBalance - amount;
                let new_recipient_balance = recipientBalance + amount;
                pwasm_ethereum::write(&balance_key(&sender), &new_sender_balance.into());
                pwasm_ethereum::write(&balance_key(&to), &new_recipient_balance.into());
                self.Transfer(sender, to, amount);
                true
            }
        }
    }

    // Reads balance by address
    fn read_balance_of(owner: &Address) -> U256 {
        U256::from_big_endian(&pwasm_ethereum::read(&balance_key(owner)))
    }

    // Generates a balance key for some address.
    // Used to map balances with their owners.
    pub(super) fn balance_key(address: &Address) -> H256 {
        slot_position_address(BALANCES_SLOT, *address)
    }
}
// Declares the dispatch and dispatch_ctor methods
use pwasm_abi::eth::EndpointInterface;

#[no_mangle]
pub fn call() {
    let mut endpoint = token::TokenEndpoint::new(token::TokenContract {});
    // Read http://solidity.readthedocs.io/en/develop/abi-spec.html#formal-specification-of-the-encoding for details
    pwasm_ethereum::ret(&endpoint.dispatch(&pwasm_ethereum::input()));
}

#[no_mangle]
pub fn deploy() {
    let mut endpoint = token::TokenEndpoint::new(token::TokenContract {});
    endpoint.dispatch_ctor(&pwasm_ethereum::input());
}

#[cfg(test)]
#[allow(non_snake_case)]
mod tests {
    extern crate pwasm_test;
    extern crate std;
    use super::*;
    use pwasm_abi::types::*;
    use self::pwasm_test::{ext_get, ext_reset};
    use token::TokenInterface;

    #[test]
    fn token_balance_key() {
        let sam_address = Address::from("0xdb6fd484cfa46eeeb73c71edee823e4812f9e2e1");
        let key = token::balance_key(&sam_address);
        std::println!("{:?}", key);
    }

    #[test]
    fn should_succeed_transfering_1000_from_owner_to_another_address() {
        let mut contract = token::TokenContract {};
        let owner_address = Address::from("0xea674fdde714fd979de3edf0f56aa9716b898ec8");
        let sam_address = Address::from("0xdb6fd484cfa46eeeb73c71edee823e4812f9e2e1");
        // Here we're creating an External context using ExternalBuilder and set the `sender` to the `owner_address`
        // so `pwasm_ethereum::sender()` in TokenInterface::constructor() will return that `owner_address`
        ext_reset(|e| e.sender(owner_address.clone()));
        let total_supply = 10000.into();
        contract.constructor(total_supply);
        assert_eq!(contract.balanceOf(owner_address), total_supply);
        assert_eq!(contract.transfer(sam_address, 1000.into()), true);
        assert_eq!(contract.balanceOf(owner_address), 9000.into());
        assert_eq!(contract.balanceOf(sam_address), 1000.into());
        // 1 log entry should be created
        assert_eq!(ext_get().logs().len(), 1);
    }

    #[test]
    fn should_not_transfer_to_self() {
        let mut contract = token::TokenContract {};
        let owner_address = Address::from("0xea674fdde714fd979de3edf0f56aa9716b898ec8");
        ext_reset(|e| e.sender(owner_address.clone()));
        let total_supply = 10000.into();
        contract.constructor(total_supply);
        assert_eq!(contract.balanceOf(owner_address), total_supply);
        assert_eq!(contract.transfer(owner_address, 1000.into()), false);
        assert_eq!(contract.balanceOf(owner_address), 10000.into());
        assert_eq!(ext_get().logs().len(), 0);
    }

}
