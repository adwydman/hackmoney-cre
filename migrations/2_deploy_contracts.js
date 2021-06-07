const MyContract = artifacts.require("MyContract");

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(MyContract);
};
