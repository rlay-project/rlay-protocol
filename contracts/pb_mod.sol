pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

//----------------------------------------------------------------------
// AUTO-GENERATED FILE - DO NOT EDIT
//
// This file was generated automatically by solpb from data structures
// defined elsewhere. Instead of editing this file, consider modifying
// the source schema or writing a separate library.
//
// solpb is a free and open-source implementation of protocol buffers
// for Solidity. Protocol buffers are an efficient serialisation format
// for structured data developed by Google. More information about this
// project is available from the repository page:
//
//   http://github.com/CBAInnovationLab/protobuf-solidity
//
// Further information about protocol buffers, including tutorials and
// downloads for implementations in most major languages is available at
// the protocol buffers website:
//
//   https://developers.google.com/protocol-buffers/
//
//  Development of solpb is proudly sponsored by the Innovation Lab at
//  the Commonwealth Bank of Australia.
//----------------------------------------------------------------------



library ClassCodec {
  struct Class {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (Class) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (Class, uint) {
    Class memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, Class r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, Class r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(Class r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(Class r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(Class r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(Class r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(Class memory input, Class storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (Class r) {
    assembly { r := 0 }
  }
  function isNil(Class x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectIntersectionOfCodec {
  struct ObjectIntersectionOf {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectIntersectionOf) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectIntersectionOf, uint) {
    ObjectIntersectionOf memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectIntersectionOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectIntersectionOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectIntersectionOf r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectIntersectionOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectIntersectionOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectIntersectionOf r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectIntersectionOf memory input, ObjectIntersectionOf storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectIntersectionOf r) {
    assembly { r := 0 }
  }
  function isNil(ObjectIntersectionOf x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectUnionOfCodec {
  struct ObjectUnionOf {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectUnionOf) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectUnionOf, uint) {
    ObjectUnionOf memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectUnionOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectUnionOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectUnionOf r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectUnionOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectUnionOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectUnionOf r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectUnionOf memory input, ObjectUnionOf storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectUnionOf r) {
    assembly { r := 0 }
  }
  function isNil(ObjectUnionOf x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectComplementOfCodec {
  struct ObjectComplementOf {
    bytes[] annotations;
    bytes complementOf;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectComplementOf) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectComplementOf, uint) {
    ObjectComplementOf memory r;
    uint[3] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_complementOf(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[2]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_complementOf(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectComplementOf r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_complementOf(uint p, bytes bs, ObjectComplementOf r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.complementOf = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectComplementOf r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[2] ] = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectComplementOf r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectComplementOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.complementOf, p, bs);
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectComplementOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectComplementOf r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.complementOf.length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectComplementOf memory input, ObjectComplementOf storage output) internal {
    output.annotations = input.annotations;
    output.complementOf = input.complementOf;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectComplementOf r) {
    assembly { r := 0 }
  }
  function isNil(ObjectComplementOf x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectOneOfCodec {
  struct ObjectOneOf {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectOneOf) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectOneOf, uint) {
    ObjectOneOf memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectOneOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectOneOf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectOneOf r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectOneOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectOneOf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectOneOf r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectOneOf memory input, ObjectOneOf storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectOneOf r) {
    assembly { r := 0 }
  }
  function isNil(ObjectOneOf x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectSomeValuesFromCodec {
  struct ObjectSomeValuesFrom {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectSomeValuesFrom) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectSomeValuesFrom, uint) {
    ObjectSomeValuesFrom memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectSomeValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectSomeValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectSomeValuesFrom r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectSomeValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectSomeValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectSomeValuesFrom r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectSomeValuesFrom memory input, ObjectSomeValuesFrom storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectSomeValuesFrom r) {
    assembly { r := 0 }
  }
  function isNil(ObjectSomeValuesFrom x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectAllValuesFromCodec {
  struct ObjectAllValuesFrom {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectAllValuesFrom) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectAllValuesFrom, uint) {
    ObjectAllValuesFrom memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectAllValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectAllValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectAllValuesFrom r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectAllValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectAllValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectAllValuesFrom r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectAllValuesFrom memory input, ObjectAllValuesFrom storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectAllValuesFrom r) {
    assembly { r := 0 }
  }
  function isNil(ObjectAllValuesFrom x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectHasValueCodec {
  struct ObjectHasValue {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectHasValue) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectHasValue, uint) {
    ObjectHasValue memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectHasValue r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectHasValue r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectHasValue r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectHasValue r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectHasValue r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectHasValue r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectHasValue memory input, ObjectHasValue storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectHasValue r) {
    assembly { r := 0 }
  }
  function isNil(ObjectHasValue x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectHasSelfCodec {
  struct ObjectHasSelf {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectHasSelf) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectHasSelf, uint) {
    ObjectHasSelf memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectHasSelf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectHasSelf r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectHasSelf r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectHasSelf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectHasSelf r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectHasSelf r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectHasSelf memory input, ObjectHasSelf storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectHasSelf r) {
    assembly { r := 0 }
  }
  function isNil(ObjectHasSelf x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectMinCardinalityCodec {
  struct ObjectMinCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectMinCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectMinCardinality, uint) {
    ObjectMinCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectMinCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectMinCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectMinCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectMinCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectMinCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectMinCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectMinCardinality memory input, ObjectMinCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectMinCardinality r) {
    assembly { r := 0 }
  }
  function isNil(ObjectMinCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectMaxCardinalityCodec {
  struct ObjectMaxCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectMaxCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectMaxCardinality, uint) {
    ObjectMaxCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectMaxCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectMaxCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectMaxCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectMaxCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectMaxCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectMaxCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectMaxCardinality memory input, ObjectMaxCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectMaxCardinality r) {
    assembly { r := 0 }
  }
  function isNil(ObjectMaxCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectExactCardinalityCodec {
  struct ObjectExactCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectExactCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectExactCardinality, uint) {
    ObjectExactCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectExactCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, ObjectExactCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectExactCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectExactCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectExactCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectExactCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(ObjectExactCardinality memory input, ObjectExactCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (ObjectExactCardinality r) {
    assembly { r := 0 }
  }
  function isNil(ObjectExactCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataSomeValuesFromCodec {
  struct DataSomeValuesFrom {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataSomeValuesFrom) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataSomeValuesFrom, uint) {
    DataSomeValuesFrom memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataSomeValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataSomeValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataSomeValuesFrom r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataSomeValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataSomeValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataSomeValuesFrom r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataSomeValuesFrom memory input, DataSomeValuesFrom storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataSomeValuesFrom r) {
    assembly { r := 0 }
  }
  function isNil(DataSomeValuesFrom x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataAllValuesFromCodec {
  struct DataAllValuesFrom {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataAllValuesFrom) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataAllValuesFrom, uint) {
    DataAllValuesFrom memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataAllValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataAllValuesFrom r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataAllValuesFrom r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataAllValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataAllValuesFrom r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataAllValuesFrom r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataAllValuesFrom memory input, DataAllValuesFrom storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataAllValuesFrom r) {
    assembly { r := 0 }
  }
  function isNil(DataAllValuesFrom x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataHasValueCodec {
  struct DataHasValue {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataHasValue) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataHasValue, uint) {
    DataHasValue memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataHasValue r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataHasValue r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataHasValue r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataHasValue r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataHasValue r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataHasValue r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataHasValue memory input, DataHasValue storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataHasValue r) {
    assembly { r := 0 }
  }
  function isNil(DataHasValue x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataMinCardinalityCodec {
  struct DataMinCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataMinCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataMinCardinality, uint) {
    DataMinCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataMinCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataMinCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataMinCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataMinCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataMinCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataMinCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataMinCardinality memory input, DataMinCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataMinCardinality r) {
    assembly { r := 0 }
  }
  function isNil(DataMinCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataMaxCardinalityCodec {
  struct DataMaxCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataMaxCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataMaxCardinality, uint) {
    DataMaxCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataMaxCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataMaxCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataMaxCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataMaxCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataMaxCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataMaxCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataMaxCardinality memory input, DataMaxCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataMaxCardinality r) {
    assembly { r := 0 }
  }
  function isNil(DataMaxCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataExactCardinalityCodec {
  struct DataExactCardinality {
    bytes[] annotations;
    bytes[] superClassExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataExactCardinality) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataExactCardinality, uint) {
    DataExactCardinality memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superClassExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superClassExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataExactCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superClassExpression(uint p, bytes bs, DataExactCardinality r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superClassExpression[ r.superClassExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataExactCardinality r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataExactCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superClassExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superClassExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataExactCardinality r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataExactCardinality r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superClassExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superClassExpression[i].length);
    return e;
  }
  function store(DataExactCardinality memory input, DataExactCardinality storage output) internal {
    output.annotations = input.annotations;
    output.superClassExpression = input.superClassExpression;
  }
  function nil() internal constant returns (DataExactCardinality r) {
    assembly { r := 0 }
  }
  function isNil(DataExactCardinality x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectPropertyCodec {
  struct ObjectProperty {
    bytes[] annotations;
    bytes[] superObjectPropertyExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectProperty) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectProperty, uint) {
    ObjectProperty memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superObjectPropertyExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superObjectPropertyExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superObjectPropertyExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superObjectPropertyExpression(uint p, bytes bs, ObjectProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superObjectPropertyExpression[ r.superObjectPropertyExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectProperty r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superObjectPropertyExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superObjectPropertyExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(ObjectProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectProperty r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superObjectPropertyExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superObjectPropertyExpression[i].length);
    return e;
  }
  function store(ObjectProperty memory input, ObjectProperty storage output) internal {
    output.annotations = input.annotations;
    output.superObjectPropertyExpression = input.superObjectPropertyExpression;
  }
  function nil() internal constant returns (ObjectProperty r) {
    assembly { r := 0 }
  }
  function isNil(ObjectProperty x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library InverseObjectPropertyCodec {
  struct InverseObjectProperty {
    bytes[] annotations;
    bytes[] superObjectPropertyExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (InverseObjectProperty) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (InverseObjectProperty, uint) {
    InverseObjectProperty memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superObjectPropertyExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superObjectPropertyExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superObjectPropertyExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, InverseObjectProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superObjectPropertyExpression(uint p, bytes bs, InverseObjectProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superObjectPropertyExpression[ r.superObjectPropertyExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(InverseObjectProperty r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(InverseObjectProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superObjectPropertyExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superObjectPropertyExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(InverseObjectProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(InverseObjectProperty r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superObjectPropertyExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superObjectPropertyExpression[i].length);
    return e;
  }
  function store(InverseObjectProperty memory input, InverseObjectProperty storage output) internal {
    output.annotations = input.annotations;
    output.superObjectPropertyExpression = input.superObjectPropertyExpression;
  }
  function nil() internal constant returns (InverseObjectProperty r) {
    assembly { r := 0 }
  }
  function isNil(InverseObjectProperty x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataPropertyCodec {
  struct DataProperty {
    bytes[] annotations;
    bytes[] superDataPropertyExpression;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataProperty) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataProperty, uint) {
    DataProperty memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_superDataPropertyExpression(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    r.superDataPropertyExpression = new bytes[](counters[1]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_superDataPropertyExpression(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_superDataPropertyExpression(uint p, bytes bs, DataProperty r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.superDataPropertyExpression[ r.superDataPropertyExpression.length - counters[1] ] = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataProperty r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    for(i=0; i<r.superDataPropertyExpression.length; i++) {
      p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.superDataPropertyExpression[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(DataProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataProperty r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    for(i=0; i<r.superDataPropertyExpression.length; i++) e+= 1 + _pb._sz_lendelim(r.superDataPropertyExpression[i].length);
    return e;
  }
  function store(DataProperty memory input, DataProperty storage output) internal {
    output.annotations = input.annotations;
    output.superDataPropertyExpression = input.superDataPropertyExpression;
  }
  function nil() internal constant returns (DataProperty r) {
    assembly { r := 0 }
  }
  function isNil(DataProperty x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library AnnotationCodec {
  struct Annotation {
    bytes[] annotations;
    bytes property;
    bytes value;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (Annotation) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (Annotation, uint) {
    Annotation memory r;
    uint[3] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_value(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_value(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, Annotation r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_property(uint p, bytes bs, Annotation r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.property = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_value(uint p, bytes bs, Annotation r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.value = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(Annotation r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(Annotation r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.value, p, bs);
    return p - offset;
  }
  function _encode_nested(Annotation r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(Annotation r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(r.value.length);
    return e;
  }
  function store(Annotation memory input, Annotation storage output) internal {
    output.annotations = input.annotations;
    output.property = input.property;
    output.value = input.value;
  }
  function nil() internal constant returns (Annotation r) {
    assembly { r := 0 }
  }
  function isNil(Annotation x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library IndividualCodec {
  struct Individual {
    bytes[] annotations;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (Individual) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (Individual, uint) {
    Individual memory r;
    uint[1] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, Individual r, uint[1] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(Individual r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(Individual r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(Individual r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(Individual r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    return e;
  }
  function store(Individual memory input, Individual storage output) internal {
    output.annotations = input.annotations;
  }
  function nil() internal constant returns (Individual r) {
    assembly { r := 0 }
  }
  function isNil(Individual x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library AnnotationPropertyCodec {
  struct AnnotationProperty {
    bytes[] annotations;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (AnnotationProperty) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (AnnotationProperty, uint) {
    AnnotationProperty memory r;
    uint[1] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, AnnotationProperty r, uint[1] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(AnnotationProperty r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(AnnotationProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    return p - offset;
  }
  function _encode_nested(AnnotationProperty r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(AnnotationProperty r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    return e;
  }
  function store(AnnotationProperty memory input, AnnotationProperty storage output) internal {
    output.annotations = input.annotations;
  }
  function nil() internal constant returns (AnnotationProperty r) {
    assembly { r := 0 }
  }
  function isNil(AnnotationProperty x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ClassAssertionCodec {
  struct ClassAssertion {
    bytes[] annotations;
    bytes class;
    bytes subject;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ClassAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ClassAssertion, uint) {
    ClassAssertion memory r;
    uint[3] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_class(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_class(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_class(uint p, bytes bs, ClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.class = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, ClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ClassAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ClassAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.class, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    return p - offset;
  }
  function _encode_nested(ClassAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ClassAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.class.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    return e;
  }
  function store(ClassAssertion memory input, ClassAssertion storage output) internal {
    output.annotations = input.annotations;
    output.class = input.class;
    output.subject = input.subject;
  }
  function nil() internal constant returns (ClassAssertion r) {
    assembly { r := 0 }
  }
  function isNil(ClassAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library NegativeClassAssertionCodec {
  struct NegativeClassAssertion {
    bytes[] annotations;
    bytes class;
    bytes subject;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (NegativeClassAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (NegativeClassAssertion, uint) {
    NegativeClassAssertion memory r;
    uint[3] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_class(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_class(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, NegativeClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_class(uint p, bytes bs, NegativeClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.class = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, NegativeClassAssertion r, uint[3] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(NegativeClassAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(NegativeClassAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.class, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    return p - offset;
  }
  function _encode_nested(NegativeClassAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(NegativeClassAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.class.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    return e;
  }
  function store(NegativeClassAssertion memory input, NegativeClassAssertion storage output) internal {
    output.annotations = input.annotations;
    output.class = input.class;
    output.subject = input.subject;
  }
  function nil() internal constant returns (NegativeClassAssertion r) {
    assembly { r := 0 }
  }
  function isNil(NegativeClassAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library ObjectPropertyAssertionCodec {
  struct ObjectPropertyAssertion {
    bytes[] annotations;
    bytes property;
    bytes subject;
    bytes target;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (ObjectPropertyAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (ObjectPropertyAssertion, uint) {
    ObjectPropertyAssertion memory r;
    uint[4] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, ObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_property(uint p, bytes bs, ObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.property = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, ObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  function _read_target(uint p, bytes bs, ObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[3] += 1;
    } else {
      r.target = x;
      if(counters[3] > 0) counters[3] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(ObjectPropertyAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(ObjectPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    p += _pb._encode_key(4, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.target, p, bs);
    return p - offset;
  }
  function _encode_nested(ObjectPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(ObjectPropertyAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    e += 1 + _pb._sz_lendelim(r.target.length);
    return e;
  }
  function store(ObjectPropertyAssertion memory input, ObjectPropertyAssertion storage output) internal {
    output.annotations = input.annotations;
    output.property = input.property;
    output.subject = input.subject;
    output.target = input.target;
  }
  function nil() internal constant returns (ObjectPropertyAssertion r) {
    assembly { r := 0 }
  }
  function isNil(ObjectPropertyAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library NegativeObjectPropertyAssertionCodec {
  struct NegativeObjectPropertyAssertion {
    bytes[] annotations;
    bytes property;
    bytes subject;
    bytes target;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (NegativeObjectPropertyAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (NegativeObjectPropertyAssertion, uint) {
    NegativeObjectPropertyAssertion memory r;
    uint[4] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, NegativeObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_property(uint p, bytes bs, NegativeObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.property = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, NegativeObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  function _read_target(uint p, bytes bs, NegativeObjectPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[3] += 1;
    } else {
      r.target = x;
      if(counters[3] > 0) counters[3] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(NegativeObjectPropertyAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(NegativeObjectPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    p += _pb._encode_key(4, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.target, p, bs);
    return p - offset;
  }
  function _encode_nested(NegativeObjectPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(NegativeObjectPropertyAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    e += 1 + _pb._sz_lendelim(r.target.length);
    return e;
  }
  function store(NegativeObjectPropertyAssertion memory input, NegativeObjectPropertyAssertion storage output) internal {
    output.annotations = input.annotations;
    output.property = input.property;
    output.subject = input.subject;
    output.target = input.target;
  }
  function nil() internal constant returns (NegativeObjectPropertyAssertion r) {
    assembly { r := 0 }
  }
  function isNil(NegativeObjectPropertyAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library DataPropertyAssertionCodec {
  struct DataPropertyAssertion {
    bytes[] annotations;
    bytes property;
    bytes subject;
    bytes target;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (DataPropertyAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (DataPropertyAssertion, uint) {
    DataPropertyAssertion memory r;
    uint[4] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, DataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_property(uint p, bytes bs, DataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.property = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, DataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  function _read_target(uint p, bytes bs, DataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[3] += 1;
    } else {
      r.target = x;
      if(counters[3] > 0) counters[3] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(DataPropertyAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(DataPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    p += _pb._encode_key(4, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.target, p, bs);
    return p - offset;
  }
  function _encode_nested(DataPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(DataPropertyAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    e += 1 + _pb._sz_lendelim(r.target.length);
    return e;
  }
  function store(DataPropertyAssertion memory input, DataPropertyAssertion storage output) internal {
    output.annotations = input.annotations;
    output.property = input.property;
    output.subject = input.subject;
    output.target = input.target;
  }
  function nil() internal constant returns (DataPropertyAssertion r) {
    assembly { r := 0 }
  }
  function isNil(DataPropertyAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
library NegativeDataPropertyAssertionCodec {
  struct NegativeDataPropertyAssertion {
    bytes[] annotations;
    bytes property;
    bytes subject;
    bytes target;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (NegativeDataPropertyAssertion) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (NegativeDataPropertyAssertion, uint) {
    NegativeDataPropertyAssertion memory r;
    uint[4] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, r, counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, r, counters);
      else throw;
    }
    p = offset;
    r.annotations = new bytes[](counters[0]);
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_annotations(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 3)
        p += _read_subject(p, bs, nil(), counters);
      else if(fieldId == 4)
        p += _read_target(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_annotations(uint p, bytes bs, NegativeDataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.annotations[ r.annotations.length - counters[0] ] = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_property(uint p, bytes bs, NegativeDataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.property = x;
      if(counters[1] > 0) counters[1] -= 1;
    }
    return sz;
  }
  function _read_subject(uint p, bytes bs, NegativeDataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[2] += 1;
    } else {
      r.subject = x;
      if(counters[2] > 0) counters[2] -= 1;
    }
    return sz;
  }
  function _read_target(uint p, bytes bs, NegativeDataPropertyAssertion r, uint[4] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[3] += 1;
    } else {
      r.target = x;
      if(counters[3] > 0) counters[3] -= 1;
    }
    return sz;
  }
  // Encoder section

  function encode(NegativeDataPropertyAssertion r) internal constant returns (bytes) {
    bytes memory bs = new bytes(_estimate(r));
    uint sz = _encode(r, 32, bs);
    assembly { mstore(bs, sz) }
    return bs;
  }
  function _encode(NegativeDataPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    uint i;
    for(i=0; i<r.annotations.length; i++) {
      p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
      p += _pb._encode_bytes(r.annotations[i], p, bs);
    }
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(3, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.subject, p, bs);
    p += _pb._encode_key(4, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.target, p, bs);
    return p - offset;
  }
  function _encode_nested(NegativeDataPropertyAssertion r, uint p, bytes bs)
      internal constant returns (uint) {
    uint offset = p;
    p += _pb._encode_varint(_estimate(r), p, bs);
    p += _encode(r, p, bs);
    return p - offset;
  }
  function _estimate(NegativeDataPropertyAssertion r) internal constant returns (uint) {
    uint e;
    uint i;
    for(i=0; i<r.annotations.length; i++) e+= 1 + _pb._sz_lendelim(r.annotations[i].length);
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(r.subject.length);
    e += 1 + _pb._sz_lendelim(r.target.length);
    return e;
  }
  function store(NegativeDataPropertyAssertion memory input, NegativeDataPropertyAssertion storage output) internal {
    output.annotations = input.annotations;
    output.property = input.property;
    output.subject = input.subject;
    output.target = input.target;
  }
  function nil() internal constant returns (NegativeDataPropertyAssertion r) {
    assembly { r := 0 }
  }
  function isNil(NegativeDataPropertyAssertion x) internal constant returns (bool r) {
    assembly { r := iszero(x) }
  }
}
pragma solidity ^0.4.0;

library _pb {

    enum WireType { Varint, Fixed64, LengthDelim, StartGroup, EndGroup, Fixed32 }

    // Decoders

    function _decode_uint32(uint p, bytes bs) internal constant returns (uint32, uint) {
      var (varint, sz) = _decode_varint(p, bs);
      return (uint32(varint), sz);
    }

    function _decode_uint64(uint p, bytes bs) internal constant returns (uint64, uint) {
      var (varint, sz) = _decode_varint(p, bs);
      return (uint64(varint), sz);
    }

    function _decode_int32(uint p, bytes bs) internal constant returns (int32, uint) {
      var (varint, sz) = _decode_varint(p, bs);
      int32 r; assembly { r := varint }
      return (r, sz);
    }

    function _decode_int64(uint p, bytes bs) internal constant returns (int64, uint) {
      var (varint, sz) = _decode_varint(p, bs);
      int32 r; assembly { r := varint }
      return (r, sz);
    }

    function _decode_sint32(uint p, bytes bs) internal constant returns (int32, uint) {
      var (varint, sz) = _decode_varints(p, bs);
      return (int32(varint), sz);
    }

    function _decode_sint64(uint p, bytes bs) internal constant returns (int64, uint) {
      var (varint, sz) = _decode_varints(p, bs);
      return (int64(varint), sz);
    }

    function _decode_bool(uint p, bytes bs) internal constant returns (bool, uint) {
      var (varint, sz) = _decode_varint(p, bs);
      if (varint == 0) return (false, sz);
      return (true, sz);
    }

    function _decode_string(uint p, bytes bs) internal constant returns (string, uint) {
      var (x, sz) = _decode_lendelim(p, bs);
      return (string(x), sz);
    }

    function _decode_bytes(uint p, bytes bs) internal constant returns (bytes, uint) {
      return _decode_lendelim(p, bs);
    }

    function _decode_key(uint p, bytes bs) internal constant returns (uint, WireType, uint) {
      var (x, n) = _decode_varint(p, bs);
      WireType typeId  = WireType(x & 7);
      uint fieldId = x / 8; //x >> 3;
      return (fieldId, typeId, n);
    }

    function _decode_varint(uint p, bytes bs) internal constant returns (uint, uint) {
      uint x = 0;
      uint sz = 0;
      assembly {
        let b := 0
        p     := add(bs, p)
        loop:
          b  := byte(0, mload(p))
          x  := or(x, mul(and(0x7f, b), exp(2, mul(7, sz))))
          sz := add(sz, 1)
          p  := add(p, 0x01)
          jumpi(loop, eq(0x80, and(b, 0x80)))
      }
      return (x, sz);
    }

    function _decode_varints(uint p, bytes bs) internal constant returns (int, uint) {
      var (u, sz) = _decode_varint(p, bs);
      int s;
      assembly {
        s := xor(div(u, 2), add(not(and(u, 1)), 1))
      }
      return (s, sz);
    }

    function _decode_uintf(uint p, bytes bs, uint sz) internal constant returns (uint, uint) {
      uint x = 0;
      assembly {
        let i := 0
        p     := add(bs, p)
        loop:
          jumpi(end, eq(i, sz))
          x := or(x, mul(byte(0, mload(p)), exp(2, mul(8, i))))
          p := add(p, 0x01)
          i := add(i, 1)
          jump(loop)
        end:
      }
      return (x, sz);
    }

    function _decode_fixed32(uint p, bytes bs) internal constant returns (uint32, uint) {
      var (x, sz) = _decode_uintf(p, bs, 4);
      return (uint32(x), sz);
    }

    function _decode_fixed64(uint p, bytes bs) internal constant returns (uint64, uint) {
      var (x, sz) = _decode_uintf(p, bs, 8);
      return (uint64(x), sz);
    }

    function _decode_sfixed32(uint p, bytes bs) internal constant returns (int32, uint) {
      var (x, sz) = _decode_uintf(p, bs, 4);
      int r; assembly { r := x }
      return (int32(r), sz);
    }

    function _decode_sfixed64(uint p, bytes bs) internal constant returns (int64, uint) {
      var (x, sz) = _decode_uintf(p, bs, 8);
      int r; assembly { r := x }
      return (int64(r), sz);
    }

    function _decode_lendelim(uint p, bytes bs) internal constant returns (bytes, uint) {
      var (len, sz) = _decode_varint(p, bs);
      bytes memory b = new bytes(len);
      assembly {
        let bptr  := add(b, 32)
        let count := 0
        p         := add(add(bs, p),sz)
        loop :
          jumpi(end, eq(count, len))
          mstore8(bptr, byte(0, mload(p)))
          p     := add(p, 1)
          bptr  := add(bptr, 1)
          count := add(count, 1)
          jump(loop)
        end:
      }
      return (b, sz+len);
    }

  // Encoders

  function _encode_key(uint x, WireType wt, uint p, bytes bs) internal constant returns (uint) {
    uint i;
    assembly {
      i := or(mul(x, 8), mod(wt, 8))
    }
    return _encode_varint(i, p, bs);
  }

  function _encode_varint(uint x, uint p, bytes bs) internal constant returns (uint) {
    uint sz = 0;
    assembly {
      let bsptr := add(bs, p)
      let byt := 0
      let pbyt := 0
      loop:
        byt := and(div(x, exp(2, mul(7, sz))), 0x7f)
        pbyt := and(div(x, exp(2, mul(7, add(sz, 1)))), 0x7f)
        jumpi(end, eq(pbyt, 0))
        mstore8(bsptr, or(0x80, byt))
        bsptr := add(bsptr, 1)
        sz := add(sz, 1)
        jump(loop)
      end:
        byt := and(div(x, exp(2, mul(7, sz))), 0x7f)
        mstore8(bsptr, byt)
        sz := add(sz, 1)
    }
    return sz;
  }

  function _encode_varints(int x, uint p, bytes bs) internal constant returns (uint) {
    uint encodedInt = _encode_zigzag(x);
    return _encode_varint(encodedInt, p, bs);
  }

  function _encode_bytes(bytes xs, uint p, bytes bs) internal constant returns (uint) {
    uint xsLength = xs.length;
    uint sz = _encode_varint(xsLength, p, bs);
    uint count = 0;
    assembly {
      let bsptr := add(bs, add(p, sz))
      let xsptr := add(xs, 32)
      loop:
        jumpi(end, eq(count, xsLength))
        mstore8(bsptr, byte(0, mload(xsptr)))
        bsptr := add(bsptr, 1)
        xsptr := add(xsptr, 1)
        count := add(count, 1)
        jump(loop)
      end:
    }
    return sz+count;
  }

  function _encode_uint32(uint32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_varint(x, p, bs);
  }

  function _encode_uint64(uint64 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_varint(x, p, bs);
  }

  function _encode_int32(int32 x, uint p, bytes bs) internal constant returns (uint) {
    uint64 twosComplement; // use signextend here?
    assembly { twosComplement := signextend(64, x) }
    return _encode_varint(twosComplement, p, bs);
  }

  function _encode_int64(int64 x, uint p, bytes bs) internal constant returns (uint) {
    uint64 twosComplement;
    assembly { twosComplement := x }
    return _encode_varint(twosComplement, p, bs);
  }

  function _encode_sint32(int32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_varints(x, p, bs);
  }

  function _encode_sint64(int64 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_varints(x, p, bs);
  }

  function _encode_string(string xs, uint p, bytes bs) internal constant returns (uint) {
    return  _encode_bytes(bytes(xs), p, bs);
  }

  function _encode_bool(bool x, uint p, bytes bs) internal constant returns (uint) {
    if (x) return _encode_varint(1, p, bs);
    else return _encode_varint(0, p, bs);
  }

  function _encode_fixed32(uint32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_uintf(x, p, bs, 4);
  }

  function _encode_fixed64(uint64 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_uintf(x, p, bs, 8);
  }

  function _encode_sfixed32(int32 x, uint p, bytes bs) internal constant returns (uint) {
    uint32 twosComplement;
    assembly { twosComplement := x }
    return _encode_uintf(twosComplement, p, bs, 4);
  }

  function _encode_sfixed64(int64 x, uint p, bytes bs) internal constant returns (uint) {
    uint64 twosComplement;
    assembly { twosComplement := x }
    return _encode_uintf(twosComplement, p, bs, 8);
  }

  function _encode_uintf(uint x, uint p, bytes bs, uint sz) internal constant returns (uint) {
    assembly {
      let bsptr := add(sz,add(bs, p))
      let count := sz
      loop:
        jumpi(end, eq(count, 0))
        bsptr := sub(bsptr, 1)
        mstore8(bsptr, byte(sub(32, count), x))
        count := sub(count, 1)
        jump(loop)
      end:
    }
    return sz;
  }

  function _encode_zigzag(int i) internal returns (uint) {
    if(i >= 0) return uint(i) * 2;
    else return uint(i * -2) - 1;
  }

  // Estimators

  function _sz_lendelim(uint i) internal constant returns (uint) {
    return i + _sz_varint(i);
  }

  function _sz_key(uint i) internal constant returns (uint) {
    if(i < 16) return 1;
    else if(i < 2048) return 2;
    else if(i < 262144) return 3;
    else throw;
  }

  function _sz_varint(uint i) internal constant returns (uint) {
    uint count = 1;
    assembly {
      loop:
        jumpi(end, lt(i, exp(2, mul(7, count))))
        count := add(count, 1)
        jump(loop)
      end:
    }
    return count;
  }

  function _sz_uint32(uint32 i) internal constant returns (uint) {
    return _sz_varint(i);
  }

  function _sz_uint64(uint64 i) internal constant returns (uint) {
    return _sz_varint(i);
  }

  function _sz_int32(int32 i) internal constant returns (uint) {
    if (i < 0) return 10;
    else return _sz_varint(uint32(i));
  }

  function _sz_int64(int64 i) internal constant returns (uint) {
    if (i < 0) return 10;
    else return _sz_varint(uint64(i));
  }

  function _sz_sint32(int32 i) internal constant returns (uint) {
    return _sz_varint(_encode_zigzag(i));
  }

  function _sz_sint64(int64 i) internal constant returns (uint) {
    return _sz_varint(_encode_zigzag(i));
  }

  // Soltype extensions

  function _decode_sol_bytesN_lower(uint8 n, uint p, bytes bs) internal constant returns (bytes32, uint) {
    uint r;
    var (len, sz) = _decode_varint(p, bs);
    if (len + sz != n + 3) throw;
    p += 3;
    assembly { r := mload(add(p,bs)) }
    for (uint i=n; i<32; i++)
      r /= 256;
    return (bytes32(r), n + 3);
  }
  function _decode_sol_bytesN(uint8 n, uint p, bytes bs) internal constant returns (bytes32, uint) {
    var (len, sz) = _decode_varint(p, bs);
    if (len + sz != n + 3) throw;
    p += 3;
    bytes32 acc;
    assembly {
      acc := mload(add(p, bs))
    }
    return (acc, n + 3);
  }

  function _decode_sol_address(uint p, bytes bs) internal constant returns (address, uint) {
    var (r, sz) = _decode_sol_bytesN_lower(20, p, bs);
    return (address(r), sz);
  }

  function _decode_sol_bool(uint p, bytes bs) internal constant returns (bool, uint) {
    var (r, sz) = _decode_sol_uintN(1, p, bs);
    if (r == 0) return (false, sz);
    return (true, sz);
  }

  function _decode_sol_uint(uint p, bytes bs) internal constant returns (uint, uint) {
    return _decode_sol_uint256(p, bs);
  }

  function _decode_sol_uintN(uint8 n, uint p, bytes bs) internal constant returns (uint, uint) {
    var (u, sz) = _decode_sol_bytesN_lower(n, p, bs);
    uint r; assembly { r := u }
    return (r, sz);
  }

  function _decode_sol_uint8(uint p, bytes bs) internal constant returns (uint8, uint) {
    var (r, sz) = _decode_sol_uintN(1, p, bs);
    return (uint8(r), sz);
  }

  function _decode_sol_uint16(uint p, bytes bs) internal constant returns (uint16, uint) {
    var (r, sz) = _decode_sol_uintN(2, p, bs);
    return (uint16(r), sz);
  }

  function _decode_sol_uint32(uint p, bytes bs) internal constant returns (uint32, uint) {
    var (r, sz) = _decode_sol_uintN(4, p, bs);
    return (uint32(r), sz);
  }

  function _decode_sol_uint64(uint p, bytes bs) internal constant returns (uint64, uint) {
    var (r, sz) = _decode_sol_uintN(8, p, bs);
    return (uint64(r), sz);
  }

  function _decode_sol_uint128(uint p, bytes bs) internal constant returns (uint128, uint) {
    var (r, sz) = _decode_sol_uintN(16, p, bs);
    return (uint128(r), sz);
  }

  function _decode_sol_uint256(uint p, bytes bs) internal constant returns (uint256, uint) {
    var (r, sz) = _decode_sol_uintN(32, p, bs);
    return (uint256(r), sz);
  }

  function _decode_sol_int(uint p, bytes bs) internal constant returns (int, uint) {
    return _decode_sol_int256(p, bs);
  }

  function _decode_sol_intN(uint8 n, uint p, bytes bs) internal constant returns (int, uint) {
    var (u, sz) = _decode_sol_bytesN_lower(n, p, bs);
    int r; assembly { r := u }
    return (r, sz);
  }

  function _decode_sol_int8(uint p, bytes bs) internal constant returns (int8, uint) {
    var (r, sz) = _decode_sol_intN(1, p, bs);
    return (int8(r), sz);
  }

  function _decode_sol_int16(uint p, bytes bs) internal constant returns (int16, uint) {
    var (r, sz) = _decode_sol_intN(2, p, bs);
    return (int16(r), sz);
  }

  function _decode_sol_int32(uint p, bytes bs) internal constant returns (int32, uint) {
    var (r, sz) = _decode_sol_intN(4, p, bs);
    return (int32(r), sz);
  }

  function _decode_sol_int64(uint p, bytes bs) internal constant returns (int64, uint) {
    var (r, sz) = _decode_sol_intN(8, p, bs);
    return (int64(r), sz);
  }

  function _decode_sol_int128(uint p, bytes bs) internal constant returns (int128, uint) {
    var (r, sz) = _decode_sol_intN(16, p, bs);
    return (int128(r), sz);
  }

  function _decode_sol_int256(uint p, bytes bs) internal constant returns (int256, uint) {
    var (r, sz) = _decode_sol_intN(32, p, bs);
    return (int256(r), sz);
  }

  function _decode_sol_bytes1(uint p, bytes bs) internal constant returns (bytes1, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(1, p, bs);
    return (bytes1(r), sz);
  }

  function _decode_sol_bytes2(uint p, bytes bs) internal constant returns (bytes2, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(2, p, bs);
    return (bytes2(r), sz);
  }

  function _decode_sol_bytes3(uint p, bytes bs) internal constant returns (bytes3, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(3, p, bs);
    return (bytes3(r), sz);
  }

  function _decode_sol_bytes4(uint p, bytes bs) internal constant returns (bytes4, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(4, p, bs);
    return (bytes4(r), sz);
  }

  function _decode_sol_bytes5(uint p, bytes bs) internal constant returns (bytes5, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(5, p, bs);
    return (bytes5(r), sz);
  }

  function _decode_sol_bytes6(uint p, bytes bs) internal constant returns (bytes6, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(6, p, bs);
    return (bytes6(r), sz);
  }

  function _decode_sol_bytes7(uint p, bytes bs) internal constant returns (bytes7, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(7, p, bs);
    return (bytes7(r), sz);
  }

  function _decode_sol_bytes8(uint p, bytes bs) internal constant returns (bytes8, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(8, p, bs);
    return (bytes8(r), sz);
  }

  function _decode_sol_bytes9(uint p, bytes bs) internal constant returns (bytes9, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(9, p, bs);
    return (bytes9(r), sz);
  }

  function _decode_sol_bytes10(uint p, bytes bs) internal constant returns (bytes10, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(10, p, bs);
    return (bytes10(r), sz);
  }

  function _decode_sol_bytes11(uint p, bytes bs) internal constant returns (bytes11, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(11, p, bs);
    return (bytes11(r), sz);
  }

  function _decode_sol_bytes12(uint p, bytes bs) internal constant returns (bytes12, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(12, p, bs);
    return (bytes12(r), sz);
  }

  function _decode_sol_bytes13(uint p, bytes bs) internal constant returns (bytes13, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(13, p, bs);
    return (bytes13(r), sz);
  }

  function _decode_sol_bytes14(uint p, bytes bs) internal constant returns (bytes14, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(14, p, bs);
    return (bytes14(r), sz);
  }

  function _decode_sol_bytes15(uint p, bytes bs) internal constant returns (bytes15, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(15, p, bs);
    return (bytes15(r), sz);
  }

  function _decode_sol_bytes16(uint p, bytes bs) internal constant returns (bytes16, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(16, p, bs);
    return (bytes16(r), sz);
  }

  function _decode_sol_bytes17(uint p, bytes bs) internal constant returns (bytes17, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(17, p, bs);
    return (bytes17(r), sz);
  }

  function _decode_sol_bytes18(uint p, bytes bs) internal constant returns (bytes18, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(18, p, bs);
    return (bytes18(r), sz);
  }

  function _decode_sol_bytes19(uint p, bytes bs) internal constant returns (bytes19, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(19, p, bs);
    return (bytes19(r), sz);
  }

  function _decode_sol_bytes20(uint p, bytes bs) internal constant returns (bytes20, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(20, p, bs);
    return (bytes20(r), sz);
  }

  function _decode_sol_bytes21(uint p, bytes bs) internal constant returns (bytes21, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(21, p, bs);
    return (bytes21(r), sz);
  }

  function _decode_sol_bytes22(uint p, bytes bs) internal constant returns (bytes22, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(22, p, bs);
    return (bytes22(r), sz);
  }

  function _decode_sol_bytes23(uint p, bytes bs) internal constant returns (bytes23, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(23, p, bs);
    return (bytes23(r), sz);
  }

  function _decode_sol_bytes24(uint p, bytes bs) internal constant returns (bytes24, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(24, p, bs);
    return (bytes24(r), sz);
  }

  function _decode_sol_bytes25(uint p, bytes bs) internal constant returns (bytes25, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(25, p, bs);
    return (bytes25(r), sz);
  }

  function _decode_sol_bytes26(uint p, bytes bs) internal constant returns (bytes26, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(26, p, bs);
    return (bytes26(r), sz);
  }

  function _decode_sol_bytes27(uint p, bytes bs) internal constant returns (bytes27, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(27, p, bs);
    return (bytes27(r), sz);
  }

  function _decode_sol_bytes28(uint p, bytes bs) internal constant returns (bytes28, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(28, p, bs);
    return (bytes28(r), sz);
  }

  function _decode_sol_bytes29(uint p, bytes bs) internal constant returns (bytes29, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(29, p, bs);
    return (bytes29(r), sz);
  }

  function _decode_sol_bytes30(uint p, bytes bs) internal constant returns (bytes30, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(30, p, bs);
    return (bytes30(r), sz);
  }

  function _decode_sol_bytes31(uint p, bytes bs) internal constant returns (bytes31, uint) {
    (bytes32 r, uint sz) = _decode_sol_bytesN(31, p, bs);
    return (bytes31(r), sz);
  }

  function _decode_sol_bytes32(uint p, bytes bs) internal constant returns (bytes32, uint) {
    return _decode_sol_bytesN(32, p, bs);
  }

  function _encode_sol_address(address x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 20, p, bs);
  }
  function _encode_sol_uint(uint x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 32, p, bs);
  }
  function _encode_sol_uint256(uint256 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 32, p, bs);
  }
  function _encode_sol_uint128(uint128 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 16, p, bs);
  }
  function _encode_sol_uint64(uint64 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 8, p, bs);
  }
  function _encode_sol_uint32(uint32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 4, p, bs);
  }
  function _encode_sol_uint16(uint16 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 2, p, bs);
  }
  function _encode_sol_uint8(uint8 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(x, 1, p, bs);
  }
  function _encode_sol_int(int x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_256(x), 32, p, bs);
  }
  function _encode_sol_int256(int256 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_256(x), 32, p, bs);
  }
  function _encode_sol_int128(int128 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_128(x), 16, p, bs);
  }
  function _encode_sol_int64(int64 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_64(x), 8, p, bs);
  }
  function _encode_sol_int32(int32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_32(x), 4, p, bs);
  }
  function _encode_sol_int16(int16 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_16(x), 2, p, bs);
  }
  function _encode_sol_int8(int8 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(_twos_complement_8(x), 1, p, bs);
  }
  function _encode_sol_bytes1(bytes1 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 1, p, bs);
  }
  function _encode_sol_bytes2(bytes2 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 2, p, bs);
  }
  function _encode_sol_bytes3(bytes3 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 3, p, bs);
  }
  function _encode_sol_bytes4(bytes4 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 4, p, bs);
  }
  function _encode_sol_bytes5(bytes5 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 5, p, bs);
  }
  function _encode_sol_bytes6(bytes6 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 6, p, bs);
  }
  function _encode_sol_bytes7(bytes7 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 7, p, bs);
  }
  function _encode_sol_bytes8(bytes8 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 8, p, bs);
  }
  function _encode_sol_bytes9(bytes9 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 9, p, bs);
  }
  function _encode_sol_bytes10(bytes10 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 10, p, bs);
  }
  function _encode_sol_bytes11(bytes11 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 11, p, bs);
  }
  function _encode_sol_bytes12(bytes12 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 12, p, bs);
  }
  function _encode_sol_bytes13(bytes13 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 13, p, bs);
  }
  function _encode_sol_bytes14(bytes14 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 14, p, bs);
  }
  function _encode_sol_bytes15(bytes15 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 15, p, bs);
  }
  function _encode_sol_bytes16(bytes16 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 16, p, bs);
  }
  function _encode_sol_bytes17(bytes17 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 17, p, bs);
  }
  function _encode_sol_bytes18(bytes18 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 18, p, bs);
  }
  function _encode_sol_bytes19(bytes19 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 19, p, bs);
  }
  function _encode_sol_bytes20(bytes20 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 20, p, bs);
  }
  function _encode_sol_bytes21(bytes21 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 21, p, bs);
  }
  function _encode_sol_bytes22(bytes22 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 22, p, bs);
  }
  function _encode_sol_bytes23(bytes23 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 23, p, bs);
  }
  function _encode_sol_bytes24(bytes24 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 24, p, bs);
  }
  function _encode_sol_bytes25(bytes25 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 25, p, bs);
  }
  function _encode_sol_bytes26(bytes26 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 26, p, bs);
  }
  function _encode_sol_bytes27(bytes27 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 27, p, bs);
  }
  function _encode_sol_bytes28(bytes28 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 28, p, bs);
  }
  function _encode_sol_bytes29(bytes29 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 29, p, bs);
  }
  function _encode_sol_bytes30(bytes30 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 30, p, bs);
  }
  function _encode_sol_bytes31(bytes31 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 31, p, bs);
  }
  function _encode_sol_bytes32(bytes32 x, uint p, bytes bs) internal constant returns (uint) {
    return _encode_sol(uint(x), 32, p, bs);
  }

  function _encode_sol_header(uint sz, uint p, bytes bs) internal constant returns (uint) {
    uint offset = p;
    p += _encode_varint(sz + 2, p, bs); // length of (payload + 1b key + 1b inner length)
    p += _encode_key(1, WireType.LengthDelim, p, bs);
    p += _encode_varint(sz, p, bs);
    return p - offset;
  }
  function _encode_sol(uint x, uint sz, uint p, bytes bs) internal constant returns (uint) {
    uint offset = p;
    p += _encode_sol_header(sz, p, bs);
    p += _encode_sol_raw(x, p, bs, sz);
    return p - offset;
  }
  function _encode_sol_raw(uint x, uint p, bytes bs, uint sz) internal constant returns (uint) {
    assembly {
      let bsptr := add(bs, p)
      let count := sz
      loop:
        jumpi(end, eq(count, 0))
        mstore8(bsptr, byte(sub(32, count), x))
        bsptr := add(bsptr, 1)
        count := sub(count, 1)
        jump(loop)
      end:
    }
    return sz;
  }
  function _twos_complement_256(int256 x) internal constant returns (uint256) {
    uint256 r; assembly { r := x }
    return r;
  }
  function _twos_complement_128(int128 x) internal constant returns (uint128) {
    uint128 r; assembly { r := x }
    return r;
  }
  function _twos_complement_64(int64 x) internal constant returns (uint64) {
    uint64 r; assembly { r := x }
    return r;
  }
  function _twos_complement_32(int32 x) internal constant returns (uint32) {
    uint32 r; assembly { r := x }
    return r;
  }
  function _twos_complement_16(int16 x) internal constant returns (uint16) {
    uint16 r; assembly { r := x }
    return r;
  }
  function _twos_complement_8(int8 x) internal constant returns (uint8) {
    uint8 r; assembly { r := x }
    return r;
  }

}

