pragma solidity ^0.4.19;

library cid {
  function wrapInCid(bytes5 prefix, bytes32 hash) internal pure returns (bytes) {
    bytes memory _cid = new bytes(37); // 32 bytes for hash + 5 for cid prefix

    for(uint i=0; i<prefix.length; i++) {
      _cid[i] = prefix[i];
    }
    for(uint j=0; j<32; j++) {
      _cid[5+j] = hash[j];
    }

    return _cid;
  }

  function unwrapCid(bytes _cid) internal pure returns (bytes32) {
    bytes32 hash;
    assembly {
      mload(add(add(_cid, 32), 5))
      =: hash
    }

    return hash;
  }
}

