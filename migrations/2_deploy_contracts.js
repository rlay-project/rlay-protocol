var AnnotationStore = artifacts.require("./AnnotationStore");

module.exports = function(deployer) {
  deployer.deploy(AnnotationStore);
};
