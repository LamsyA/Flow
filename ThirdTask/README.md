# CryptoPoops Flow Project

This project is a Flow smart contract written in Cadence language. It implements a Non-Fungible Token (NFT) contract called `CryptoPoops`. Additionally, it includes scripts to interact with the contract, allowing users to manage CryptoPoop tokens and collections. Below is a comprehensive README for the project:

## Overview

The `CryptoPoops` contract enables the creation, management, and exchange of unique CryptoPoop tokens on the Flow blockchain. Each CryptoPoop token has attributes such as name, favorite food, and lucky number.

## Features

### Contract Features

- **Events**: Emits events for contract initialization, token withdrawals, and deposits.
- **NFT Definition**: Defines the structure of a CryptoPoop token.
- **Collection Management**: Provides functionalities for depositing, withdrawing, and retrieving NFTs in a collection.
- **Minter Resource**: Allows the creation of new CryptoPoop tokens.

### Scripts

- **Get NFTs by ID**: Retrieves the IDs of NFTs stored in a user's public collection.
- **Retrieve NFT Metadata**: Fetches the metadata of an NFT using its ID and the user's account address.

## Usage

### Deploying the Contract

Deploy the `CryptoPoops` contract to a Flow blockchain network using Flow-compatible deployment tools.

### Interacting with the Contract

- Use Flow-compatible tools or SDKs to interact with the deployed contract.
- Call contract functions to create, manage, and exchange CryptoPoop tokens.
- Utilize provided scripts to retrieve NFT IDs and metadata.

## Scripts

### Get NFTs by ID

Retrieve the IDs of NFTs stored in a user's public collection in the CryptoPoops contract.

### Retrieve NFT Metadata

Fetch the metadata of an NFT stored in a user's authenticated collection using the NFT's ID and the user's account address.

## Note

- Ensure proper understanding of Flow's Cadence language and development practices before deploying and interacting with the contract.
- Adjust deployment configurations and script parameters as necessary based on specific requirements and deployment environments.

## License

This project is licensed under the [MIT License](LICENSE).
