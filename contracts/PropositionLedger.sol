pragma solidity ^0.4.19;

import "tokens/eip20/EIP20Interface.sol";
import "./IPropositionStorage.sol";

contract PropositionLedger {
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

  function submitProposition(
    bytes32 proposition,
    uint256 amount
  ) public {
    EIP20Interface tokenContract = EIP20Interface(tokenContractAddr);
    IPropositionStorage propositionStorageContract = IPropositionStorage(propositionStorageContractAddr);

    require(propositionStorageContract.isPropositionStored(proposition));
    require(tokenContract.allowance(msg.sender, this) >= amount);
    require(tokenContract.balanceOf(msg.sender) >= amount);

    tokenContract.transferFrom(msg.sender, this, amount);
    weights[proposition] += amount;
  }
}
