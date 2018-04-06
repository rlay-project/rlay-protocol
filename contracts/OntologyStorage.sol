pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

import "./pb_mod.sol";
import "./cid.sol";

contract OntologyStorage {
  mapping (bytes32 => AnnotationCodec.Annotation) private annotations;
  mapping (bytes32 => ClassCodec.Class) private classes;
  // mapping (bytes32 => IndividualCodec.Individual) public individuals;

  event AnnotationStored(bytes _cid);
  event ClassStored(bytes _cid);
  // event IndividualStored(bytes _cid);
  event Debug(string msg);

  ///
  /// Annotation
  ///

  function storeAnnotation(bytes property, string value) public returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    annotations[hash] = ann;

    var annCid = cid.wrapInCid(cidPrefixAnnotation(), hash);
    emit AnnotationStored(annCid);
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
    bytes5 annCidPrefix = 0x01f0011b20;
    return annCidPrefix;
  }

  function hashAnnotation(AnnotationCodec.Annotation ann) private view returns (bytes32) {
    var enc = AnnotationCodec.encode(ann);
    var hash = keccak256(enc);

    return hash;
  }

  ///
  /// Class
  ///

  // HACK: It appears that there are some bugs when it comes to passing in bytes[],
  // so for now we are restricted to a single annotation and sub_class_of_class.
  function buildSimpleClass(bytes _annotations, bytes sub_class_of_class) internal view returns (ClassCodec.Class) {

    bytes[] memory __annotations = new bytes[](0);
    if (cid.getPrefix(_annotations) == cidPrefixAnnotation()) {
      __annotations = new bytes[](1);
      __annotations[0] = _annotations;
    }

    bytes[] memory __sub_class_of_class = new bytes[](0);
    if (cid.getPrefix(sub_class_of_class) == cidPrefixClass()) {
      __sub_class_of_class = new bytes[](1);
      __sub_class_of_class[0] = sub_class_of_class;
    }

    var klass = ClassCodec.Class(__annotations, __sub_class_of_class);
    return klass;
  }

  function checkDependenciesAreStoredClass(ClassCodec.Class klass) internal view returns (bool) {
    for (uint i = 0; i < klass.annotations.length; i++) {
      var annotationCid = klass.annotations[i];
      if (!isStoredAnnotation(annotationCid)) {
        return false;
      }
    }

    for (uint j = 0; j < klass.sub_class_of_class.length; j++) {
      var classCid = klass.sub_class_of_class[i];
      if (!isStoredClass(classCid)) {
        return false;
      }
    }

    // TODO: check sub_class_of_class

    return true;
  }

  function storeClass(bytes _annotations, bytes sub_class_of_class) public returns (bytes) {
    var klass = buildSimpleClass(_annotations, sub_class_of_class);
    require(checkDependenciesAreStoredClass(klass));
    var hash = hashClass(klass);

    classes[hash] = klass;

    var classCid = cid.wrapInCid(cidPrefixClass(), hash);
    emit ClassStored(classCid);
    return classCid;
  }

  function retrieveClass(bytes classCid) public view returns (bytes[], bytes[]) {
    bytes32 hash = cid.unwrapCid(classCid);
    var klass = classes[hash];

    return (klass.annotations, klass.sub_class_of_class);
  }

  function isStoredClass(bytes classCid) public view returns (bool exists) {
    bytes32 hash = cid.unwrapCid(classCid);
    ClassCodec.Class memory klass = classes[hash];

    if (klass.annotations.length == 0 && klass.sub_class_of_class.length == 0) {
      return false;
    }
    return true;
  }

  function calculateHashClass(bytes _annotations, bytes sub_class_of_class) public view returns (bytes32) {
    var klass = buildSimpleClass(_annotations, sub_class_of_class);
    return hashClass(klass);
  }

  function calculateCidClass(bytes _annotations, bytes sub_class_of_class) public returns (bytes) {
    var klass = buildSimpleClass(_annotations, sub_class_of_class);
    var hash = hashClass(klass);
    return cid.wrapInCid(cidPrefixClass(), hash);
  }

  function cidPrefixClass() private pure returns (bytes5) {
    bytes5 classCidPrefix = 0x01f1011b20;
    return classCidPrefix;
  }

  function hashClass(ClassCodec.Class klass) private view returns (bytes32) {
    var enc = ClassCodec.encode(klass);
    var hash = keccak256(enc);

    return hash;
  }

  ///
  /// Individual
  ///

  // function storeIndividual(bytes property, string value) public returns (bytes) {
    // var ann = IndividualCodec.Individual(property, value);
    // var hash = hashIndividual(ann);
    // annotations[hash] = ann;

    // var annCid = cid.wrapInCid(cidPrefixIndividual(), hash);
    // IndividualStored(annCid);
    // return annCid;
  // }

  // function retrieveIndividual(bytes annCid) public view returns (bytes, string) {
    // bytes32 hash = cid.unwrapCid(annCid);
    // var ann = annotations[hash];

    // return (ann.property, ann.value);
  // }

  // function isStoredIndividual(bytes annCid) public view returns (bool exists) {
    // bytes32 hash = cid.unwrapCid(annCid);
    // IndividualCodec.Individual memory ann = annotations[hash];

    // bytes32 propertyHash = cid.unwrapCid(ann.property);
    // bytes32 defaultBytes;
    // return propertyHash != defaultBytes;
  // }

  // function calculateHashIndividual(bytes property, string value) public view returns (bytes32) {
    // var ann = IndividualCodec.Individual(property, value);
    // return hashIndividual(ann);
  // }

  // function calculateCidIndividual(bytes property, string value) public view returns (bytes) {
    // var ann = IndividualCodec.Individual(property, value);
    // var hash = hashIndividual(ann);
    // return cid.wrapInCid(cidPrefixIndividual(), hash);
  // }

  // function cidPrefixIndividual() private pure returns (bytes5) {
    // // annotation cid prefix
    // bytes5 annCidPrefix = 0x01f0011b20;

    // return annCidPrefix;
  // }

  // function hashIndividual(IndividualCodec.Individual ann) private view returns (bytes32) {
    // var enc = IndividualCodec.encode(ann);
    // var hash = keccak256(enc);

    // return hash;
  // }
}
