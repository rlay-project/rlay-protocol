var AnnotationStore = artifacts.require("./AnnotationStore.sol");

contract('AnnotationStore', function(accounts) {
  it("should hash 'Organization' label annotation correctly", function() {
    return AnnotationStore.deployed().then(function(instance) {
      return instance.calculateCidAnnotation.call('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization');
    }).then(function(calculatedCid) {
      assert.equal('0x01f0011b2003b86a4b4fb1f1dce175d2d13e2fe026a43cf522d5880c5936b2b2db7e915aac', calculatedCid);
    });
  });

  it("should be able to retrieve stored Annotation", function() {
    return AnnotationStore.deployed().then(function(instance) {
      return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
      .then(function(storeTx) {
        const storedCid = storeTx.logs[0].args.cid;
        return instance.retrieveAnnotation.call(storedCid);
      });
    }).then(function(annotation) {
      const [propertyHash, value] = annotation;
      assert.equal('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', propertyHash);
      assert.equal('Organization', value);
    });
  });
});
