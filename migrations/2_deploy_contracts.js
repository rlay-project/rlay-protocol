var OntologyStorage = artifacts.require("./OntologyStorage");
var RlayToken = artifacts.require("./RlayToken");
var PropositionLedger = artifacts.require("./PropositionLedger");

module.exports = function(deployer) {
  var ontologyStorageDeployed = deployer.deploy(OntologyStorage);
  var tokenDeployed = deployer.deploy(RlayToken);

  return Promise.all([ontologyStorageDeployed, tokenDeployed])
    .then(([ontologyContract, tokenContract]) => {
      return deployer.deploy(PropositionLedger, RlayToken.address, OntologyStorage.address);
    });
};
