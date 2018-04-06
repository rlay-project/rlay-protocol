var OntologyStorage = artifacts.require("./OntologyStorage");
var SpreadToken = artifacts.require("./SpreadToken");
var PropositionLedger = artifacts.require("./PropositionLedger");

module.exports = function(deployer) {
  var annotationStoreDeployed = deployer.deploy(OntologyStorage);
  var tokenDeployed = deployer.deploy(SpreadToken);

  Promise.all([annotationStoreDeployed, tokenDeployed])
    .then(() => {
      deployer.deploy(PropositionLedger, SpreadToken.address, OntologyStorage.address);
    });
};
