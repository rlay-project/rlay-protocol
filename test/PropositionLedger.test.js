var OntologyStorage = artifacts.require("./OntologyStorage");
var PropositionLedger = artifacts.require("./PropositionLedger");
var SpreadToken = artifacts.require("./SpreadToken");

const nullValue = "0x00000000000000000000000000000000";

contract("PropositionLedger", accounts => {
  it("should be able to submit a proposition", () => {
    const tokenContractDeployed = SpreadToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      SpreadToken.address,
      OntologyStorage.address
    );

    return Promise.all([
      tokenContractDeployed,
      ontologyContractDeployed,
      propositionLedgerContractDeployed
    ]).then(([tokenContract, ontologyContract, propositionLedgerContract]) => {
      return tokenContract
        .approve(propositionLedgerContract.address, 1000, { from: accounts[0] })
        .then(approval => {
          return ontologyContract
            .storeAnnotation(
              "0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511",
              "Organization"
            )
            .then(storeTx => {
              const storedCid = storeTx.logs[0].args._cid;
              return storedCid;
            })
            .then(annotationCid => {
              return ontologyContract.storeClass(annotationCid, nullValue);
            })
            .then(storeClassTx => {
              const storedCid = storeClassTx.logs[0].args._cid;
              return storedCid;
            })
            .then(classCid => {
              return ontologyContract.storeIndividual(
                nullValue,
                classCid,
                nullValue
              );
            })
            .then(storeIndividualTx => {
              const storedCid = storeIndividualTx.logs[0].args._cid;
              return storedCid;
            });
        })
        .then(propositionCid => {
          return propositionLedgerContract.submitProposition(
            propositionCid,
            10,
            { from: accounts[0] }
          );
        });
    });
  });

  it("should not be possible to submit a proposition with insufficient funds", () => {
    const tokenContractDeployed = SpreadToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      SpreadToken.address,
      OntologyStorage.address
    );

    return Promise.all([
      tokenContractDeployed,
      ontologyContractDeployed,
      propositionLedgerContractDeployed
    ]).then(([tokenContract, ontologyContract, propositionLedgerContract]) => {
      return tokenContract
        .approve(propositionLedgerContract.address, 1000, { from: accounts[0] })
        .then(approval => {
          return ontologyContract
            .storeAnnotation(
              "0x16200f5e42c8a237dca15459911ee1fc6a8fe51a274917c184887e0d329af6001511",
              "Organization"
            )
            .then(storeTx => {
              const storedCid = storeTx.logs[0].args._cid;
              return storedCid;
            })
            .then(annotationCid => {
              return ontologyContract.storeClass(annotationCid, nullValue);
            })
            .then(storeClassTx => {
              const storedCid = storeClassTx.logs[0].args._cid;
              return storedCid;
            })
            .then(classCid => {
              return ontologyContract.storeIndividual(
                nullValue,
                classCid,
                nullValue
              );
            })
            .then(storeIndividualTx => {
              const storedCid = storeIndividualTx.logs[0].args._cid;
              return storedCid;
            });
        })
        .then(propositionCid => {
          return propositionLedgerContract
            .submitProposition(propositionCid, 999999, { from: accounts[0] })
            .catch(err => {
              assert.equal(
                "VM Exception while processing transaction: revert",
                err.message
              );
            });
        });
    });
  });

  it("should not be possible to submit a proposition with unknown proposition", () => {
    const tokenContractDeployed = SpreadToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      SpreadToken.address,
      OntologyStorage.address
    );

    return Promise.all([
      tokenContractDeployed,
      ontologyContractDeployed,
      propositionLedgerContractDeployed
    ]).then(([tokenContract, ontologyContract, propositionLedgerContract]) => {
      return tokenContract
        .approve(propositionLedgerContract.address, 1000, { from: accounts[0] })
        .then(() => {
          return propositionLedgerContract
            .submitProposition("0x0000000000", 10, { from: accounts[0] })
            .catch(err => {
              assert.equal(
                "VM Exception while processing transaction: revert",
                err.message
              );
            });
        });
    });
  });
});
