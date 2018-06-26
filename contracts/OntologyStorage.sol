pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

import "./cid.sol";
import "./pb_mod.sol";
import "./IPropositionStorage.sol";

/// @notice The OntologyStorage keeps track of all the ontological entities required to construct propositions, and the propositions themselves.
// The structure for each of the entities is very similar:
//
// store<Entity> function: Stores the entity, in the process checking its wellformedness. Returns the CID, under which it can later be retrieved and referenced.
// retrieve<Entity> function: Retrieve entity by its CID.
// isStored<Entity> function: Checks if an entity is stored by its CID.
// calculateCid<Entity> function: Calculate the CID of an entity.
// cidPrefix<Entity> function: Returns the CID prefix for an entity, which can be used to find out the type of entity.
// hashCid<Entity> function: Hash the entity, producing the latter part of the CID.
// checkDependenciesAreStored<Entity> function: Check if all the CIDs that are referenced in the entity are already stored in the contract.
// <Entity>Stored event: Is emitted when `store<Entity>` is called successfully.
contract OntologyStorage is IPropositionStorage {
    mapping (bytes32 => AnnotationCodec.Annotation) private annotations;
    mapping (bytes32 => ClassCodec.Class) private classes;
    mapping (bytes32 => IndividualCodec.Individual) private individuals;

    event AnnotationStored(bytes _cid);
    event ClassStored(bytes _cid);
    event IndividualStored(bytes _cid);

    //
    // Annotation
    //

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

    //
    // Class
    //

    function checkDependenciesAreStoredClass(ClassCodec.Class klass) internal view returns (bool) {
        for (uint i = 0; i < klass.annotations.length; i++) {
            var annotationCid = klass.annotations[i];
            if (!isStoredAnnotation(annotationCid)) {
                return false;
            }
        }

        for (uint j = 0; j < klass.sub_class_of_class.length; j++) {
            var classCid = klass.sub_class_of_class[j];
            if (!isStoredClass(classCid)) {
                return false;
            }
        }

        return true;
    }

    function storeClass(bytes[] _annotations, bytes[] sub_class_of_class) public returns (bytes) {
        var klass = ClassCodec.Class(_annotations, sub_class_of_class);
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

    function calculateHashClass(bytes[] _annotations, bytes[] sub_class_of_class) public view returns (bytes32) {
        var klass = ClassCodec.Class(_annotations, sub_class_of_class);
        return hashClass(klass);
    }

    function calculateCidClass(bytes[] _annotations, bytes[] sub_class_of_class) public view returns (bytes _cid) {
        var klass = ClassCodec.Class(_annotations, sub_class_of_class);
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

    //
    // Individual
    //
    function checkDependenciesAreStoredIndividual(IndividualCodec.Individual ind) internal view returns (bool) {
        for (uint i = 0; i < ind.annotations.length; i++) {
            var annotationCid = ind.annotations[i];
            if (!isStoredAnnotation(annotationCid)) {
                return false;
            }
        }

        for (uint j = 0; j < ind.class_assertions.length; j++) {
            var classCid = ind.class_assertions[j];
            if (!isStoredClass(classCid)) {
                return false;
            }
        }

        for (uint k = 0; k < ind.negative_class_assertions.length; k++) {
            var classCid2 = ind.negative_class_assertions[k];
            if (!isStoredClass(classCid2)) {
                return false;
            }
        }

        return true;
    }

    function storeIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions) public returns (bytes) {
        var ind = IndividualCodec.Individual(_annotations, _class_assertions, _negative_class_assertions);
        require(checkDependenciesAreStoredIndividual(ind));
        var hash = hashIndividual(ind);
        individuals[hash] = ind;

        var indCid = cid.wrapInCid(cidPrefixIndividual(), hash);
        emit IndividualStored(indCid);
        return indCid;
    }

    function retrieveIndividual(bytes indCid) public view returns (bytes[], bytes[], bytes[]) {
        bytes32 hash = cid.unwrapCid(indCid);
        var ind = individuals[hash];

        return (ind.annotations, ind.class_assertions, ind.negative_class_assertions);
    }

    function isStoredIndividual(bytes indCid) public view returns (bool exists) {
        bytes32 hash = cid.unwrapCid(indCid);
        IndividualCodec.Individual memory ind = individuals[hash];

        if (ind.annotations.length == 0 && ind.class_assertions.length == 0) {
            return false;
        }
        return true;
    }

    function calculateHashIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions) public view returns (bytes32) {
        var ind = IndividualCodec.Individual(_annotations, _class_assertions, _negative_class_assertions);
        return hashIndividual(ind);
    }

    function calculateCidIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions) public view returns (bytes) {
        var ind = IndividualCodec.Individual(_annotations, _class_assertions, _negative_class_assertions);
        var hash = hashIndividual(ind);
        return cid.wrapInCid(cidPrefixIndividual(), hash);
    }

    function cidPrefixIndividual() private pure returns (bytes5) {
        bytes5 cidPrefix = 0x01f2011b20;
        return cidPrefix;
    }

    function hashIndividual(IndividualCodec.Individual ind) private view returns (bytes32) {
        var enc = IndividualCodec.encode(ind);
        var hash = keccak256(enc);

        return hash;
    }

    //
    // Interface: IPropositionStorage
    //

    function isPropositionStored(bytes proposition) public view returns (bool stored) {
        return isStoredIndividual(proposition);
    }
}
