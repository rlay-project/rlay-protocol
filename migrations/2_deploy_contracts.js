var AnnotationStore = artifacts.require("./AnnotationStore");
var SpreadToken = artifacts.require("./SpreadToken");
var PropositionLedger = artifacts.require("./PropositionLedger");

module.exports = function(deployer) {
  var annotationStoreDeployed = deployer.deploy(AnnotationStore);
  var tokenDeployed = deployer.deploy(SpreadToken);

  Promise.all([annotationStoreDeployed, tokenDeployed])
    .then(() => {
      deployer.deploy(PropositionLedger, SpreadToken.address, AnnotationStore.address);
    });
};
