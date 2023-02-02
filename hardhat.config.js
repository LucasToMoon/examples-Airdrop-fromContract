require('@nomiclabs/hardhat-waffle');
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config();
// require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `${process.env.ALCHEMY_GOERLI_URL}`,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    } 
  },
  etherscan: {
    apiKey: `${process.env.ETHERSCAN_KEY}`
  }
};