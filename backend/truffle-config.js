module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, // This should match the port Ganache is running on
      network_id: "5777", // Match any network id
      chain_id: 1337 // Match the chain id shown in Ganache
    },
  },
  compilers: {
    solc: {
      version: "0.8.0", // Use the correct version for your contracts
    },
  },
};
