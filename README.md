# Node Operators Endpoint Mapping Contract

This is a contract used by node operators to register their node.

Projects when choosing a node operator will have to choose it from the registered nodes
on the pNetwork DAO and then:

 1. Check the node has an endpoint registered within this contract
 2. Check the node attestation is valid


## Deploy

Set the `ETH_FROM` and `ETH_KEYSTORE_ACCOUNT` with the deployer address and
private key respectively into the `.env` file and run:

```bash
forge create --verify --rpc-url polygon  PNetworkV4Nodes
```

**Note:** the official contract has been deployed here https://polygonscan.com/address/0x228e705ad070def5072d283606d14dad7592377b with one
of the pNetwork Association key `0x984D8222e11afA2C4F6493BaF8b1f157C11d2629`.

## Scripts

### Initial setup

Before running scripts, you need to setup the forge keystores
in order to interact with the contract:

```bash
cast wallet import <sender-keystore-alias> --interactive
```

**Note:** You'll be prompt to type the private-key and a password that
you'll need to add later to the .env file.

### Create the .env file

Create an `.env` file at the project's root:

```env
ETH_FROM=<sender-address>
ETH_KEYSTORE_ACCOUNT=<sender-keystore-alias>
ETH_PASSWORD=<sender-keystore-password-file-path>
ENDPOINT=<url-to-polygon-node>
```

### Execute commands

All the commands are send through forge script contained into the `scripts/` folder.
For instance, to set an endpoint use:

```bash
./PNetworkV4Nodes.sh 'setEndpoint(address,string)' <node-operator-contract-address> 'http://helloworld.com' --broadcast
```

**Note:** remove `--broadcast` if you want to just run a simulation of the call

In order to remove an endpoint, execute:

```bash
./PNetworkV4Nodes.sh 'removeEndpoint(address)' <node-operator-contract-address> --broadcast
```

If you want to check your endpoint, call

```bash
./PNetworkV4Nodes.sh 'getEndpoint(address)' <node-operator-contract-address> --broadcast
```

Or
```bash
./PNetworkV4Nodes.sh 'getEndpoint(address,address)' <node-operator-contract-address> <node-address> --broadcast
```
