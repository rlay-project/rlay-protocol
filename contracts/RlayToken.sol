pragma solidity ^0.4.19;

import "tokens/eip20/EIP20.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/MerkleProof.sol";

contract RlayToken is EIP20 {
    // owner required for temporary workaround of permissioned payout calculation
    address public owner;
    // start block of all epochs
    uint256 public epochs_start;
    // mapping of epochs to the merkle root of the payouts for that epoch
    mapping (uint256 => bytes32) public payout_roots;
    // keeps track of the total withrawals made for a address
    mapping (address => uint256) public payout_withdrawals;

    function RlayToken() EIP20(
        1000000000000000000000000000,
        "RLAY Token",
        18,
        "RLAY"
    ) public {
        owner = msg.sender;
        epochs_start = block.number;
    }

    function mintedAmountPerEpoch()
        public
        pure
    returns (uint256) {
        return 25000000000000000000;
    }

    // Add a new payout root for a epoch
    //
    // Submiting a new payout merkle root currently works in a permissioned way,
    // where only the token issuer can submit a new root.
    // We intend to transition to a permissionless way to submit the payout root
    // before launch of the mainnet, with zkSNARKs and Truebit being possible solutions.
    function submitPayoutRoot(
        uint256 _epoch,
        bytes32 _root
    )
        public
    {
        require(msg.sender == owner);
        payout_roots[_epoch] = _root;

        uint256 _mintedAmount = mintedAmountPerEpoch();
        totalSupply = SafeMath.add(totalSupply, _mintedAmount);
        balances[this] = SafeMath.add(balances[this], _mintedAmount);

        emit Transfer(address(0), this, _mintedAmount);
    }

    function redeemPayout(
        uint256 _epoch,
        bytes32[] _proof,
        address _account,
        uint256 _amount // Accumulated amount at that payout epoch
    )
        public
    {
        require(verifyPayout(_epoch, _proof, _account, _amount));

        // Calculate the remaining eligable payout for the account (subtract previous withrawals)
        uint256 _withdrawals_for_account = payout_withdrawals[_account];
        uint256 _withdrawal_amount = SafeMath.sub(_amount, _withdrawals_for_account);
        require(_withdrawal_amount > 0, "Not possible to withdraw a negative or zero amount.");

        // Adjust balances and withdrawal tracker
        balances[this] = SafeMath.sub(balances[this], _withdrawal_amount);
        balances[_account] = SafeMath.add(balances[_account], _withdrawal_amount);
        payout_withdrawals[_account] = SafeMath.add(payout_withdrawals[_account], _withdrawal_amount);
        emit Transfer(this, _account, _withdrawal_amount);
    }

    function verifyPayout(
        uint256 _epoch,
        bytes32[] _proof,
        address _account,
        uint256 _amount // Accumulated amount at that payout epoch
    )
        public
        view
        returns (bool)
    {
        // Construct leaf hash and verify proof
        bytes memory _leaf_data = abi.encodePacked(_account, _amount);
        bytes32 _leaf = keccak256(keccak256(_leaf_data));
        bytes32 _epoch_root = payout_roots[_epoch];
        return verifyProof(_proof, _epoch_root, _leaf);
    }

    function verifyProof(
        bytes32[] _proof,
        bytes32 _root,
        bytes32 _leaf
    )
        public
        pure
        returns (bool)
    {
        return MerkleProof.verifyProof(_proof, _root, _leaf);
    }
}
