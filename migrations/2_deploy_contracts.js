const Token = artifacts.require('Token');
const EthUCashSwap = artifacts.require('EthUCashSwap');

module.exports = async deployer => {
  await deployer.deploy(Token);
  const token = await Token.deployed();

  await deployer.deploy(EthUCashSwap);
  const ethSwap = await EthUCashSwap.deployed();

  // Transfer all tokens to EthUCashSwap (1 million)
  await token.transfer(ethSwap.address, '1000000000000000000000000');
};
