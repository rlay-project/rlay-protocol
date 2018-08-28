const fs = require("fs");
const child_process = require("child_process");

var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);

  const contractFiles = fs.readdirSync("./build/contracts");
  contractFiles.forEach(contractFile => {
    const fullPath = `./build/contracts/${contractFile}`;
    const stdout = child_process.execSync(
      `jq '. | del(.ast, .legacyAST)' ${fullPath}`
    );
    fs.writeFileSync(fullPath, stdout);
  });
  console.log("--- Deleted ASTs");
};
