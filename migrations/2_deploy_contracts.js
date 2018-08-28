var pbLibraries = [
  "Class",
  "ObjectIntersectionOf",
  "ObjectUnionOf",
  "ObjectComplementOf",
  "ObjectOneOf",
  "ObjectSomeValuesFrom",
  "ObjectAllValuesFrom",
  "ObjectHasValue",
  "ObjectHasSelf",
  "ObjectMinCardinality",
  "ObjectMaxCardinality",
  "ObjectExactCardinality",
  "DataSomeValuesFrom",
  "DataAllValuesFrom",
  "DataHasValue",
  "DataMinCardinality",
  "DataMaxCardinality",
  "DataExactCardinality",
  "ObjectProperty",
  "InverseObjectProperty",
  "Annotation",
  "Individual",
  "AnnotationProperty",
  "ClassAssertion",
  "NegativeClassAssertion",
  "ObjectPropertyAssertion",
  "NegativeObjectPropertyAssertion"
];

var solLibraries = pbLibraries.map(n => artifacts.require(`${n}Storage`));

var OntologyStorage = artifacts.require("./OntologyStorage");
var RlayToken = artifacts.require("./RlayToken");
var PropositionLedger = artifacts.require("./PropositionLedger");

module.exports = function(deployer) {
  var pbLibrariesDeployed = solLibraries.map(n => deployer.deploy(n));
  var ontologyStorageDeployed = Promise.all(pbLibrariesDeployed).then(() => {
    const kindStorageLibrariesAddrs = solLibraries.map(lib => lib.address);

    return deployer.deploy(OntologyStorage, kindStorageLibrariesAddrs);
  });
  var tokenDeployed = deployer.deploy(RlayToken);

  return Promise.all([ontologyStorageDeployed, tokenDeployed]).then(
    ([ontologyContract, tokenContract]) => {
      return deployer.deploy(
        PropositionLedger,
        RlayToken.address,
        OntologyStorage.address
      );
    }
  );
};
