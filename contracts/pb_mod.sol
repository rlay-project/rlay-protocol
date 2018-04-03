pragma solidity ^0.4.0;

contract AnnotationStore {
  mapping (bytes32 => AnnotationCodec.Annotation) public annotations;

  event AnnotationStored(bytes cid);

  function storeAnnotation(bytes property, string value) returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    annotations[hash] = ann;

    var cid = wrapInCid(hash);
    AnnotationStored(cid);
    return cid;
  }

  function retrieveAnnotation(bytes cid) public constant returns (bytes, string) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    return (ann.property, ann.value);
  }

  function retrieveAnnotationExists(bytes cid) public constant returns (bool exists) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    // TODO
    assembly {
      exists := and(sload(ann_slot), 0)
    }
  }

  function calculateHashAnnotation(bytes property, string value) returns (bytes32) {
    var ann = AnnotationCodec.Annotation(property, value);
    return hashAnnotation(ann);
  }

  function calculateCidAnnotation(bytes property, string value) returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    return wrapInCid(hash);
  }

  function cidPrefix() returns (bytes5) {
    // annotation cid prefix
    bytes5 cid = 0x01f0011b20;

    return cid;
  }

  function wrapInCid(bytes32 hash) returns (bytes) {
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

  function unwrapCid(bytes cid) returns (bytes32) {
    bytes32 hash;
    assembly {
      mload(add(add(cid, 32), 5))
      =: hash
    }

    return hash;
  }

  function hashAnnotation(AnnotationCodec.Annotation ann) private returns (bytes32) {
    var enc = AnnotationCodec.encode(ann);
    var hash = keccak256(enc);

    return hash;
  }
}

contract HexTool
{
    bytes input;

    function setInput(bytes enterBytes){
        input = enterBytes;
    }

    function getInput()
    returns (bytes)
    {
        return input;
    }

    function setInputFromHex(string hex_str)
    {
        input = hexStrToBytes(hex_str);
    }

    function hexStrToBytes(string hex_str) constant
    returns (bytes)
    {
        //Check hex string is valid
        if (bytes(hex_str)[0]!='0' ||
            bytes(hex_str)[1]!='x' ||
            bytes(hex_str).length%2!=0 ||
            bytes(hex_str).length<4)
            {
                throw;
            }

        bytes memory bytes_array = new bytes((bytes(hex_str).length-2)/2);

        for (uint i=2;i<bytes(hex_str).length;i+=2)
        {
            uint tetrad1=16;
            uint tetrad2=16;

            //left digit
            if (uint(bytes(hex_str)[i])>=48 &&uint(bytes(hex_str)[i])<=57)
                tetrad1=uint(bytes(hex_str)[i])-48;

            //right digit
            if (uint(bytes(hex_str)[i+1])>=48 &&uint(bytes(hex_str)[i+1])<=57)
                tetrad2=uint(bytes(hex_str)[i+1])-48;

            //left A->F
            if (uint(bytes(hex_str)[i])>=65 &&uint(bytes(hex_str)[i])<=70)
                tetrad1=uint(bytes(hex_str)[i])-65+10;

            //right A->F
            if (uint(bytes(hex_str)[i+1])>=65 &&uint(bytes(hex_str)[i+1])<=70)
                tetrad2=uint(bytes(hex_str)[i+1])-65+10;

            //left a->f
            if (uint(bytes(hex_str)[i])>=97 &&uint(bytes(hex_str)[i])<=102)
                tetrad1=uint(bytes(hex_str)[i])-97+10;

            //right a->f
            if (uint(bytes(hex_str)[i+1])>=97 &&uint(bytes(hex_str)[i+1])<=102)
                tetrad2=uint(bytes(hex_str)[i+1])-97+10;

            //Check all symbols are allowed
            if (tetrad1==16 || tetrad2==16)
                throw;

            bytes_array[i/2-1]=byte(16*tetrad1+tetrad2);
        }

        return bytes_array;
    }
}

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


/* library pb { */
  /* struct Annotation { */
    /* bytes property; */
    /* string value; */
  /* } */
  /* function decodeAnnotation(bytes bs) internal constant returns(Annotation) { */
    /* Annotation memory r; */
    /* var x = AnnotationCodec.decode(bs); */
    /* assembly { r := x } */
    /* return r; */
  /* } */
  /* function encodeAnnotation(Annotation x) internal constant returns(bytes) { */
    /* AnnotationCodec.Annotation memory xx; */
    /* assembly { xx := x } */
    /* return AnnotationCodec.encode(xx); */
  /* } */
  /* function storeAnnotation(Annotation memory input, Annotation storage output) */
      /* internal constant { */
    /* AnnotationCodec.Annotation memory input2; */
    /* AnnotationCodec.Annotation storage output2; */
    /* assembly { */
      /* input2 := input */
      /* output2 := output */
    /* } */
    /* return AnnotationCodec.store(input2, output2); */
  /* } */
/* } */
library AnnotationCodec {
  struct Annotation {
    bytes property;
    string value;
  }
  // Decoder section

  function decode(bytes bs) internal constant returns (Annotation) {
    var (x,) = _decode(32, bs, bs.length);
    return x;
  }

  function _decode(uint p, bytes bs, uint sz)
      internal constant returns (Annotation, uint) {
    Annotation memory r;
    uint[2] memory counters;
    uint fieldId;
    _pb.WireType wireType;
    uint bytesRead;
    uint offset = p;
    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_property(p, bs, r, counters);
      else if(fieldId == 2)
        p += _read_value(p, bs, r, counters);
      else throw;
    }
    p = offset;

    while(p < offset+sz) {
      (fieldId, wireType, bytesRead) = _pb._decode_key(p, bs);
      p += bytesRead;
      if(fieldId == 1)
        p += _read_property(p, bs, nil(), counters);
      else if(fieldId == 2)
        p += _read_value(p, bs, nil(), counters);
      else throw;
    }
    return (r, sz);
  }

  function _read_property(uint p, bytes bs, Annotation r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_bytes(p, bs);
    if(isNil(r)) {
      counters[0] += 1;
    } else {
      r.property = x;
      if(counters[0] > 0) counters[0] -= 1;
    }
    return sz;
  }
  function _read_value(uint p, bytes bs, Annotation r, uint[2] counters)
      internal constant returns (uint) {
    var (x, sz) = _pb._decode_string(p, bs);
    if(isNil(r)) {
      counters[1] += 1;
    } else {
      r.value = x;
      if(counters[1] > 0) counters[1] -= 1;
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
    p += _pb._encode_key(1, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_bytes(r.property, p, bs);
    p += _pb._encode_key(2, _pb.WireType.LengthDelim, p, bs);
    p += _pb._encode_string(r.value, p, bs);
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
    e += 1 + _pb._sz_lendelim(r.property.length);
    e += 1 + _pb._sz_lendelim(bytes(r.value).length);
    return e;
  }
  function store(Annotation memory input, Annotation storage output) internal {
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
    var (r, sz) = _decode_sol_bytesN(1, p, bs);
    return (bytes1(r), sz);
  }

  function _decode_sol_bytes2(uint p, bytes bs) internal constant returns (bytes2, uint) {
    var (r, sz) = _decode_sol_bytesN(2, p, bs);
    return (bytes2(r), sz);
  }

  function _decode_sol_bytes3(uint p, bytes bs) internal constant returns (bytes3, uint) {
    var (r, sz) = _decode_sol_bytesN(3, p, bs);
    return (bytes3(r), sz);
  }

  function _decode_sol_bytes4(uint p, bytes bs) internal constant returns (bytes4, uint) {
    var (r, sz) = _decode_sol_bytesN(4, p, bs);
    return (bytes4(r), sz);
  }

  function _decode_sol_bytes5(uint p, bytes bs) internal constant returns (bytes5, uint) {
    var (r, sz) = _decode_sol_bytesN(5, p, bs);
    return (bytes5(r), sz);
  }

  function _decode_sol_bytes6(uint p, bytes bs) internal constant returns (bytes6, uint) {
    var (r, sz) = _decode_sol_bytesN(6, p, bs);
    return (bytes6(r), sz);
  }

  function _decode_sol_bytes7(uint p, bytes bs) internal constant returns (bytes7, uint) {
    var (r, sz) = _decode_sol_bytesN(7, p, bs);
    return (bytes7(r), sz);
  }

  function _decode_sol_bytes8(uint p, bytes bs) internal constant returns (bytes8, uint) {
    var (r, sz) = _decode_sol_bytesN(8, p, bs);
    return (bytes8(r), sz);
  }

  function _decode_sol_bytes9(uint p, bytes bs) internal constant returns (bytes9, uint) {
    var (r, sz) = _decode_sol_bytesN(9, p, bs);
    return (bytes9(r), sz);
  }

  function _decode_sol_bytes10(uint p, bytes bs) internal constant returns (bytes10, uint) {
    var (r, sz) = _decode_sol_bytesN(10, p, bs);
    return (bytes10(r), sz);
  }

  function _decode_sol_bytes11(uint p, bytes bs) internal constant returns (bytes11, uint) {
    var (r, sz) = _decode_sol_bytesN(11, p, bs);
    return (bytes11(r), sz);
  }

  function _decode_sol_bytes12(uint p, bytes bs) internal constant returns (bytes12, uint) {
    var (r, sz) = _decode_sol_bytesN(12, p, bs);
    return (bytes12(r), sz);
  }

  function _decode_sol_bytes13(uint p, bytes bs) internal constant returns (bytes13, uint) {
    var (r, sz) = _decode_sol_bytesN(13, p, bs);
    return (bytes13(r), sz);
  }

  function _decode_sol_bytes14(uint p, bytes bs) internal constant returns (bytes14, uint) {
    var (r, sz) = _decode_sol_bytesN(14, p, bs);
    return (bytes14(r), sz);
  }

  function _decode_sol_bytes15(uint p, bytes bs) internal constant returns (bytes15, uint) {
    var (r, sz) = _decode_sol_bytesN(15, p, bs);
    return (bytes15(r), sz);
  }

  function _decode_sol_bytes16(uint p, bytes bs) internal constant returns (bytes16, uint) {
    var (r, sz) = _decode_sol_bytesN(16, p, bs);
    return (bytes16(r), sz);
  }

  function _decode_sol_bytes17(uint p, bytes bs) internal constant returns (bytes17, uint) {
    var (r, sz) = _decode_sol_bytesN(17, p, bs);
    return (bytes17(r), sz);
  }

  function _decode_sol_bytes18(uint p, bytes bs) internal constant returns (bytes18, uint) {
    var (r, sz) = _decode_sol_bytesN(18, p, bs);
    return (bytes18(r), sz);
  }

  function _decode_sol_bytes19(uint p, bytes bs) internal constant returns (bytes19, uint) {
    var (r, sz) = _decode_sol_bytesN(19, p, bs);
    return (bytes19(r), sz);
  }

  function _decode_sol_bytes20(uint p, bytes bs) internal constant returns (bytes20, uint) {
    var (r, sz) = _decode_sol_bytesN(20, p, bs);
    return (bytes20(r), sz);
  }

  function _decode_sol_bytes21(uint p, bytes bs) internal constant returns (bytes21, uint) {
    var (r, sz) = _decode_sol_bytesN(21, p, bs);
    return (bytes21(r), sz);
  }

  function _decode_sol_bytes22(uint p, bytes bs) internal constant returns (bytes22, uint) {
    var (r, sz) = _decode_sol_bytesN(22, p, bs);
    return (bytes22(r), sz);
  }

  function _decode_sol_bytes23(uint p, bytes bs) internal constant returns (bytes23, uint) {
    var (r, sz) = _decode_sol_bytesN(23, p, bs);
    return (bytes23(r), sz);
  }

  function _decode_sol_bytes24(uint p, bytes bs) internal constant returns (bytes24, uint) {
    var (r, sz) = _decode_sol_bytesN(24, p, bs);
    return (bytes24(r), sz);
  }

  function _decode_sol_bytes25(uint p, bytes bs) internal constant returns (bytes25, uint) {
    var (r, sz) = _decode_sol_bytesN(25, p, bs);
    return (bytes25(r), sz);
  }

  function _decode_sol_bytes26(uint p, bytes bs) internal constant returns (bytes26, uint) {
    var (r, sz) = _decode_sol_bytesN(26, p, bs);
    return (bytes26(r), sz);
  }

  function _decode_sol_bytes27(uint p, bytes bs) internal constant returns (bytes27, uint) {
    var (r, sz) = _decode_sol_bytesN(27, p, bs);
    return (bytes27(r), sz);
  }

  function _decode_sol_bytes28(uint p, bytes bs) internal constant returns (bytes28, uint) {
    var (r, sz) = _decode_sol_bytesN(28, p, bs);
    return (bytes28(r), sz);
  }

  function _decode_sol_bytes29(uint p, bytes bs) internal constant returns (bytes29, uint) {
    var (r, sz) = _decode_sol_bytesN(29, p, bs);
    return (bytes29(r), sz);
  }

  function _decode_sol_bytes30(uint p, bytes bs) internal constant returns (bytes30, uint) {
    var (r, sz) = _decode_sol_bytesN(30, p, bs);
    return (bytes30(r), sz);
  }

  function _decode_sol_bytes31(uint p, bytes bs) internal constant returns (bytes31, uint) {
    var (r, sz) = _decode_sol_bytesN(31, p, bs);
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

