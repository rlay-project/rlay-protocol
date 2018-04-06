var OntologyStorage = artifacts.require("./OntologyStorage.sol");

contract('OntologyStorage', (accounts) => {
  describe('Annotation', () => {
    it("should hash 'Organization' label annotation correctly", () => {
      return OntologyStorage.deployed().then(function(instance) {
        return instance.calculateCidAnnotation.call('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization');
      }).then(function(calculatedCid) {
        assert.equal('0x01f0011b2003b86a4b4fb1f1dce175d2d13e2fe026a43cf522d5880c5936b2b2db7e915aac', calculatedCid);
      });
    });

    it("should be able to retrieve stored Annotation", () => {
      return OntologyStorage.deployed().then(function(instance) {
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

    it("should be able to check for an existing contract with isStoredAnnotation", () => {
      return OntologyStorage.deployed().then(function(instance) {
        return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
        .then(function(storeTx) {
          const storedCid = storeTx.logs[0].args._cid;
          return instance.isStoredAnnotation.call(storedCid);
        });
      }).then(function(annotationExists) {
        assert.equal(true, annotationExists);
      });
    });

    it("should be able to check for a non-existing contract with isStoredAnnotation", () => {
      return OntologyStorage.deployed().then(function(instance) {
        return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
        .then(function(storeTx) {
          return instance.isStoredAnnotation.call('0x00');
        });
      }).then(function(annotationExists) {
        assert.equal(false, annotationExists);
      });
    });
  });

  describe('Class', () => {
    it("should hash class with 'Organization' label annotation correctly", () => {
      return OntologyStorage.deployed().then(function(instance) {
        return instance.calculateCidClass.call('0x01f0011b2003b86a4b4fb1f1dce175d2d13e2fe026a43cf522d5880c5936b2b2db7e915aac', '0x00000000000000000000000000000000');
      }).then((calculatedCid) => {
        assert.equal('0x01f1011b20f876cf456acb9c77b674d1ded27d6bf97d65dd1a772864a53613f9b3643f5ee7', calculatedCid);
      });
    });

    it("should hash class with sub_class_of_class correctly", () => {
      return OntologyStorage.deployed().then(function(instance) {
        return instance.calculateCidClass.call('0x00000000000000000000000000000000', '0x01f1011b20f876cf456acb9c77b674d1ded27d6bf97d65dd1a772864a53613f9b3643f5ee7');
      }).then((calculatedCid) => {
        assert.equal('0x01f1011b2076de0fc76e7a0bec208fe440593a0cf091ef9c0954792e3ca5cb9ccf5d89b460', calculatedCid);
      });
    });

    it("should correctly check for non-existent annotation dependencies", () => {
      return OntologyStorage.deployed().then((instance) => {
        return instance.storeClass('0x01f0011b2003b86a4b4fb1f1dce175d2d13e2fe026a43cf522d5880c5936b2b2db7e915aac', '0x00000000000000000000000000000000');
      })
        .catch((err) => {
          assert.equal('VM Exception while processing transaction: revert', err.message);
        });
    });

    it("should store class with existing annotation", () => {
      return OntologyStorage.deployed().then((instance) => {
        return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
        .then((storeTx) => {
          const storedCid = storeTx.logs[0].args._cid;
          return storedCid;
        }).then((annotationCid) => {
          return instance.storeClass(annotationCid, '0x00000000000000000000000000000000');
        }).then((storeClassTx) => {
          const storedCid = storeClassTx.logs[0].args._cid;
          assert.equal('0x01f1011b20f876cf456acb9c77b674d1ded27d6bf97d65dd1a772864a53613f9b3643f5ee7', storedCid);
        });
      })
    });

    it("should be able to check for stored class with isStoredClass", () => {
      return OntologyStorage.deployed().then((instance) => {
        return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
        .then((storeTx) => {
          const storedCid = storeTx.logs[0].args._cid;
          return storedCid;
        }).then((annotationCid) => {
          return instance.storeClass(annotationCid, '0x00000000000000000000000000000000');
        }).then((storeClassTx) => {
          const storedCid = storeClassTx.logs[0].args._cid;
          return storedCid;
        }).then((classCid) => {
          return instance.isStoredClass.call(classCid);
        }).then((stored) => {
          assert.equal(true, stored);
        });
      })
    });

    it("should be able to check for unstored class with isStoredClass", () => {
      return OntologyStorage.deployed().then((instance) => {
        return instance.isStoredClass.call('0x00000000000000000000000000000000');
      }).then((stored) => {
        assert.equal(false, stored);
      });
    });

    // TODO: returns unparsed ABI; not supported in web3 yet?
    it.skip("should be able to retrieve class with retrieveClass", () => {
      return OntologyStorage.deployed().then((instance) => {
        return instance.storeAnnotation('0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511', 'Organization')
        .then((storeTx) => {
          const storedCid = storeTx.logs[0].args._cid;
          return storedCid;
        }).then((annotationCid) => {
          return instance.storeClass(annotationCid, '0x00000000000000000000000000000000');
        }).then((storeClassTx) => {
          const storedCid = storeClassTx.logs[0].args._cid;
          return storedCid;
        }).then((classCid) => {
          return instance.retrieveClass.call(classCid);
        }).then((classParts) => {
          console.log(classParts);
        });
      })
    });
  });
});
