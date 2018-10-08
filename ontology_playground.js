const Web3 = require("web3");
const rlay = require("./web3-rlay.js");

const address = "0xc02345a911471fd46c47c4d3c2e5c85f5ae93d13";

const web3 = new Web3("http://localhost:8546");
rlay.extendWeb3WithRlay(web3);
web3.eth.defaultAccount = address;

async function storeEntity(entity) {
  return await rlay.store(web3, entity, { gas: 1000000 });
}

const builtins = {
  labelAnnotation:
    "0x01f1011b2086bf2d3b164e2ef42fe5f9abd20409e9e3945b327a309a2d00f64d39f0f1e118",
  seeAlsoLabelAnnotation:
    "0x01f1011b203516ffed28ac5a3df2c5d84798cd25a1bec5fce5d94d79ded171fb285303b5d5",
  commentLabelAnnotation:
    "0x01f1011b203baf96ffb96bc40aa7fb80cae02819b18d84dc21a0dc3a89a89f0b239948bf4a",
  labelAnnotationProperty:
    "0x01f1011b205332ae6733b031a470af4800f058554c800639c7e6ce2ad761ca841ac3d5574f",
  seeAlsoAnnotationProperty:
    "0x01f1011b20b0b5353e1ee66033aeb82e807a7df5c4288c6194b6c1a78d6b5b202564d16271",
  commentAnnotationProperty:
    "0x01f1011b208598ba52157f3f5ddcfaae30648f44a5eca482587a1bf004fbc98cd96796f9b3"
};

const projectClass = async function() {
  const projectLabelAnnotation = await storeEntity({
    type: "Annotation",
    property: builtins.labelAnnotationProperty,
    value: rlay.encodeValue("Project")
  });
  const projectCommentAnnotation = await storeEntity({
    type: "Annotation",
    property: builtins.commentAnnotationProperty,
    value: rlay.encodeValue(
      "A planned endeavor, usually with a specific goal and accomplished in several steps or stages."
    )
  });
  const klass = await storeEntity({
    type: "Class",
    annotation: [projectLabelAnnotation, projectCommentAnnotation]
  });

  return klass;
};

const personClass = async function() {
  const personLabelAnnotation = await storeEntity({
    type: "Annotation",
    property: builtins.labelAnnotationProperty,
    value: rlay.encodeValue("Person")
  });
  const personCommentAnnotation = await storeEntity({
    type: "Annotation",
    property: builtins.commentAnnotationProperty,
    value: rlay.encodeValue("An individual; usually a human being.")
  });
  const personClass = await storeEntity({
    type: "Class",
    annotation: [personLabelAnnotation, personCommentAnnotation]
  });

  return personClass;
};

const creatorOfOPE = async function() {
  const labelAnnotation = await storeEntity({
    type: "Annotation",
    property: builtins.labelAnnotationProperty,
    value: rlay.encodeValue("creatorOf")
  });
  const ope = await storeEntity({
    type: "ObjectProperty",
    annotations: [labelAnnotation]
  });

  return ope;
};

async function main() {
  const projectKlass = await projectClass();
  const personKlass = await personClass();
  const creatorOf = await creatorOfOPE();

  const vitalikLabel = await storeEntity({
    type: "Annotation",
    property: builtins.labelAnnotationProperty,
    value: rlay.encodeValue("Vitalik Buterin")
  });
  const vitalik = await storeEntity({
    type: "Individual",
    annotations: [vitalikLabel]
  });

  const ethereumLabel = await storeEntity({
    type: "Annotation",
    property: builtins.labelAnnotationProperty,
    value: rlay.encodeValue("Ethereum")
  });
  const ethereum = await storeEntity({
    type: "Individual",
    annotations: [ethereumLabel]
  });

  const pro_vitalik_person = await storeEntity({
    type: "ClassAssertion",
    subject: vitalik,
    class: personKlass
  });
  const contra_vitalik_person = await storeEntity({
    type: "NegativeClassAssertion",
    subject: vitalik,
    class: personKlass
  });
  await storeEntity({
    type: "ClassAssertion",
    subject: ethereum,
    class: projectKlass
  });
  await storeEntity({
    type: "NegativeClassAssertion",
    subject: ethereum,
    class: projectKlass
  });
  await storeEntity({
    type: "ObjectPropertyAssertion",
    subject: vitalik,
    property: creatorOf,
    target: ethereum
  });

  await rlay.addWeight(web3, pro_vitalik_person, 1000, { gas: 1000000 });
  await rlay.addWeight(web3, contra_vitalik_person, 100, { gas: 1000000 });
}

main();
