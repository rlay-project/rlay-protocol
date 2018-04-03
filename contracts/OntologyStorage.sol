pragma solidity ^0.4.19;

import "./pb_mod.sol";

contract AnnotationStore {
  mapping (bytes32 => AnnotationCodec.Annotation) public annotations;

  event AnnotationStored(bytes cid);

  function storeAnnotation(bytes property, string value) public returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    annotations[hash] = ann;

    var cid = wrapInCid(hash);
    AnnotationStored(cid);
    return cid;
  }

  function retrieveAnnotation(bytes cid) public view returns (bytes, string) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    return (ann.property, ann.value);
  }

  function retrieveAnnotationExists(bytes cid) public view returns (bool exists) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    // TODO
    assembly {
      exists := and(sload(ann_slot), 0)
    }
  }

  function calculateHashAnnotation(bytes property, string value) public view returns (bytes32) {
    var ann = AnnotationCodec.Annotation(property, value);
    return hashAnnotation(ann);
  }

  function calculateCidAnnotation(bytes property, string value) public view returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    return wrapInCid(hash);
  }

  function cidPrefix() private pure returns (bytes5) {
    // annotation cid prefix
    bytes5 cid = 0x01f0011b20;

    return cid;
  }

  function wrapInCid(bytes32 hash) private pure returns (bytes) {
    bytes memory cid = new bytes(37); // 32 bytes for hash + 5 for cid prefix

    var cid_part = cidPrefix();
    for(uint i=0; i<cid_part.length; i++) {
      cid[i] = cid_part[i];
    }
    for(uint j=0; j<32; j++) {
      cid[5+j] = hash[j];
    }

    return cid;
  }

  function unwrapCid(bytes cid) private pure returns (bytes32) {
    bytes32 hash;
    assembly {
      mload(add(add(cid, 32), 5))
      =: hash
    }

    return hash;
  }

  function hashAnnotation(AnnotationCodec.Annotation ann) private view returns (bytes32) {
    var enc = AnnotationCodec.encode(ann);
    var hash = keccak256(enc);

    return hash;
  }
}

