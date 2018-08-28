// TODO: extract into own package
const ethers = require("ethers");
const cbor = require("cbor");
const ontologyContractJson = require("./build/contracts/OntologyStorage.json");
const propositionLedgerContractJson = require("./build/contracts/PropositionLedger.json");
const tokenContractJson = require("./build/contracts/RlayToken.json");

// Extend web3 0.20.x with custom Rlay RPC methods.
const extendWeb3OldWithRlay = web3 => {
  web3._extend({
    property: "rlay",
    methods: [
      new web3._extend.Method({
        name: "version",
        call: "rlay_version"
      }),
      new web3._extend.Method({
        name: "getPropositionPools",
        call: "rlay_getPropositionPools",
        outputFormatter: pools => {
          const formattedPools = pools.map(pool => {
            pool.totalWeight = web3.toBigNumber(pool.totalWeight);
            pool.values = pool.values.map(value => {
              value.totalWeight = web3.toBigNumber(value.totalWeight);

              return value;
            });

            return pool;
          });
          return formattedPools;
        }
      }),
      new web3._extend.Method({
        name: "experimentalKindForCid",
        call: "rlay_experimentalKindForCid",
        params: 1
      })
    ]
  });
};

// Extend web 1.0.x with custom Rlay RPC methods.
const extendWeb3WithRlay = web3 => {
  web3.extend({
    property: "rlay",
    methods: [
      {
        name: "version",
        call: "rlay_version"
      },
      {
        name: "getPropositionPools",
        call: "rlay_getPropositionPools",
        outputFormatter: pools => {
          const formattedPools = pools.map(pool => {
            pool.totalWeight = web3.toBigNumber(pool.totalWeight);
            pool.values = pool.values.map(value => {
              value.totalWeight = web3.toBigNumber(value.totalWeight);

              return value;
            });

            return pool;
          });
          return formattedPools;
        }
      },
      {
        name: "experimentalKindForCid",
        call: "rlay_experimentalKindForCid",
        params: 1
      }
    ]
  });
};

const buildEthersInterfaceOntologyStorage = () => {
  const abi = ontologyContractJson.abi;
  const contract = new ethers.Interface(abi);

  return contract;
};

const buildEthersInterfacePropositionLedger = () => {
  const abi = propositionLedgerContractJson.abi;
  const contract = new ethers.Interface(abi);

  return contract;
};

const buildEthersInterfaceRlayToken = () => {
  const abi = tokenContractJson.abi;
  const contract = new ethers.Interface(abi);

  return contract;
};

const store = (web3, entity, options) => {
  const interface = buildEthersInterfaceOntologyStorage();

  const storeFnName = `store${entity.type}`;
  const contractFn = interface.functions[storeFnName];

  return web3.rlay
    .version()
    .then(version => version.contractAddresses.OntologyStorage)
    .then(ontologyAddress => {
      const data = encodeForStore(entity);

      return web3.eth.sendTransaction({
        to: ontologyAddress,
        data,
        ...options
      });
    })
    .then(storeTx => contractFn.parseResult(storeTx.logs[0].data)[0]);
};

const retrieve = (web3, cid, options) => {
  const interface = buildEthersInterfaceOntologyStorage();

  // const storeFnName = `retrieve${entityKind}`;
  // const contractFn = interface.functions[storeFnName];

  const ontologyAddress = web3.rlay
    .version()
    .then(version => version.contractAddresses.OntologyStorage);
  const entityKind = web3.rlay
    .experimentalKindForCid(cid)
    .then(res => res.kind);

  return Promise.all([ontologyAddress, entityKind]).then(
    ([ontologyAddress, entityKind]) => {
      const data = encodeForRetrieve(entityKind, cid);

      return web3.eth
        .call({
          to: ontologyAddress,
          data,
          ...options
        })
        .then(callResponseData =>
          decodeFromRetrieve(entityKind, callResponseData)
        );
    }
  );
};

const addWeight = (web3, cid, weight, options) => {
  const interface = buildEthersInterfacePropositionLedger();
  const tokenInterface = buildEthersInterfaceRlayToken();

  const contractAddresses = web3.rlay
    .version()
    .then(version => version.contractAddresses);

  return contractAddresses.then(contractAddresses => {
    const approveFn = tokenInterface.functions["approve"];
    const approveEncoded = approveFn(
      contractAddresses.PropositionLedger,
      weight
    ).data;

    const submitPropositionFn = interface.functions["submitProposition"];
    const submitPropositionEncoded = submitPropositionFn(cid, weight).data;

    return web3.eth
      .sendTransaction({
        to: contractAddresses.RlayToken,
        data: approveEncoded,
        ...options
      })
      .then(() =>
        web3.eth.sendTransaction({
          to: contractAddresses.PropositionLedger,
          data: submitPropositionEncoded,
          ...options
        })
      );
  });
};

const encodeForStore = entity => {
  const interface = buildEthersInterfaceOntologyStorage();

  const storeFnName = `store${entity.type}`;
  const contractFn = interface.functions[storeFnName];

  const params = [];
  contractFn.inputs.names.forEach((paramName, paramIdx) => {
    const paramType = contractFn.inputs.types[paramIdx];
    let nullValue = "0x";
    if (paramType.endsWith("[]")) {
      nullValue = [];
    }

    params.push(
      entity[paramName] || entity[paramName.replace("_", "")] || nullValue
    );
  });
  const encoded = contractFn(...params);

  return encoded.data;
};

const encodeForRetrieve = (entityKind, cid) => {
  const interface = buildEthersInterfaceOntologyStorage();

  const storeFnName = `retrieve${entityKind}`;
  const contractFn = interface.functions[storeFnName];
  return contractFn(cid).data;
};

const decodeFromRetrieve = (entityKind, responseData) => {
  const interface = buildEthersInterfaceOntologyStorage();

  const storeFnName = `retrieve${entityKind}`;
  const contractFn = interface.functions[storeFnName];

  const parsed = contractFn.parseResult(responseData);

  const entity = { type: entityKind };
  contractFn.outputs.names.forEach(paramName => {
    let parsedValue = parsed[paramName];
    if (Array.isArray(parsedValue)) {
      parsedValue = new Array(...parsedValue);
    }
    entity[paramName.replace("_", "")] = parsedValue;
  });

  return entity;
};

const encodeValue = val => cbor.encode(val);

const decodeValue = encoded =>
  cbor.decodeFirstSync(encoded.substring(2, encoded.length));

module.exports = {
  store,
  retrieve,
  addWeight,

  encodeValue,
  decodeValue,

  encodeForStore,
  extendWeb3WithRlay,
  extendWeb3OldWithRlay
};
