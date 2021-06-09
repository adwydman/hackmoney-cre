const MyContract = artifacts.require("MyContract");
const ValidationPool = artifacts.require("ValidationPool");
const Investment = artifacts.require("Investment");
const InvestmentFactory = artifacts.require("InvestmentFactory");
const ValToken = artifacts.require("ValToken");

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(MyContract);
  await deployer.deploy(ValidationPool);
  await deployer.deploy(Investment);
  await deployer.deploy(InvestmentFactory, Investment.address);
  await deployer.deploy(ValToken);
};
