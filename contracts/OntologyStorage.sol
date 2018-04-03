pragma solidity ^0.4.19;

import "./pb_mod.sol";
import "./cid.sol";

contract AnnotationStorage {
  mapping (bytes32 => AnnotationCodec.Annotation) public annotations;

  event AnnotationStored(bytes _cid);

  function storeAnnotation(bytes property, string value) public returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    annotations[hash] = ann;

    var annCid = cid.wrapInCid(cidPrefixAnnotation(), hash);
    AnnotationStored(annCid);
    return annCid;
  }

  function retrieveAnnotation(bytes annCid) public view returns (bytes, string) {
    bytes32 hash = cid.unwrapCid(annCid);
    var ann = annotations[hash];

    return (ann.property, ann.value);
  }

  function isStoredAnnotation(bytes annCid) public view returns (bool exists) {
    bytes32 hash = cid.unwrapCid(annCid);
    AnnotationCodec.Annotation memory ann = annotations[hash];

    bytes32 propertyHash = cid.unwrapCid(ann.property);
    bytes32 defaultBytes;
    return propertyHash != defaultBytes;
  }

  function calculateHashAnnotation(bytes property, string value) public view returns (bytes32) {
    var ann = AnnotationCodec.Annotation(property, value);
    return hashAnnotation(ann);
  }

  function calculateCidAnnotation(bytes property, string value) public view returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    return cid.wrapInCid(cidPrefixAnnotation(), hash);
  }

  function cidPrefixAnnotation() private pure returns (bytes5) {
    // annotation cid prefix
    bytes5 annCidPrefix = 0x01f0011b20;

    return annCidPrefix;
  }

  function hashAnnotation(AnnotationCodec.Annotation ann) private view returns (bytes32) {
    var enc = AnnotationCodec.encode(ann);
    var hash = keccak256(enc);

    return hash;
  }
}
