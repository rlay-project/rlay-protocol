const Web3 = require("web3");
const rlay = require("./web3-rlay.js");

const address = "0xc02345a911471fd46c47c4d3c2e5c85f5ae93d13";

const web3 = new Web3("http://localhost:8546");
rlay.extendWeb3WithRlay(web3);
web3.eth.defaultAccount = address;

async function storeEntity(entity) {
  return await rlay.store(web3, entity, { gas: 1000000 });
}

async function seed() {
  const rawLabelAnnotation = await storeEntity({
    type: "Annotation",
    value: rlay.encodeValue("label")
  });
  const rawLabelAnnotationProperty = await storeEntity({
    type: "AnnotationProperty",
    annotations: [rawLabelAnnotation]
  });

  const labelAnnotation = await storeEntity({
    type: "Annotation",
    property: rawLabelAnnotationProperty,
    value: rlay.encodeValue("label")
  });
  const labelAnnotationProperty = await storeEntity({
    type: "AnnotationProperty",
    annotations: [labelAnnotation]
  });

  const seeAlsoLabelAnnotation = await storeEntity({
    type: "Annotation",
    property: labelAnnotationProperty,
    value: rlay.encodeValue("seeAlso")
  });
  const seeAlsoAnnotationProperty = await storeEntity({
    type: "AnnotationProperty",
    annotations: [seeAlsoLabelAnnotation]
  });

  const commentLabelAnnotation = await storeEntity({
    type: "Annotation",
    property: labelAnnotationProperty,
    value: rlay.encodeValue("comment")
  });
  const commentAnnotationProperty = await storeEntity({
    type: "AnnotationProperty",
    annotations: [commentLabelAnnotation]
  });

  return {
    labelAnnotation,
    seeAlsoLabelAnnotation,
    commentLabelAnnotation,

    labelAnnotationProperty,
    seeAlsoAnnotationProperty,
    commentAnnotationProperty
  };
}

async function main() {
  let cids = await seed();
  console.log(cids);
}

main();
