pragma solidity ^0.4.0;

contract AnnotationStore {
  mapping (bytes32 => AnnotationCodec.Annotation) public annotations;

  function storeAnnotation(bytes property, string value) returns (bytes) {
    var ann = AnnotationCodec.Annotation(property, value);
    var hash = hashAnnotation(ann);
    /* var cid = wrapInCid(hash); */
    annotations[hash] = ann;

    return wrapInCid(hash);
  }

  function retrieveAnnotation(bytes cid) public constant returns (bytes, string) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    return (ann.property, ann.value);
  }

  function retrieveAnnotationExists(bytes cid) public constant returns (bool) {
    bytes32 hash = unwrapCid(cid);
    var ann = annotations[hash];

    return !AnnotationCodec.isNil(ann);
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
