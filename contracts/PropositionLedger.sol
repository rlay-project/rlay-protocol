pragma solidity ^0.4.21;

import "./IPropositionStorage.sol";
import "./cid.sol";
import "tokens/eip20/EIP20Interface.sol";

/// @notice The PropositionLedger tracks how much weight has been put on which propositions.
/// In the future this should extend to tracking more exactly who has added weight to a proposition,
/// and at what point in time they did that
contract PropositionLedger {
    event PropositionWeightIncreased(bytes _cid, uint256 _amount, address _sender);
    event PropositionWeightNewTotal(bytes _cid, uint256 _amount);

    address public tokenContractAddr;
    address public propositionStorageContractAddr;

    // proposition => total staked amount
    mapping (bytes32 => uint256) public weights;

    function PropositionLedger(
        address _tokenContractAddr,
        address _propositionStorageContractAddr
    ) public {
        require(isContract(_tokenContractAddr));
        require(isContract(_propositionStorageContractAddr));

        tokenContractAddr = _tokenContractAddr;
        propositionStorageContractAddr = _propositionStorageContractAddr;
    }

    function isContract(address addr) private view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }

    /// @notice The main function used for adding weight to a proposition.
    /// @dev Emits `PropositionWeightIncreased` and `PropositionWeightNewTotal` when a proposition is successfully added.
    /// @param propositionCid CID of the proposition that the msg.sender is putting weight on. Needs to be stored in the OntologyStorage as a Individual before calling the function.
    /// @param amount The amount of the ERC20 Token that is put down as weight for the proposition. A ERC20 allowance in the height of `amount` for this contract has to be granted for this function call to succeed.
    function submitProposition(
        bytes propositionCid,
        uint256 amount
    ) public {
        EIP20Interface tokenContract = EIP20Interface(tokenContractAddr);
        IPropositionStorage propositionStorageContract = IPropositionStorage(propositionStorageContractAddr);

        // TODO
        // require(propositionStorageContract.isPropositionStored(propositionCid));
        require(tokenContract.allowance(msg.sender, this) >= amount);
        require(tokenContract.balanceOf(msg.sender) >= amount);

        bytes32 propositionHash = cid.unwrapCid(propositionCid);
        tokenContract.transferFrom(msg.sender, this, amount);
        weights[propositionHash] += amount;
        emit PropositionWeightIncreased(propositionCid, amount, msg.sender);
        emit PropositionWeightNewTotal(propositionCid, weights[propositionHash]);
    }
}
