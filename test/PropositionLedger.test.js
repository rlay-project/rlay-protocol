var ethers = require("ethers");
var OntologyStorage = artifacts.require("./OntologyStorage");
var PropositionLedger = artifacts.require("./PropositionLedger");
var RlayToken = artifacts.require("./RlayToken");

const nullValue = "0x00000000000000000000000000000000";

var buildEthersContract = (address, accounts) => {
  const abi = OntologyStorage.abi;
  const privateKey =
    "0x1c1a965a9fb6beb254bafa72588797b0268f43783cffbfa41659f47ae77a3529";
  const provider = new ethers.providers.JsonRpcProvider();
  const wallet = new ethers.Wallet(privateKey, provider);
  const contract = new ethers.Contract(address, abi, wallet);

  return {
    contract: contract,
    provider: provider
  };
};

var callEthersFunction = (contract, provider, fnName, args) => {
  return contract[fnName](...args)
    .then(res => contract.provider.getTransactionReceipt(res.hash))
    .then(res =>
      contract.interface.functions[fnName].parseResult(res.logs[0].data)
    );
};

contract("PropositionLedger", accounts => {
  const { contract, provider } = buildEthersContract(
    OntologyStorage.address,
    accounts
  );

  it("should be able to submit a proposition", () => {
    const tokenContractDeployed = RlayToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      RlayToken.address,
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
              const class_stored = callEthersFunction(
                contract,
                provider,
                "storeClass",
                [[annotationCid], []]
              );
              return class_stored.then(([classCid]) =>
                callEthersFunction(contract, provider, "storeIndividual", [
                  [],
                  [classCid],
                  []
                ])
              );
            });
        })
        .then(([propositionCid]) => {
          return propositionLedgerContract.submitProposition(
            propositionCid,
            10,
            { from: accounts[0] }
          );
        });
    });
  });

  it("should not be possible to submit a proposition with insufficient funds", () => {
    const tokenContractDeployed = RlayToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      RlayToken.address,
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
              const class_stored = callEthersFunction(
                contract,
                provider,
                "storeClass",
                [[annotationCid], []]
              );
              return class_stored.then(([classCid]) =>
                callEthersFunction(contract, provider, "storeIndividual", [
                  [],
                  [classCid],
                  []
                ])
              );
            });
        })
        .then(([propositionCid]) => {
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
    const tokenContractDeployed = RlayToken.deployed();
    const ontologyContractDeployed = OntologyStorage.deployed();
    const propositionLedgerContractDeployed = PropositionLedger.new(
      RlayToken.address,
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
