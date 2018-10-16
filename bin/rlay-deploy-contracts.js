#! /usr/bin/env node

const child_process = require("child_process");
const path = require("path");

const stdoutInstall = child_process.execSync(`npm install`, {
  cwd: path.resolve(process.cwd(), "./node_modules/@rlay/protocol"),
  env: process.env
});
const outputInstallStr = stdoutInstall.toString("utf8");
console.log(outputInstallStr);

const trufflePath = path.resolve(
  process.cwd(),
  "./node_modules/@rlay/protocol/node_modules/.bin/truffle"
);
const stdout = child_process.execSync(`${trufflePath} migrate --reset`, {
  cwd: path.resolve(process.cwd(), "./node_modules/@rlay/protocol"),
  env: Object.assign({}, process.env, {
    NODE_OPTIONS: "--max-old-space-size=120000"
  })
});

const outputStr = stdout.toString("utf8");
console.log(outputStr);

const addresses = {};
const captureContracts = ["OntologyStorage", "RlayToken", "PropositionLedger"];
captureContracts.forEach(captureContract => {
  const regx = new RegExp(`${captureContract}\: (.*)`, "g");
  const match = regx.exec(outputStr);
  addresses[captureContract] = match[1];
});

console.log("---- Section for rlay-client config ----\n");
console.log("[contract_addresses]");
Object.keys(addresses).forEach(contractName => {
  console.log(`${contractName} = "${addresses[contractName]}"`);
});
