var AnnotationStorage = artifacts.require("./AnnotationStorage.sol");

contract('AnnotationStorage', function(accounts) {
  it("should hash 'Organization' label annotation correctly", function() {
    return AnnotationStorage.deployed().then(function(instance) {
      return instance.calculateCidAnnotation.call('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization');
    }).then(function(calculatedCid) {
      assert.equal('0x01f0011b2003b86a4b4fb1f1dce175d2d13e2fe026a43cf522d5880c5936b2b2db7e915aac', calculatedCid);
    });
  });

  it("should be able to retrieve stored Annotation", function() {
    return AnnotationStorage.deployed().then(function(instance) {
      return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
      .then(function(storeTx) {
        const storedCid = storeTx.logs[0].args._cid;
        return instance.retrieveAnnotation.call(storedCid);
      });
    }).then(function(annotation) {
      const [propertyHash, value] = annotation;
      assert.equal('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', propertyHash);
      assert.equal('Organization', value);
    });
  });

  it("should be able to check for an existing contract with isStoredAnnotation", function() {
    return AnnotationStorage.deployed().then(function(instance) {
      return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
      .then(function(storeTx) {
        const storedCid = storeTx.logs[0].args._cid;
        return instance.isStoredAnnotation.call(storedCid);
      });
    }).then(function(annotationExists) {
      assert.equal(true, annotationExists);
    });
  });

  it("should be able to check for a non-existing contract with isStoredAnnotation", function() {
    return AnnotationStorage.deployed().then(function(instance) {
      return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
      .then(function(storeTx) {
        return instance.isStoredAnnotation.call('0x00');
      });
    }).then(function(annotationExists) {
      assert.equal(false, annotationExists);
    });
  });
});
