# Csi Task 1

## Summary

## What is a Blockchain ?

- A blockchain is a database of transactions that is updated and shared across many computers in a network.
- Every time a new set of transactions is added, its called a “block”.Hence the name blockchain. Public blockchains like Ethereum allow anyone to add, but not remove, data. If someone wanted to alter any of the information or cheat the system, they’d need to do so on the majority of computers on the network.

- Every node in the blockchain network has the ability to keep a copy of the ledger(**record of the transactions**), and the the official version of the shared ledger is updated via blockchain consensus mechanisms

## Terminologies

- ### Mining :

  - #### **Finding the nonce value which when hashed with the data meets the required hash condition**
    [For Reference](https://andersbrownworth.com/blockchain/)

- ### Cryptography
  - #### Most common method used is called public key cryptography
  - #### It ensures that private key can be used to generate public key but the public key cannot be used to trace back the private key (unidirectional-flow);
  - #### The algorithms used to generate public and private key pairs are designed as "trapdoor functions." These functions are easy to compute in one direction but computationally infeasible to reverse without specific knowledge of the private key.

## Consensus Protocols

### Consensus Protocol is a set of rules that helps maintain the state of the distributed ledger in a decentralized manner.

#### Examples:

- **Longest chain Rule**

  When there are competing chains due to forks (either intentional or accidental), nodes in the network automatically choose the longest valid chain. The shorter chain is discarded, and transactions in blocks on that chain are considered invalid.

  The unaccepted blocks are called orphan blocks and are discarded

- **Proof of Work**

  - Used by Bitcoin
  - Here, there are many miners that mine the nonce value for a given transaction.
  - All miners compete with each other, to solve for the nonce value for given transaction. The one who finds the solution first emits it to other nodes which then verify the transaction.

  - This method takes up a lot of energy, which is the reason why Ethereum 2.0 moved from PoW to PoS

- **Proof of Stake**

  - Used by Ethereum blockchain
    ![](https://u.today/sites/default/files/inline-images/upload_9c991db6c5e45047a45455091b95e65d.png)
  - PoS works on the concept of stakers and validators
  - Anyone can become a staker by putting up 32 ETH as collateral
  - Any Staker can become a validator who can participate in adding validating and adding new blocks.
  - Instead of competing for mining every transaction like PoW, validators are assigned blocks according to the amount they stake and other factors. More stake more likeliness to become validator
  - Some chains also assign validator randomly

  - [good resource to understand](https://www.youtube.com/watch?v=ytlWyqVi0vA)

## Blockchain Interoperability

    In simple words, it is the ability of different blockchains to communicate and transact with each another

- #### Can be achieved using:
  - Swapping Platforms that help swap tokens from one chain with tokens of another chain
  - Wrapped tokens that track / associate with the tokens of other chain like WBTC, TBTC, etc.\
  - Side chains(L2 or derived chains) which can interact with the parent chain and are used for special use cases.
- #### Has various applications like
  - Cross chain transactions
  - Sharing of data among blockchains
  - Execution of smart contract present on one blockchain using data from the other
  - Side chains (L2) solutions that can communicate with the parent chain and are used for scalability and special applications

## Blockchain Structure

### A typical blockchain has many components like:

- **Transactions**:

  They may be include cryptocurrency exchange stats or smart contract function calls/ creation txn

- **Block**:

  A collection of transactions is termed as block.

  Every transaction is mined before adding to the block(hash for the entire block is the merkle hash), and every block is also mined before appending it to the blockchain

- **Headers**:

  Each block has a header that contains metadata about the block, including a timestamp, a reference to the previous block (parent block), and a unique identifier known as a hash.

- **Merkle Tree Hash**:

  Inside a block, transactions are often organized into a Merkle tree (also called a Merkle root) which is basically the cumulative hash of all transactions within the block. This hierarchical structure of hashing allows for efficient verification of transactions in a block.

  ![merkle tree](https://static.javatpoint.com/tutorial/blockchain/images/blockchain-merkle-tree.png)

- **Smart Contracts**:
  Programs written to execute code on the blockchain.
  Each smart contract has its own address and can be deployed on blockchains like Ethereum.
  Smart contracts execute on their own and once deployed, the source code cannot be altered similar to a transaction

## Gas and Gas Fees

- When you execute a function for a smart contract, every single node on the network needs to run that same function to verify its output —
  thousands of nodes verifying every function execution is what makes Ethereum decentralized,
  and its data immutable and censorship-resistant.
- The creators of Ethereum wanted to make sure someone couldn't **_clog up the network
  with an infinite loop with some function, or hog all the network resources with really intensive computations_**.

  So they made it so transactions aren't free, and users have to pay for computation
  time as well as storage.

- Also gas is used to compensate the miners that help add transactions and blocks onto the blockchain

- Main units are ETH, gwei and wei where wei is 10^-18 ETH and gwei is giga wei

## Blockchain Forking

- Pretty similar to github forking
- Used to create a new version of existing chain
- Also all the tokens you have in your account are in sync in the forked chain and original chain

  - **Hard Fork**:

    - Upgrades the blockchain rules

    - Example is nvim, which is the hard fork of vim

    - Primarily done for security updates and adding new functionality.

    - The transaction history is generally shared.

    - **_The distribution and value of the new cryptocurrency resulting from a hard fork depend on various factors, including the rules of the fork, the community's support, and the market's perception._**

  - **Soft Fork**:
    - 1. It is backward compatiable and doesn't lead to a permanent chain separation.
    - 2. Doesn't clash with previous rules, and doesn't follow completely new ideology like hard fork

## Tokens and token standard in blockchains

- Creating a new asset on the blockchain is creating a token
  ![](<https://www.investopedia.com/thmb/uRcNRy7yHRkZ7r5Gewiz9Uyr21M=/4000x2700/filters:no_upscale():max_bytes(150000):strip_icc()/crypto-token.asp-v5-6774f213bd3b4deaac537f196990edff.png>)

### Token Standards
