pragma solidity ^0.4.19;

library cid {
    struct Cid {
        bytes6 prefix;
        bytes32 hash;
    }

    function wrapInCid(bytes6 prefix, bytes32 hash) internal pure returns (bytes) {
        bytes memory _cid = new bytes(38); // 32 bytes for hash + 6 for cid prefix

        for(uint i=0; i<prefix.length; i++) {
            _cid[i] = prefix[i];
        }
        for(uint j=0; j<32; j++) {
            _cid[6+j] = hash[j];
        }

        return _cid;
    }

    function unwrapCid(bytes _cid) internal pure returns (bytes32) {
        bytes32 hash;
        assembly {
            mload(add(add(_cid, 32), 6))
            =: hash
        }

        return hash;
    }

    function getPrefix(bytes _cid) internal pure returns (bytes6) {
        bytes6 prefix;
        assembly {
            mload(add(_cid, 32))
            =: prefix
        }

        return prefix;
    }

    function bytesToCid(bytes cidBytes) internal pure returns (Cid) {
        bytes6 prefix;
        bytes32 hash;
        assembly {
              mload(add(cidBytes, 32))
              =: prefix
              mload(add(add(cidBytes, 32), 6))
              =: hash
        }

        var _cid = Cid(prefix, hash);
        return _cid;
    }

    function cidToBytes(Cid _cid) internal pure returns (bytes) {
        return wrapInCid(_cid.prefix, _cid.hash);
    }
}

