/** @type import('hardhat/config').HardhatUserConfig */
const INFURA_PROJECT_ID = "";

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
const ROPSTEN_PRIVATE_KEY = "";
module.exports = {
  solidity: "0.8.17",
  settings: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks:{
    arbgoeil:{
      url: `https://arbitrum-goerli.infura.io/v3/${INFURA_PROJECT_ID}`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`]
    }
  }
};
