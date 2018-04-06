var OntologyStorage = artifacts.require("./OntologyStorage");
var SpreadToken = artifacts.require("./SpreadToken");
var PropositionLedger = artifacts.require("./PropositionLedger");

module.exports = function(deployer) {
  var ontologyStorageDeployed = deployer.deploy(OntologyStorage);
  var tokenDeployed = deployer.deploy(SpreadToken);

  return Promise.all([ontologyStorageDeployed, tokenDeployed])
    .then(([ontologyContract, tokenContract]) => {
      return deployer.deploy(PropositionLedger, SpreadToken.address, OntologyStorage.address);
    });
};
