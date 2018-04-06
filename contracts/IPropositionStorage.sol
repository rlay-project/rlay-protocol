pragma solidity ^0.4.19;

interface IPropositionStorage {
  function isPropositionStored(bytes proposition) public view returns (bool stored);
}
