pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

import "./cid.sol";
import "./pb_mod.sol";

interface IClassStorage {
    function storeClass(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveClass(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectIntersectionOfStorage {
    function storeObjectIntersectionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectIntersectionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectUnionOfStorage {
    function storeObjectUnionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectUnionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectComplementOfStorage {
    function storeObjectComplementOf(bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectComplementOf(bytes _cid) external view returns (bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectOneOfStorage {
    function storeObjectOneOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectOneOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectSomeValuesFromStorage {
    function storeObjectSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectAllValuesFromStorage {
    function storeObjectAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectHasValueStorage {
    function storeObjectHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectHasSelfStorage {
    function storeObjectHasSelf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectHasSelf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectMinCardinalityStorage {
    function storeObjectMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectMaxCardinalityStorage {
    function storeObjectMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectExactCardinalityStorage {
    function storeObjectExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveObjectExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataSomeValuesFromStorage {
    function storeDataSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataAllValuesFromStorage {
    function storeDataAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataHasValueStorage {
    function storeDataHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataMinCardinalityStorage {
    function storeDataMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataMaxCardinalityStorage {
    function storeDataMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IDataExactCardinalityStorage {
    function storeDataExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes);

    function retrieveDataExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression);

}

interface IObjectPropertyStorage {
    function storeObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes);

    function retrieveObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression);

}

interface IInverseObjectPropertyStorage {
    function storeInverseObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes);

    function retrieveInverseObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression);

}

interface IDataPropertyStorage {
    function storeDataProperty(bytes[] _annotations, bytes[] _superDataPropertyExpression) public returns (bytes);

    function retrieveDataProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superDataPropertyExpression);

}

interface IAnnotationStorage {
    function storeAnnotation(bytes[] _annotations, bytes _property, bytes _value) public returns (bytes);

    function retrieveAnnotation(bytes _cid) external view returns (bytes[] _annotations, bytes _property, bytes _value);

}

interface IIndividualStorage {
    function storeIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) public returns (bytes);

    function retrieveIndividual(bytes _cid) external view returns (bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions);

}

interface IAnnotationPropertyStorage {
    function storeAnnotationProperty(bytes[] _annotations) public returns (bytes);

    function retrieveAnnotationProperty(bytes _cid) external view returns (bytes[] _annotations);

}

interface IClassAssertionStorage {
    function storeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes);

    function retrieveClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class);

}

interface INegativeClassAssertionStorage {
    function storeNegativeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes);

    function retrieveNegativeClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class);

}

interface IObjectPropertyAssertionStorage {
    function storeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes);

    function retrieveObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target);

}

interface INegativeObjectPropertyAssertionStorage {
    function storeNegativeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes);

    function retrieveNegativeObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target);

}

interface IDataPropertyAssertionStorage {
    function storeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes);

    function retrieveDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target);

}

interface INegativeDataPropertyAssertionStorage {
    function storeNegativeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes);

    function retrieveNegativeDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target);

}

interface IAnnotationAssertionStorage {
    function storeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes);

    function retrieveAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value);

}

interface INegativeAnnotationAssertionStorage {
    function storeNegativeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes);

    function retrieveNegativeAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value);

}

contract ClassStorage is IClassStorage {
    mapping (bytes32 => ClassCodec.Class) private class_hash_map;

    bytes6 constant cidPrefixClass = 0x018080031b20;

    event ClassStored(bytes _cid);

    function storeClass(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ClassCodec.Class memory _instance = ClassCodec.Class(_annotations, _superClassExpression);
        bytes32 hash = hashClass(_instance);

        class_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixClass, hash);
        emit ClassStored(_cid);
        return _cid;
    }

    function retrieveClass(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ClassCodec.Class memory _instance = class_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashClass(ClassCodec.Class memory _instance) public view returns (bytes32) {
        bytes memory enc = ClassCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidClass(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ClassCodec.Class memory _instance = ClassCodec.Class(_annotations, _superClassExpression);
        bytes32 _hash = hashClass(_instance);
        return cid.wrapInCid(cidPrefixClass, _hash);
    }
}

contract ObjectIntersectionOfStorage is IObjectIntersectionOfStorage {
    mapping (bytes32 => ObjectIntersectionOfCodec.ObjectIntersectionOf) private objectintersectionof_hash_map;

    bytes6 constant cidPrefixObjectIntersectionOf = 0x018180031b20;

    event ObjectIntersectionOfStored(bytes _cid);

    function storeObjectIntersectionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectIntersectionOfCodec.ObjectIntersectionOf memory _instance = ObjectIntersectionOfCodec.ObjectIntersectionOf(_annotations, _superClassExpression);
        bytes32 hash = hashObjectIntersectionOf(_instance);

        objectintersectionof_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectIntersectionOf, hash);
        emit ObjectIntersectionOfStored(_cid);
        return _cid;
    }

    function retrieveObjectIntersectionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectIntersectionOfCodec.ObjectIntersectionOf memory _instance = objectintersectionof_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectIntersectionOf(ObjectIntersectionOfCodec.ObjectIntersectionOf memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectIntersectionOfCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectIntersectionOf(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectIntersectionOfCodec.ObjectIntersectionOf memory _instance = ObjectIntersectionOfCodec.ObjectIntersectionOf(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectIntersectionOf(_instance);
        return cid.wrapInCid(cidPrefixObjectIntersectionOf, _hash);
    }
}

contract ObjectUnionOfStorage is IObjectUnionOfStorage {
    mapping (bytes32 => ObjectUnionOfCodec.ObjectUnionOf) private objectunionof_hash_map;

    bytes6 constant cidPrefixObjectUnionOf = 0x018280031b20;

    event ObjectUnionOfStored(bytes _cid);

    function storeObjectUnionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectUnionOfCodec.ObjectUnionOf memory _instance = ObjectUnionOfCodec.ObjectUnionOf(_annotations, _superClassExpression);
        bytes32 hash = hashObjectUnionOf(_instance);

        objectunionof_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectUnionOf, hash);
        emit ObjectUnionOfStored(_cid);
        return _cid;
    }

    function retrieveObjectUnionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectUnionOfCodec.ObjectUnionOf memory _instance = objectunionof_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectUnionOf(ObjectUnionOfCodec.ObjectUnionOf memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectUnionOfCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectUnionOf(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectUnionOfCodec.ObjectUnionOf memory _instance = ObjectUnionOfCodec.ObjectUnionOf(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectUnionOf(_instance);
        return cid.wrapInCid(cidPrefixObjectUnionOf, _hash);
    }
}

contract ObjectComplementOfStorage is IObjectComplementOfStorage {
    mapping (bytes32 => ObjectComplementOfCodec.ObjectComplementOf) private objectcomplementof_hash_map;

    bytes6 constant cidPrefixObjectComplementOf = 0x018380031b20;

    event ObjectComplementOfStored(bytes _cid);

    function storeObjectComplementOf(bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectComplementOfCodec.ObjectComplementOf memory _instance = ObjectComplementOfCodec.ObjectComplementOf(_complementOf, _annotations, _superClassExpression);
        bytes32 hash = hashObjectComplementOf(_instance);

        objectcomplementof_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectComplementOf, hash);
        emit ObjectComplementOfStored(_cid);
        return _cid;
    }

    function retrieveObjectComplementOf(bytes _cid) external view returns (bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectComplementOfCodec.ObjectComplementOf memory _instance = objectcomplementof_hash_map[_hash];
        return (_instance.complementOf, _instance.annotations, _instance.superClassExpression);
    }

    function hashObjectComplementOf(ObjectComplementOfCodec.ObjectComplementOf memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectComplementOfCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectComplementOf(bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectComplementOfCodec.ObjectComplementOf memory _instance = ObjectComplementOfCodec.ObjectComplementOf(_complementOf, _annotations, _superClassExpression);
        bytes32 _hash = hashObjectComplementOf(_instance);
        return cid.wrapInCid(cidPrefixObjectComplementOf, _hash);
    }
}

contract ObjectOneOfStorage is IObjectOneOfStorage {
    mapping (bytes32 => ObjectOneOfCodec.ObjectOneOf) private objectoneof_hash_map;

    bytes6 constant cidPrefixObjectOneOf = 0x018480031b20;

    event ObjectOneOfStored(bytes _cid);

    function storeObjectOneOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectOneOfCodec.ObjectOneOf memory _instance = ObjectOneOfCodec.ObjectOneOf(_annotations, _superClassExpression);
        bytes32 hash = hashObjectOneOf(_instance);

        objectoneof_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectOneOf, hash);
        emit ObjectOneOfStored(_cid);
        return _cid;
    }

    function retrieveObjectOneOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectOneOfCodec.ObjectOneOf memory _instance = objectoneof_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectOneOf(ObjectOneOfCodec.ObjectOneOf memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectOneOfCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectOneOf(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectOneOfCodec.ObjectOneOf memory _instance = ObjectOneOfCodec.ObjectOneOf(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectOneOf(_instance);
        return cid.wrapInCid(cidPrefixObjectOneOf, _hash);
    }
}

contract ObjectSomeValuesFromStorage is IObjectSomeValuesFromStorage {
    mapping (bytes32 => ObjectSomeValuesFromCodec.ObjectSomeValuesFrom) private objectsomevaluesfrom_hash_map;

    bytes6 constant cidPrefixObjectSomeValuesFrom = 0x018580031b20;

    event ObjectSomeValuesFromStored(bytes _cid);

    function storeObjectSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectSomeValuesFromCodec.ObjectSomeValuesFrom memory _instance = ObjectSomeValuesFromCodec.ObjectSomeValuesFrom(_annotations, _superClassExpression);
        bytes32 hash = hashObjectSomeValuesFrom(_instance);

        objectsomevaluesfrom_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectSomeValuesFrom, hash);
        emit ObjectSomeValuesFromStored(_cid);
        return _cid;
    }

    function retrieveObjectSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectSomeValuesFromCodec.ObjectSomeValuesFrom memory _instance = objectsomevaluesfrom_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectSomeValuesFrom(ObjectSomeValuesFromCodec.ObjectSomeValuesFrom memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectSomeValuesFromCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectSomeValuesFromCodec.ObjectSomeValuesFrom memory _instance = ObjectSomeValuesFromCodec.ObjectSomeValuesFrom(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectSomeValuesFrom(_instance);
        return cid.wrapInCid(cidPrefixObjectSomeValuesFrom, _hash);
    }
}

contract ObjectAllValuesFromStorage is IObjectAllValuesFromStorage {
    mapping (bytes32 => ObjectAllValuesFromCodec.ObjectAllValuesFrom) private objectallvaluesfrom_hash_map;

    bytes6 constant cidPrefixObjectAllValuesFrom = 0x018680031b20;

    event ObjectAllValuesFromStored(bytes _cid);

    function storeObjectAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectAllValuesFromCodec.ObjectAllValuesFrom memory _instance = ObjectAllValuesFromCodec.ObjectAllValuesFrom(_annotations, _superClassExpression);
        bytes32 hash = hashObjectAllValuesFrom(_instance);

        objectallvaluesfrom_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectAllValuesFrom, hash);
        emit ObjectAllValuesFromStored(_cid);
        return _cid;
    }

    function retrieveObjectAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectAllValuesFromCodec.ObjectAllValuesFrom memory _instance = objectallvaluesfrom_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectAllValuesFrom(ObjectAllValuesFromCodec.ObjectAllValuesFrom memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectAllValuesFromCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectAllValuesFromCodec.ObjectAllValuesFrom memory _instance = ObjectAllValuesFromCodec.ObjectAllValuesFrom(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectAllValuesFrom(_instance);
        return cid.wrapInCid(cidPrefixObjectAllValuesFrom, _hash);
    }
}

contract ObjectHasValueStorage is IObjectHasValueStorage {
    mapping (bytes32 => ObjectHasValueCodec.ObjectHasValue) private objecthasvalue_hash_map;

    bytes6 constant cidPrefixObjectHasValue = 0x018780031b20;

    event ObjectHasValueStored(bytes _cid);

    function storeObjectHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectHasValueCodec.ObjectHasValue memory _instance = ObjectHasValueCodec.ObjectHasValue(_annotations, _superClassExpression);
        bytes32 hash = hashObjectHasValue(_instance);

        objecthasvalue_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectHasValue, hash);
        emit ObjectHasValueStored(_cid);
        return _cid;
    }

    function retrieveObjectHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectHasValueCodec.ObjectHasValue memory _instance = objecthasvalue_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectHasValue(ObjectHasValueCodec.ObjectHasValue memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectHasValueCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectHasValue(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectHasValueCodec.ObjectHasValue memory _instance = ObjectHasValueCodec.ObjectHasValue(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectHasValue(_instance);
        return cid.wrapInCid(cidPrefixObjectHasValue, _hash);
    }
}

contract ObjectHasSelfStorage is IObjectHasSelfStorage {
    mapping (bytes32 => ObjectHasSelfCodec.ObjectHasSelf) private objecthasself_hash_map;

    bytes6 constant cidPrefixObjectHasSelf = 0x018880031b20;

    event ObjectHasSelfStored(bytes _cid);

    function storeObjectHasSelf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectHasSelfCodec.ObjectHasSelf memory _instance = ObjectHasSelfCodec.ObjectHasSelf(_annotations, _superClassExpression);
        bytes32 hash = hashObjectHasSelf(_instance);

        objecthasself_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectHasSelf, hash);
        emit ObjectHasSelfStored(_cid);
        return _cid;
    }

    function retrieveObjectHasSelf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectHasSelfCodec.ObjectHasSelf memory _instance = objecthasself_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectHasSelf(ObjectHasSelfCodec.ObjectHasSelf memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectHasSelfCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectHasSelf(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectHasSelfCodec.ObjectHasSelf memory _instance = ObjectHasSelfCodec.ObjectHasSelf(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectHasSelf(_instance);
        return cid.wrapInCid(cidPrefixObjectHasSelf, _hash);
    }
}

contract ObjectMinCardinalityStorage is IObjectMinCardinalityStorage {
    mapping (bytes32 => ObjectMinCardinalityCodec.ObjectMinCardinality) private objectmincardinality_hash_map;

    bytes6 constant cidPrefixObjectMinCardinality = 0x018980031b20;

    event ObjectMinCardinalityStored(bytes _cid);

    function storeObjectMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectMinCardinalityCodec.ObjectMinCardinality memory _instance = ObjectMinCardinalityCodec.ObjectMinCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashObjectMinCardinality(_instance);

        objectmincardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectMinCardinality, hash);
        emit ObjectMinCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectMinCardinalityCodec.ObjectMinCardinality memory _instance = objectmincardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectMinCardinality(ObjectMinCardinalityCodec.ObjectMinCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectMinCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectMinCardinalityCodec.ObjectMinCardinality memory _instance = ObjectMinCardinalityCodec.ObjectMinCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectMinCardinality(_instance);
        return cid.wrapInCid(cidPrefixObjectMinCardinality, _hash);
    }
}

contract ObjectMaxCardinalityStorage is IObjectMaxCardinalityStorage {
    mapping (bytes32 => ObjectMaxCardinalityCodec.ObjectMaxCardinality) private objectmaxcardinality_hash_map;

    bytes6 constant cidPrefixObjectMaxCardinality = 0x018a80031b20;

    event ObjectMaxCardinalityStored(bytes _cid);

    function storeObjectMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectMaxCardinalityCodec.ObjectMaxCardinality memory _instance = ObjectMaxCardinalityCodec.ObjectMaxCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashObjectMaxCardinality(_instance);

        objectmaxcardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectMaxCardinality, hash);
        emit ObjectMaxCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectMaxCardinalityCodec.ObjectMaxCardinality memory _instance = objectmaxcardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectMaxCardinality(ObjectMaxCardinalityCodec.ObjectMaxCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectMaxCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectMaxCardinalityCodec.ObjectMaxCardinality memory _instance = ObjectMaxCardinalityCodec.ObjectMaxCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectMaxCardinality(_instance);
        return cid.wrapInCid(cidPrefixObjectMaxCardinality, _hash);
    }
}

contract ObjectExactCardinalityStorage is IObjectExactCardinalityStorage {
    mapping (bytes32 => ObjectExactCardinalityCodec.ObjectExactCardinality) private objectexactcardinality_hash_map;

    bytes6 constant cidPrefixObjectExactCardinality = 0x018b80031b20;

    event ObjectExactCardinalityStored(bytes _cid);

    function storeObjectExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        ObjectExactCardinalityCodec.ObjectExactCardinality memory _instance = ObjectExactCardinalityCodec.ObjectExactCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashObjectExactCardinality(_instance);

        objectexactcardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectExactCardinality, hash);
        emit ObjectExactCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectExactCardinalityCodec.ObjectExactCardinality memory _instance = objectexactcardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashObjectExactCardinality(ObjectExactCardinalityCodec.ObjectExactCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectExactCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        ObjectExactCardinalityCodec.ObjectExactCardinality memory _instance = ObjectExactCardinalityCodec.ObjectExactCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashObjectExactCardinality(_instance);
        return cid.wrapInCid(cidPrefixObjectExactCardinality, _hash);
    }
}

contract DataSomeValuesFromStorage is IDataSomeValuesFromStorage {
    mapping (bytes32 => DataSomeValuesFromCodec.DataSomeValuesFrom) private datasomevaluesfrom_hash_map;

    bytes6 constant cidPrefixDataSomeValuesFrom = 0x018c80031b20;

    event DataSomeValuesFromStored(bytes _cid);

    function storeDataSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataSomeValuesFromCodec.DataSomeValuesFrom memory _instance = DataSomeValuesFromCodec.DataSomeValuesFrom(_annotations, _superClassExpression);
        bytes32 hash = hashDataSomeValuesFrom(_instance);

        datasomevaluesfrom_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataSomeValuesFrom, hash);
        emit DataSomeValuesFromStored(_cid);
        return _cid;
    }

    function retrieveDataSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataSomeValuesFromCodec.DataSomeValuesFrom memory _instance = datasomevaluesfrom_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataSomeValuesFrom(DataSomeValuesFromCodec.DataSomeValuesFrom memory _instance) public view returns (bytes32) {
        bytes memory enc = DataSomeValuesFromCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataSomeValuesFromCodec.DataSomeValuesFrom memory _instance = DataSomeValuesFromCodec.DataSomeValuesFrom(_annotations, _superClassExpression);
        bytes32 _hash = hashDataSomeValuesFrom(_instance);
        return cid.wrapInCid(cidPrefixDataSomeValuesFrom, _hash);
    }
}

contract DataAllValuesFromStorage is IDataAllValuesFromStorage {
    mapping (bytes32 => DataAllValuesFromCodec.DataAllValuesFrom) private dataallvaluesfrom_hash_map;

    bytes6 constant cidPrefixDataAllValuesFrom = 0x018d80031b20;

    event DataAllValuesFromStored(bytes _cid);

    function storeDataAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataAllValuesFromCodec.DataAllValuesFrom memory _instance = DataAllValuesFromCodec.DataAllValuesFrom(_annotations, _superClassExpression);
        bytes32 hash = hashDataAllValuesFrom(_instance);

        dataallvaluesfrom_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataAllValuesFrom, hash);
        emit DataAllValuesFromStored(_cid);
        return _cid;
    }

    function retrieveDataAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataAllValuesFromCodec.DataAllValuesFrom memory _instance = dataallvaluesfrom_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataAllValuesFrom(DataAllValuesFromCodec.DataAllValuesFrom memory _instance) public view returns (bytes32) {
        bytes memory enc = DataAllValuesFromCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataAllValuesFromCodec.DataAllValuesFrom memory _instance = DataAllValuesFromCodec.DataAllValuesFrom(_annotations, _superClassExpression);
        bytes32 _hash = hashDataAllValuesFrom(_instance);
        return cid.wrapInCid(cidPrefixDataAllValuesFrom, _hash);
    }
}

contract DataHasValueStorage is IDataHasValueStorage {
    mapping (bytes32 => DataHasValueCodec.DataHasValue) private datahasvalue_hash_map;

    bytes6 constant cidPrefixDataHasValue = 0x018e80031b20;

    event DataHasValueStored(bytes _cid);

    function storeDataHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataHasValueCodec.DataHasValue memory _instance = DataHasValueCodec.DataHasValue(_annotations, _superClassExpression);
        bytes32 hash = hashDataHasValue(_instance);

        datahasvalue_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataHasValue, hash);
        emit DataHasValueStored(_cid);
        return _cid;
    }

    function retrieveDataHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataHasValueCodec.DataHasValue memory _instance = datahasvalue_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataHasValue(DataHasValueCodec.DataHasValue memory _instance) public view returns (bytes32) {
        bytes memory enc = DataHasValueCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataHasValue(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataHasValueCodec.DataHasValue memory _instance = DataHasValueCodec.DataHasValue(_annotations, _superClassExpression);
        bytes32 _hash = hashDataHasValue(_instance);
        return cid.wrapInCid(cidPrefixDataHasValue, _hash);
    }
}

contract DataMinCardinalityStorage is IDataMinCardinalityStorage {
    mapping (bytes32 => DataMinCardinalityCodec.DataMinCardinality) private datamincardinality_hash_map;

    bytes6 constant cidPrefixDataMinCardinality = 0x018f80031b20;

    event DataMinCardinalityStored(bytes _cid);

    function storeDataMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataMinCardinalityCodec.DataMinCardinality memory _instance = DataMinCardinalityCodec.DataMinCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashDataMinCardinality(_instance);

        datamincardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataMinCardinality, hash);
        emit DataMinCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataMinCardinalityCodec.DataMinCardinality memory _instance = datamincardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataMinCardinality(DataMinCardinalityCodec.DataMinCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = DataMinCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataMinCardinalityCodec.DataMinCardinality memory _instance = DataMinCardinalityCodec.DataMinCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashDataMinCardinality(_instance);
        return cid.wrapInCid(cidPrefixDataMinCardinality, _hash);
    }
}

contract DataMaxCardinalityStorage is IDataMaxCardinalityStorage {
    mapping (bytes32 => DataMaxCardinalityCodec.DataMaxCardinality) private datamaxcardinality_hash_map;

    bytes6 constant cidPrefixDataMaxCardinality = 0x019080031b20;

    event DataMaxCardinalityStored(bytes _cid);

    function storeDataMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataMaxCardinalityCodec.DataMaxCardinality memory _instance = DataMaxCardinalityCodec.DataMaxCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashDataMaxCardinality(_instance);

        datamaxcardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataMaxCardinality, hash);
        emit DataMaxCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataMaxCardinalityCodec.DataMaxCardinality memory _instance = datamaxcardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataMaxCardinality(DataMaxCardinalityCodec.DataMaxCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = DataMaxCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataMaxCardinalityCodec.DataMaxCardinality memory _instance = DataMaxCardinalityCodec.DataMaxCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashDataMaxCardinality(_instance);
        return cid.wrapInCid(cidPrefixDataMaxCardinality, _hash);
    }
}

contract DataExactCardinalityStorage is IDataExactCardinalityStorage {
    mapping (bytes32 => DataExactCardinalityCodec.DataExactCardinality) private dataexactcardinality_hash_map;

    bytes6 constant cidPrefixDataExactCardinality = 0x019180031b20;

    event DataExactCardinalityStored(bytes _cid);

    function storeDataExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        DataExactCardinalityCodec.DataExactCardinality memory _instance = DataExactCardinalityCodec.DataExactCardinality(_annotations, _superClassExpression);
        bytes32 hash = hashDataExactCardinality(_instance);

        dataexactcardinality_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataExactCardinality, hash);
        emit DataExactCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataExactCardinalityCodec.DataExactCardinality memory _instance = dataexactcardinality_hash_map[_hash];
        return (_instance.annotations, _instance.superClassExpression);
    }

    function hashDataExactCardinality(DataExactCardinalityCodec.DataExactCardinality memory _instance) public view returns (bytes32) {
        bytes memory enc = DataExactCardinalityCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public view returns (bytes _cid) {
        DataExactCardinalityCodec.DataExactCardinality memory _instance = DataExactCardinalityCodec.DataExactCardinality(_annotations, _superClassExpression);
        bytes32 _hash = hashDataExactCardinality(_instance);
        return cid.wrapInCid(cidPrefixDataExactCardinality, _hash);
    }
}

contract ObjectPropertyStorage is IObjectPropertyStorage {
    mapping (bytes32 => ObjectPropertyCodec.ObjectProperty) private objectproperty_hash_map;

    bytes6 constant cidPrefixObjectProperty = 0x019280031b20;

    event ObjectPropertyStored(bytes _cid);

    function storeObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes) {
        ObjectPropertyCodec.ObjectProperty memory _instance = ObjectPropertyCodec.ObjectProperty(_annotations, _superObjectPropertyExpression);
        bytes32 hash = hashObjectProperty(_instance);

        objectproperty_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectProperty, hash);
        emit ObjectPropertyStored(_cid);
        return _cid;
    }

    function retrieveObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectPropertyCodec.ObjectProperty memory _instance = objectproperty_hash_map[_hash];
        return (_instance.annotations, _instance.superObjectPropertyExpression);
    }

    function hashObjectProperty(ObjectPropertyCodec.ObjectProperty memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectPropertyCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public view returns (bytes _cid) {
        ObjectPropertyCodec.ObjectProperty memory _instance = ObjectPropertyCodec.ObjectProperty(_annotations, _superObjectPropertyExpression);
        bytes32 _hash = hashObjectProperty(_instance);
        return cid.wrapInCid(cidPrefixObjectProperty, _hash);
    }
}

contract InverseObjectPropertyStorage is IInverseObjectPropertyStorage {
    mapping (bytes32 => InverseObjectPropertyCodec.InverseObjectProperty) private inverseobjectproperty_hash_map;

    bytes6 constant cidPrefixInverseObjectProperty = 0x019380031b20;

    event InverseObjectPropertyStored(bytes _cid);

    function storeInverseObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes) {
        InverseObjectPropertyCodec.InverseObjectProperty memory _instance = InverseObjectPropertyCodec.InverseObjectProperty(_annotations, _superObjectPropertyExpression);
        bytes32 hash = hashInverseObjectProperty(_instance);

        inverseobjectproperty_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixInverseObjectProperty, hash);
        emit InverseObjectPropertyStored(_cid);
        return _cid;
    }

    function retrieveInverseObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        InverseObjectPropertyCodec.InverseObjectProperty memory _instance = inverseobjectproperty_hash_map[_hash];
        return (_instance.annotations, _instance.superObjectPropertyExpression);
    }

    function hashInverseObjectProperty(InverseObjectPropertyCodec.InverseObjectProperty memory _instance) public view returns (bytes32) {
        bytes memory enc = InverseObjectPropertyCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidInverseObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public view returns (bytes _cid) {
        InverseObjectPropertyCodec.InverseObjectProperty memory _instance = InverseObjectPropertyCodec.InverseObjectProperty(_annotations, _superObjectPropertyExpression);
        bytes32 _hash = hashInverseObjectProperty(_instance);
        return cid.wrapInCid(cidPrefixInverseObjectProperty, _hash);
    }
}

contract DataPropertyStorage is IDataPropertyStorage {
    mapping (bytes32 => DataPropertyCodec.DataProperty) private dataproperty_hash_map;

    bytes6 constant cidPrefixDataProperty = 0x019480031b20;

    event DataPropertyStored(bytes _cid);

    function storeDataProperty(bytes[] _annotations, bytes[] _superDataPropertyExpression) public returns (bytes) {
        DataPropertyCodec.DataProperty memory _instance = DataPropertyCodec.DataProperty(_annotations, _superDataPropertyExpression);
        bytes32 hash = hashDataProperty(_instance);

        dataproperty_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataProperty, hash);
        emit DataPropertyStored(_cid);
        return _cid;
    }

    function retrieveDataProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superDataPropertyExpression) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataPropertyCodec.DataProperty memory _instance = dataproperty_hash_map[_hash];
        return (_instance.annotations, _instance.superDataPropertyExpression);
    }

    function hashDataProperty(DataPropertyCodec.DataProperty memory _instance) public view returns (bytes32) {
        bytes memory enc = DataPropertyCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataProperty(bytes[] _annotations, bytes[] _superDataPropertyExpression) public view returns (bytes _cid) {
        DataPropertyCodec.DataProperty memory _instance = DataPropertyCodec.DataProperty(_annotations, _superDataPropertyExpression);
        bytes32 _hash = hashDataProperty(_instance);
        return cid.wrapInCid(cidPrefixDataProperty, _hash);
    }
}

contract AnnotationStorage is IAnnotationStorage {
    mapping (bytes32 => AnnotationCodec.Annotation) private annotation_hash_map;

    bytes6 constant cidPrefixAnnotation = 0x019580031b20;

    event AnnotationStored(bytes _cid);

    function storeAnnotation(bytes[] _annotations, bytes _property, bytes _value) public returns (bytes) {
        AnnotationCodec.Annotation memory _instance = AnnotationCodec.Annotation(_annotations, _property, _value);
        bytes32 hash = hashAnnotation(_instance);

        annotation_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixAnnotation, hash);
        emit AnnotationStored(_cid);
        return _cid;
    }

    function retrieveAnnotation(bytes _cid) external view returns (bytes[] _annotations, bytes _property, bytes _value) {
        bytes32 _hash = cid.unwrapCid(_cid);
        AnnotationCodec.Annotation memory _instance = annotation_hash_map[_hash];
        return (_instance.annotations, _instance.property, _instance.value);
    }

    function hashAnnotation(AnnotationCodec.Annotation memory _instance) public view returns (bytes32) {
        bytes memory enc = AnnotationCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidAnnotation(bytes[] _annotations, bytes _property, bytes _value) public view returns (bytes _cid) {
        AnnotationCodec.Annotation memory _instance = AnnotationCodec.Annotation(_annotations, _property, _value);
        bytes32 _hash = hashAnnotation(_instance);
        return cid.wrapInCid(cidPrefixAnnotation, _hash);
    }
}

contract IndividualStorage is IIndividualStorage {
    mapping (bytes32 => IndividualCodec.Individual) private individual_hash_map;

    bytes6 constant cidPrefixIndividual = 0x019680031b20;

    event IndividualStored(bytes _cid);

    function storeIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) public returns (bytes) {
        IndividualCodec.Individual memory _instance = IndividualCodec.Individual(_annotations, _class_assertions, _negative_class_assertions, _object_property_assertions, _negative_object_property_assertions, _data_property_assertions, _negative_data_property_assertions);
        bytes32 hash = hashIndividual(_instance);

        individual_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixIndividual, hash);
        emit IndividualStored(_cid);
        return _cid;
    }

    function retrieveIndividual(bytes _cid) external view returns (bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) {
        bytes32 _hash = cid.unwrapCid(_cid);
        IndividualCodec.Individual memory _instance = individual_hash_map[_hash];
        return (_instance.annotations, _instance.class_assertions, _instance.negative_class_assertions, _instance.object_property_assertions, _instance.negative_object_property_assertions, _instance.data_property_assertions, _instance.negative_data_property_assertions);
    }

    function hashIndividual(IndividualCodec.Individual memory _instance) public view returns (bytes32) {
        bytes memory enc = IndividualCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) public view returns (bytes _cid) {
        IndividualCodec.Individual memory _instance = IndividualCodec.Individual(_annotations, _class_assertions, _negative_class_assertions, _object_property_assertions, _negative_object_property_assertions, _data_property_assertions, _negative_data_property_assertions);
        bytes32 _hash = hashIndividual(_instance);
        return cid.wrapInCid(cidPrefixIndividual, _hash);
    }
}

contract AnnotationPropertyStorage is IAnnotationPropertyStorage {
    mapping (bytes32 => AnnotationPropertyCodec.AnnotationProperty) private annotationproperty_hash_map;

    bytes6 constant cidPrefixAnnotationProperty = 0x019780031b20;

    event AnnotationPropertyStored(bytes _cid);

    function storeAnnotationProperty(bytes[] _annotations) public returns (bytes) {
        AnnotationPropertyCodec.AnnotationProperty memory _instance = AnnotationPropertyCodec.AnnotationProperty(_annotations);
        bytes32 hash = hashAnnotationProperty(_instance);

        annotationproperty_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixAnnotationProperty, hash);
        emit AnnotationPropertyStored(_cid);
        return _cid;
    }

    function retrieveAnnotationProperty(bytes _cid) external view returns (bytes[] _annotations) {
        bytes32 _hash = cid.unwrapCid(_cid);
        AnnotationPropertyCodec.AnnotationProperty memory _instance = annotationproperty_hash_map[_hash];
        return (_instance.annotations);
    }

    function hashAnnotationProperty(AnnotationPropertyCodec.AnnotationProperty memory _instance) public view returns (bytes32) {
        bytes memory enc = AnnotationPropertyCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidAnnotationProperty(bytes[] _annotations) public view returns (bytes _cid) {
        AnnotationPropertyCodec.AnnotationProperty memory _instance = AnnotationPropertyCodec.AnnotationProperty(_annotations);
        bytes32 _hash = hashAnnotationProperty(_instance);
        return cid.wrapInCid(cidPrefixAnnotationProperty, _hash);
    }
}

contract ClassAssertionStorage is IClassAssertionStorage {
    mapping (bytes32 => ClassAssertionCodec.ClassAssertion) private classassertion_hash_map;

    bytes6 constant cidPrefixClassAssertion = 0x019880031b20;

    event ClassAssertionStored(bytes _cid);

    function storeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes) {
        ClassAssertionCodec.ClassAssertion memory _instance = ClassAssertionCodec.ClassAssertion(_annotations, _subject, _class);
        bytes32 hash = hashClassAssertion(_instance);

        classassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixClassAssertion, hash);
        emit ClassAssertionStored(_cid);
        return _cid;
    }

    function retrieveClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ClassAssertionCodec.ClassAssertion memory _instance = classassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.class);
    }

    function hashClassAssertion(ClassAssertionCodec.ClassAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = ClassAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public view returns (bytes _cid) {
        ClassAssertionCodec.ClassAssertion memory _instance = ClassAssertionCodec.ClassAssertion(_annotations, _subject, _class);
        bytes32 _hash = hashClassAssertion(_instance);
        return cid.wrapInCid(cidPrefixClassAssertion, _hash);
    }
}

contract NegativeClassAssertionStorage is INegativeClassAssertionStorage {
    mapping (bytes32 => NegativeClassAssertionCodec.NegativeClassAssertion) private negativeclassassertion_hash_map;

    bytes6 constant cidPrefixNegativeClassAssertion = 0x019980031b20;

    event NegativeClassAssertionStored(bytes _cid);

    function storeNegativeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes) {
        NegativeClassAssertionCodec.NegativeClassAssertion memory _instance = NegativeClassAssertionCodec.NegativeClassAssertion(_annotations, _subject, _class);
        bytes32 hash = hashNegativeClassAssertion(_instance);

        negativeclassassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixNegativeClassAssertion, hash);
        emit NegativeClassAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class) {
        bytes32 _hash = cid.unwrapCid(_cid);
        NegativeClassAssertionCodec.NegativeClassAssertion memory _instance = negativeclassassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.class);
    }

    function hashNegativeClassAssertion(NegativeClassAssertionCodec.NegativeClassAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = NegativeClassAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidNegativeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public view returns (bytes _cid) {
        NegativeClassAssertionCodec.NegativeClassAssertion memory _instance = NegativeClassAssertionCodec.NegativeClassAssertion(_annotations, _subject, _class);
        bytes32 _hash = hashNegativeClassAssertion(_instance);
        return cid.wrapInCid(cidPrefixNegativeClassAssertion, _hash);
    }
}

contract ObjectPropertyAssertionStorage is IObjectPropertyAssertionStorage {
    mapping (bytes32 => ObjectPropertyAssertionCodec.ObjectPropertyAssertion) private objectpropertyassertion_hash_map;

    bytes6 constant cidPrefixObjectPropertyAssertion = 0x019a80031b20;

    event ObjectPropertyAssertionStored(bytes _cid);

    function storeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        ObjectPropertyAssertionCodec.ObjectPropertyAssertion memory _instance = ObjectPropertyAssertionCodec.ObjectPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 hash = hashObjectPropertyAssertion(_instance);

        objectpropertyassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixObjectPropertyAssertion, hash);
        emit ObjectPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        bytes32 _hash = cid.unwrapCid(_cid);
        ObjectPropertyAssertionCodec.ObjectPropertyAssertion memory _instance = objectpropertyassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.target);
    }

    function hashObjectPropertyAssertion(ObjectPropertyAssertionCodec.ObjectPropertyAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = ObjectPropertyAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public view returns (bytes _cid) {
        ObjectPropertyAssertionCodec.ObjectPropertyAssertion memory _instance = ObjectPropertyAssertionCodec.ObjectPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 _hash = hashObjectPropertyAssertion(_instance);
        return cid.wrapInCid(cidPrefixObjectPropertyAssertion, _hash);
    }
}

contract NegativeObjectPropertyAssertionStorage is INegativeObjectPropertyAssertionStorage {
    mapping (bytes32 => NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion) private negativeobjectpropertyassertion_hash_map;

    bytes6 constant cidPrefixNegativeObjectPropertyAssertion = 0x019b80031b20;

    event NegativeObjectPropertyAssertionStored(bytes _cid);

    function storeNegativeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion memory _instance = NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 hash = hashNegativeObjectPropertyAssertion(_instance);

        negativeobjectpropertyassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixNegativeObjectPropertyAssertion, hash);
        emit NegativeObjectPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        bytes32 _hash = cid.unwrapCid(_cid);
        NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion memory _instance = negativeobjectpropertyassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.target);
    }

    function hashNegativeObjectPropertyAssertion(NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = NegativeObjectPropertyAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidNegativeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public view returns (bytes _cid) {
        NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion memory _instance = NegativeObjectPropertyAssertionCodec.NegativeObjectPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 _hash = hashNegativeObjectPropertyAssertion(_instance);
        return cid.wrapInCid(cidPrefixNegativeObjectPropertyAssertion, _hash);
    }
}

contract DataPropertyAssertionStorage is IDataPropertyAssertionStorage {
    mapping (bytes32 => DataPropertyAssertionCodec.DataPropertyAssertion) private datapropertyassertion_hash_map;

    bytes6 constant cidPrefixDataPropertyAssertion = 0x019c80031b20;

    event DataPropertyAssertionStored(bytes _cid);

    function storeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        DataPropertyAssertionCodec.DataPropertyAssertion memory _instance = DataPropertyAssertionCodec.DataPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 hash = hashDataPropertyAssertion(_instance);

        datapropertyassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixDataPropertyAssertion, hash);
        emit DataPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        bytes32 _hash = cid.unwrapCid(_cid);
        DataPropertyAssertionCodec.DataPropertyAssertion memory _instance = datapropertyassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.target);
    }

    function hashDataPropertyAssertion(DataPropertyAssertionCodec.DataPropertyAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = DataPropertyAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public view returns (bytes _cid) {
        DataPropertyAssertionCodec.DataPropertyAssertion memory _instance = DataPropertyAssertionCodec.DataPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 _hash = hashDataPropertyAssertion(_instance);
        return cid.wrapInCid(cidPrefixDataPropertyAssertion, _hash);
    }
}

contract NegativeDataPropertyAssertionStorage is INegativeDataPropertyAssertionStorage {
    mapping (bytes32 => NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion) private negativedatapropertyassertion_hash_map;

    bytes6 constant cidPrefixNegativeDataPropertyAssertion = 0x019d80031b20;

    event NegativeDataPropertyAssertionStored(bytes _cid);

    function storeNegativeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion memory _instance = NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 hash = hashNegativeDataPropertyAssertion(_instance);

        negativedatapropertyassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixNegativeDataPropertyAssertion, hash);
        emit NegativeDataPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        bytes32 _hash = cid.unwrapCid(_cid);
        NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion memory _instance = negativedatapropertyassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.target);
    }

    function hashNegativeDataPropertyAssertion(NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = NegativeDataPropertyAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidNegativeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public view returns (bytes _cid) {
        NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion memory _instance = NegativeDataPropertyAssertionCodec.NegativeDataPropertyAssertion(_annotations, _subject, _property, _target);
        bytes32 _hash = hashNegativeDataPropertyAssertion(_instance);
        return cid.wrapInCid(cidPrefixNegativeDataPropertyAssertion, _hash);
    }
}

contract AnnotationAssertionStorage is IAnnotationAssertionStorage {
    mapping (bytes32 => AnnotationAssertionCodec.AnnotationAssertion) private annotationassertion_hash_map;

    bytes6 constant cidPrefixAnnotationAssertion = 0x019e80031b20;

    event AnnotationAssertionStored(bytes _cid);

    function storeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes) {
        AnnotationAssertionCodec.AnnotationAssertion memory _instance = AnnotationAssertionCodec.AnnotationAssertion(_annotations, _subject, _property, _value);
        bytes32 hash = hashAnnotationAssertion(_instance);

        annotationassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixAnnotationAssertion, hash);
        emit AnnotationAssertionStored(_cid);
        return _cid;
    }

    function retrieveAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value) {
        bytes32 _hash = cid.unwrapCid(_cid);
        AnnotationAssertionCodec.AnnotationAssertion memory _instance = annotationassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.value);
    }

    function hashAnnotationAssertion(AnnotationAssertionCodec.AnnotationAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = AnnotationAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public view returns (bytes _cid) {
        AnnotationAssertionCodec.AnnotationAssertion memory _instance = AnnotationAssertionCodec.AnnotationAssertion(_annotations, _subject, _property, _value);
        bytes32 _hash = hashAnnotationAssertion(_instance);
        return cid.wrapInCid(cidPrefixAnnotationAssertion, _hash);
    }
}

contract NegativeAnnotationAssertionStorage is INegativeAnnotationAssertionStorage {
    mapping (bytes32 => NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion) private negativeannotationassertion_hash_map;

    bytes6 constant cidPrefixNegativeAnnotationAssertion = 0x019f80031b20;

    event NegativeAnnotationAssertionStored(bytes _cid);

    function storeNegativeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes) {
        NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion memory _instance = NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion(_annotations, _subject, _property, _value);
        bytes32 hash = hashNegativeAnnotationAssertion(_instance);

        negativeannotationassertion_hash_map[hash] = _instance;

        bytes memory _cid = cid.wrapInCid(cidPrefixNegativeAnnotationAssertion, hash);
        emit NegativeAnnotationAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value) {
        bytes32 _hash = cid.unwrapCid(_cid);
        NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion memory _instance = negativeannotationassertion_hash_map[_hash];
        return (_instance.annotations, _instance.subject, _instance.property, _instance.value);
    }

    function hashNegativeAnnotationAssertion(NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion memory _instance) public view returns (bytes32) {
        bytes memory enc = NegativeAnnotationAssertionCodec.encode(_instance);
        bytes32 hash = keccak256(enc);

        return hash;
    }

    function calculateCidNegativeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public view returns (bytes _cid) {
        NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion memory _instance = NegativeAnnotationAssertionCodec.NegativeAnnotationAssertion(_annotations, _subject, _property, _value);
        bytes32 _hash = hashNegativeAnnotationAssertion(_instance);
        return cid.wrapInCid(cidPrefixNegativeAnnotationAssertion, _hash);
    }
}

contract OntologyStorage is IClassStorage, IObjectIntersectionOfStorage, IObjectUnionOfStorage, IObjectComplementOfStorage, IObjectOneOfStorage, IObjectSomeValuesFromStorage, IObjectAllValuesFromStorage, IObjectHasValueStorage, IObjectHasSelfStorage, IObjectMinCardinalityStorage, IObjectMaxCardinalityStorage, IObjectExactCardinalityStorage, IDataSomeValuesFromStorage, IDataAllValuesFromStorage, IDataHasValueStorage, IDataMinCardinalityStorage, IDataMaxCardinalityStorage, IDataExactCardinalityStorage, IObjectPropertyStorage, IInverseObjectPropertyStorage, IDataPropertyStorage, IAnnotationStorage, IIndividualStorage, IAnnotationPropertyStorage, IClassAssertionStorage, INegativeClassAssertionStorage, IObjectPropertyAssertionStorage, INegativeObjectPropertyAssertionStorage, IDataPropertyAssertionStorage, INegativeDataPropertyAssertionStorage, IAnnotationAssertionStorage, INegativeAnnotationAssertionStorage{
    IClassStorage public class_storage;
    IObjectIntersectionOfStorage public objectintersectionof_storage;
    IObjectUnionOfStorage public objectunionof_storage;
    IObjectComplementOfStorage public objectcomplementof_storage;
    IObjectOneOfStorage public objectoneof_storage;
    IObjectSomeValuesFromStorage public objectsomevaluesfrom_storage;
    IObjectAllValuesFromStorage public objectallvaluesfrom_storage;
    IObjectHasValueStorage public objecthasvalue_storage;
    IObjectHasSelfStorage public objecthasself_storage;
    IObjectMinCardinalityStorage public objectmincardinality_storage;
    IObjectMaxCardinalityStorage public objectmaxcardinality_storage;
    IObjectExactCardinalityStorage public objectexactcardinality_storage;
    IDataSomeValuesFromStorage public datasomevaluesfrom_storage;
    IDataAllValuesFromStorage public dataallvaluesfrom_storage;
    IDataHasValueStorage public datahasvalue_storage;
    IDataMinCardinalityStorage public datamincardinality_storage;
    IDataMaxCardinalityStorage public datamaxcardinality_storage;
    IDataExactCardinalityStorage public dataexactcardinality_storage;
    IObjectPropertyStorage public objectproperty_storage;
    IInverseObjectPropertyStorage public inverseobjectproperty_storage;
    IDataPropertyStorage public dataproperty_storage;
    IAnnotationStorage public annotation_storage;
    IIndividualStorage public individual_storage;
    IAnnotationPropertyStorage public annotationproperty_storage;
    IClassAssertionStorage public classassertion_storage;
    INegativeClassAssertionStorage public negativeclassassertion_storage;
    IObjectPropertyAssertionStorage public objectpropertyassertion_storage;
    INegativeObjectPropertyAssertionStorage public negativeobjectpropertyassertion_storage;
    IDataPropertyAssertionStorage public datapropertyassertion_storage;
    INegativeDataPropertyAssertionStorage public negativedatapropertyassertion_storage;
    IAnnotationAssertionStorage public annotationassertion_storage;
    INegativeAnnotationAssertionStorage public negativeannotationassertion_storage;

    event ClassStored(bytes _cid);
    event ObjectIntersectionOfStored(bytes _cid);
    event ObjectUnionOfStored(bytes _cid);
    event ObjectComplementOfStored(bytes _cid);
    event ObjectOneOfStored(bytes _cid);
    event ObjectSomeValuesFromStored(bytes _cid);
    event ObjectAllValuesFromStored(bytes _cid);
    event ObjectHasValueStored(bytes _cid);
    event ObjectHasSelfStored(bytes _cid);
    event ObjectMinCardinalityStored(bytes _cid);
    event ObjectMaxCardinalityStored(bytes _cid);
    event ObjectExactCardinalityStored(bytes _cid);
    event DataSomeValuesFromStored(bytes _cid);
    event DataAllValuesFromStored(bytes _cid);
    event DataHasValueStored(bytes _cid);
    event DataMinCardinalityStored(bytes _cid);
    event DataMaxCardinalityStored(bytes _cid);
    event DataExactCardinalityStored(bytes _cid);
    event ObjectPropertyStored(bytes _cid);
    event InverseObjectPropertyStored(bytes _cid);
    event DataPropertyStored(bytes _cid);
    event AnnotationStored(bytes _cid);
    event IndividualStored(bytes _cid);
    event AnnotationPropertyStored(bytes _cid);
    event ClassAssertionStored(bytes _cid);
    event NegativeClassAssertionStored(bytes _cid);
    event ObjectPropertyAssertionStored(bytes _cid);
    event NegativeObjectPropertyAssertionStored(bytes _cid);
    event DataPropertyAssertionStored(bytes _cid);
    event NegativeDataPropertyAssertionStored(bytes _cid);
    event AnnotationAssertionStored(bytes _cid);
    event NegativeAnnotationAssertionStored(bytes _cid);

    constructor(address[] _storage_delegate_addrs) {
        class_storage = IClassStorage(_storage_delegate_addrs[0]);
        objectintersectionof_storage = IObjectIntersectionOfStorage(_storage_delegate_addrs[1]);
        objectunionof_storage = IObjectUnionOfStorage(_storage_delegate_addrs[2]);
        objectcomplementof_storage = IObjectComplementOfStorage(_storage_delegate_addrs[3]);
        objectoneof_storage = IObjectOneOfStorage(_storage_delegate_addrs[4]);
        objectsomevaluesfrom_storage = IObjectSomeValuesFromStorage(_storage_delegate_addrs[5]);
        objectallvaluesfrom_storage = IObjectAllValuesFromStorage(_storage_delegate_addrs[6]);
        objecthasvalue_storage = IObjectHasValueStorage(_storage_delegate_addrs[7]);
        objecthasself_storage = IObjectHasSelfStorage(_storage_delegate_addrs[8]);
        objectmincardinality_storage = IObjectMinCardinalityStorage(_storage_delegate_addrs[9]);
        objectmaxcardinality_storage = IObjectMaxCardinalityStorage(_storage_delegate_addrs[10]);
        objectexactcardinality_storage = IObjectExactCardinalityStorage(_storage_delegate_addrs[11]);
        datasomevaluesfrom_storage = IDataSomeValuesFromStorage(_storage_delegate_addrs[12]);
        dataallvaluesfrom_storage = IDataAllValuesFromStorage(_storage_delegate_addrs[13]);
        datahasvalue_storage = IDataHasValueStorage(_storage_delegate_addrs[14]);
        datamincardinality_storage = IDataMinCardinalityStorage(_storage_delegate_addrs[15]);
        datamaxcardinality_storage = IDataMaxCardinalityStorage(_storage_delegate_addrs[16]);
        dataexactcardinality_storage = IDataExactCardinalityStorage(_storage_delegate_addrs[17]);
        objectproperty_storage = IObjectPropertyStorage(_storage_delegate_addrs[18]);
        inverseobjectproperty_storage = IInverseObjectPropertyStorage(_storage_delegate_addrs[19]);
        dataproperty_storage = IDataPropertyStorage(_storage_delegate_addrs[20]);
        annotation_storage = IAnnotationStorage(_storage_delegate_addrs[21]);
        individual_storage = IIndividualStorage(_storage_delegate_addrs[22]);
        annotationproperty_storage = IAnnotationPropertyStorage(_storage_delegate_addrs[23]);
        classassertion_storage = IClassAssertionStorage(_storage_delegate_addrs[24]);
        negativeclassassertion_storage = INegativeClassAssertionStorage(_storage_delegate_addrs[25]);
        objectpropertyassertion_storage = IObjectPropertyAssertionStorage(_storage_delegate_addrs[26]);
        negativeobjectpropertyassertion_storage = INegativeObjectPropertyAssertionStorage(_storage_delegate_addrs[27]);
        datapropertyassertion_storage = IDataPropertyAssertionStorage(_storage_delegate_addrs[28]);
        negativedatapropertyassertion_storage = INegativeDataPropertyAssertionStorage(_storage_delegate_addrs[29]);
        annotationassertion_storage = IAnnotationAssertionStorage(_storage_delegate_addrs[30]);
        negativeannotationassertion_storage = INegativeAnnotationAssertionStorage(_storage_delegate_addrs[31]);
    }

    function storeClass(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = class_storage.storeClass(_annotations, _superClassExpression);
        emit ClassStored(_cid);
        return _cid;
    }

    function retrieveClass(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return class_storage.retrieveClass(_cid);
    }

    function storeObjectIntersectionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectintersectionof_storage.storeObjectIntersectionOf(_annotations, _superClassExpression);
        emit ObjectIntersectionOfStored(_cid);
        return _cid;
    }

    function retrieveObjectIntersectionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectintersectionof_storage.retrieveObjectIntersectionOf(_cid);
    }

    function storeObjectUnionOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectunionof_storage.storeObjectUnionOf(_annotations, _superClassExpression);
        emit ObjectUnionOfStored(_cid);
        return _cid;
    }

    function retrieveObjectUnionOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectunionof_storage.retrieveObjectUnionOf(_cid);
    }

    function storeObjectComplementOf(bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectcomplementof_storage.storeObjectComplementOf(_complementOf, _annotations, _superClassExpression);
        emit ObjectComplementOfStored(_cid);
        return _cid;
    }

    function retrieveObjectComplementOf(bytes _cid) external view returns (bytes _complementOf, bytes[] _annotations, bytes[] _superClassExpression) {
        return objectcomplementof_storage.retrieveObjectComplementOf(_cid);
    }

    function storeObjectOneOf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectoneof_storage.storeObjectOneOf(_annotations, _superClassExpression);
        emit ObjectOneOfStored(_cid);
        return _cid;
    }

    function retrieveObjectOneOf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectoneof_storage.retrieveObjectOneOf(_cid);
    }

    function storeObjectSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectsomevaluesfrom_storage.storeObjectSomeValuesFrom(_annotations, _superClassExpression);
        emit ObjectSomeValuesFromStored(_cid);
        return _cid;
    }

    function retrieveObjectSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectsomevaluesfrom_storage.retrieveObjectSomeValuesFrom(_cid);
    }

    function storeObjectAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectallvaluesfrom_storage.storeObjectAllValuesFrom(_annotations, _superClassExpression);
        emit ObjectAllValuesFromStored(_cid);
        return _cid;
    }

    function retrieveObjectAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectallvaluesfrom_storage.retrieveObjectAllValuesFrom(_cid);
    }

    function storeObjectHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objecthasvalue_storage.storeObjectHasValue(_annotations, _superClassExpression);
        emit ObjectHasValueStored(_cid);
        return _cid;
    }

    function retrieveObjectHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objecthasvalue_storage.retrieveObjectHasValue(_cid);
    }

    function storeObjectHasSelf(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objecthasself_storage.storeObjectHasSelf(_annotations, _superClassExpression);
        emit ObjectHasSelfStored(_cid);
        return _cid;
    }

    function retrieveObjectHasSelf(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objecthasself_storage.retrieveObjectHasSelf(_cid);
    }

    function storeObjectMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectmincardinality_storage.storeObjectMinCardinality(_annotations, _superClassExpression);
        emit ObjectMinCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectmincardinality_storage.retrieveObjectMinCardinality(_cid);
    }

    function storeObjectMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectmaxcardinality_storage.storeObjectMaxCardinality(_annotations, _superClassExpression);
        emit ObjectMaxCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectmaxcardinality_storage.retrieveObjectMaxCardinality(_cid);
    }

    function storeObjectExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = objectexactcardinality_storage.storeObjectExactCardinality(_annotations, _superClassExpression);
        emit ObjectExactCardinalityStored(_cid);
        return _cid;
    }

    function retrieveObjectExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return objectexactcardinality_storage.retrieveObjectExactCardinality(_cid);
    }

    function storeDataSomeValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = datasomevaluesfrom_storage.storeDataSomeValuesFrom(_annotations, _superClassExpression);
        emit DataSomeValuesFromStored(_cid);
        return _cid;
    }

    function retrieveDataSomeValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return datasomevaluesfrom_storage.retrieveDataSomeValuesFrom(_cid);
    }

    function storeDataAllValuesFrom(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = dataallvaluesfrom_storage.storeDataAllValuesFrom(_annotations, _superClassExpression);
        emit DataAllValuesFromStored(_cid);
        return _cid;
    }

    function retrieveDataAllValuesFrom(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return dataallvaluesfrom_storage.retrieveDataAllValuesFrom(_cid);
    }

    function storeDataHasValue(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = datahasvalue_storage.storeDataHasValue(_annotations, _superClassExpression);
        emit DataHasValueStored(_cid);
        return _cid;
    }

    function retrieveDataHasValue(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return datahasvalue_storage.retrieveDataHasValue(_cid);
    }

    function storeDataMinCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = datamincardinality_storage.storeDataMinCardinality(_annotations, _superClassExpression);
        emit DataMinCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataMinCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return datamincardinality_storage.retrieveDataMinCardinality(_cid);
    }

    function storeDataMaxCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = datamaxcardinality_storage.storeDataMaxCardinality(_annotations, _superClassExpression);
        emit DataMaxCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataMaxCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return datamaxcardinality_storage.retrieveDataMaxCardinality(_cid);
    }

    function storeDataExactCardinality(bytes[] _annotations, bytes[] _superClassExpression) public returns (bytes) {
        bytes memory _cid = dataexactcardinality_storage.storeDataExactCardinality(_annotations, _superClassExpression);
        emit DataExactCardinalityStored(_cid);
        return _cid;
    }

    function retrieveDataExactCardinality(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superClassExpression) {
        return dataexactcardinality_storage.retrieveDataExactCardinality(_cid);
    }

    function storeObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes) {
        bytes memory _cid = objectproperty_storage.storeObjectProperty(_annotations, _superObjectPropertyExpression);
        emit ObjectPropertyStored(_cid);
        return _cid;
    }

    function retrieveObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression) {
        return objectproperty_storage.retrieveObjectProperty(_cid);
    }

    function storeInverseObjectProperty(bytes[] _annotations, bytes[] _superObjectPropertyExpression) public returns (bytes) {
        bytes memory _cid = inverseobjectproperty_storage.storeInverseObjectProperty(_annotations, _superObjectPropertyExpression);
        emit InverseObjectPropertyStored(_cid);
        return _cid;
    }

    function retrieveInverseObjectProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superObjectPropertyExpression) {
        return inverseobjectproperty_storage.retrieveInverseObjectProperty(_cid);
    }

    function storeDataProperty(bytes[] _annotations, bytes[] _superDataPropertyExpression) public returns (bytes) {
        bytes memory _cid = dataproperty_storage.storeDataProperty(_annotations, _superDataPropertyExpression);
        emit DataPropertyStored(_cid);
        return _cid;
    }

    function retrieveDataProperty(bytes _cid) external view returns (bytes[] _annotations, bytes[] _superDataPropertyExpression) {
        return dataproperty_storage.retrieveDataProperty(_cid);
    }

    function storeAnnotation(bytes[] _annotations, bytes _property, bytes _value) public returns (bytes) {
        bytes memory _cid = annotation_storage.storeAnnotation(_annotations, _property, _value);
        emit AnnotationStored(_cid);
        return _cid;
    }

    function retrieveAnnotation(bytes _cid) external view returns (bytes[] _annotations, bytes _property, bytes _value) {
        return annotation_storage.retrieveAnnotation(_cid);
    }

    function storeIndividual(bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) public returns (bytes) {
        bytes memory _cid = individual_storage.storeIndividual(_annotations, _class_assertions, _negative_class_assertions, _object_property_assertions, _negative_object_property_assertions, _data_property_assertions, _negative_data_property_assertions);
        emit IndividualStored(_cid);
        return _cid;
    }

    function retrieveIndividual(bytes _cid) external view returns (bytes[] _annotations, bytes[] _class_assertions, bytes[] _negative_class_assertions, bytes[] _object_property_assertions, bytes[] _negative_object_property_assertions, bytes[] _data_property_assertions, bytes[] _negative_data_property_assertions) {
        return individual_storage.retrieveIndividual(_cid);
    }

    function storeAnnotationProperty(bytes[] _annotations) public returns (bytes) {
        bytes memory _cid = annotationproperty_storage.storeAnnotationProperty(_annotations);
        emit AnnotationPropertyStored(_cid);
        return _cid;
    }

    function retrieveAnnotationProperty(bytes _cid) external view returns (bytes[] _annotations) {
        return annotationproperty_storage.retrieveAnnotationProperty(_cid);
    }

    function storeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes) {
        bytes memory _cid = classassertion_storage.storeClassAssertion(_annotations, _subject, _class);
        emit ClassAssertionStored(_cid);
        return _cid;
    }

    function retrieveClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class) {
        return classassertion_storage.retrieveClassAssertion(_cid);
    }

    function storeNegativeClassAssertion(bytes[] _annotations, bytes _subject, bytes _class) public returns (bytes) {
        bytes memory _cid = negativeclassassertion_storage.storeNegativeClassAssertion(_annotations, _subject, _class);
        emit NegativeClassAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeClassAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _class) {
        return negativeclassassertion_storage.retrieveNegativeClassAssertion(_cid);
    }

    function storeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        bytes memory _cid = objectpropertyassertion_storage.storeObjectPropertyAssertion(_annotations, _subject, _property, _target);
        emit ObjectPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        return objectpropertyassertion_storage.retrieveObjectPropertyAssertion(_cid);
    }

    function storeNegativeObjectPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        bytes memory _cid = negativeobjectpropertyassertion_storage.storeNegativeObjectPropertyAssertion(_annotations, _subject, _property, _target);
        emit NegativeObjectPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeObjectPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        return negativeobjectpropertyassertion_storage.retrieveNegativeObjectPropertyAssertion(_cid);
    }

    function storeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        bytes memory _cid = datapropertyassertion_storage.storeDataPropertyAssertion(_annotations, _subject, _property, _target);
        emit DataPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        return datapropertyassertion_storage.retrieveDataPropertyAssertion(_cid);
    }

    function storeNegativeDataPropertyAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _target) public returns (bytes) {
        bytes memory _cid = negativedatapropertyassertion_storage.storeNegativeDataPropertyAssertion(_annotations, _subject, _property, _target);
        emit NegativeDataPropertyAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeDataPropertyAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _target) {
        return negativedatapropertyassertion_storage.retrieveNegativeDataPropertyAssertion(_cid);
    }

    function storeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes) {
        bytes memory _cid = annotationassertion_storage.storeAnnotationAssertion(_annotations, _subject, _property, _value);
        emit AnnotationAssertionStored(_cid);
        return _cid;
    }

    function retrieveAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value) {
        return annotationassertion_storage.retrieveAnnotationAssertion(_cid);
    }

    function storeNegativeAnnotationAssertion(bytes[] _annotations, bytes _subject, bytes _property, bytes _value) public returns (bytes) {
        bytes memory _cid = negativeannotationassertion_storage.storeNegativeAnnotationAssertion(_annotations, _subject, _property, _value);
        emit NegativeAnnotationAssertionStored(_cid);
        return _cid;
    }

    function retrieveNegativeAnnotationAssertion(bytes _cid) external view returns (bytes[] _annotations, bytes _subject, bytes _property, bytes _value) {
        return negativeannotationassertion_storage.retrieveNegativeAnnotationAssertion(_cid);
    }

}

