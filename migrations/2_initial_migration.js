var BicycleBuy = artifacts.require("./BicycleBuy.sol");

module.exports = function(deployer) {
  deployer.deploy(BicycleBuy);
};