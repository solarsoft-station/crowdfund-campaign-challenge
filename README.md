# Hardhat Project

Create a crowdfunding campaign where users can pledge funds to and claim funds from the contract.

Your contract(s) should be written such that:

1. Funds take the form of a custom ERC20 token
2. Crowdfunded projects have a funding goal
3. When a funding goal is not met, customers are be able to get a refund of their pledged funds
4. dApps using the contract can observe state changes in transaction logs
5. Optional bonus: contract is upgradeable

This project demonstrates a basic Hardhat use case. It comes with a contract, and a script that deploys that contract.

## Functionality

- [x] Code compiles
- [x] Code accomplishes task described in prompt
- [x] Code has no glaring security issues
- [x] Code is readable and organized
- [x] Demonstrates ability to create and use modifiers appropriately
- [x] Demonstrates ability to create and emit events appropriately
- [x] Demonstrates ability to use contract inheritance appropriately
- [x] Demonstrates ability to validate conditions and throw sensible errors
- [x] Demonstrates ability to appropriately use global functions to access
information about the transaction, block, address, etc.
- [x] Demonstrates ability to choose appropriate memory types for
parameters, variables, etc.
- [ ] Smart contract can quickly and easily be run on a local network
- [ ] Project demonstrates understanding of common EVM developer
tooling, e.g. truffle, ganache, hardhat, etc.
- [ ] Project contains basic tests.
- [ ] Contract is upgradeable

Try running some of the following tasks:

```shell
yarn hardhat help
yarn hardhat test
REPORT_GAS=true yarn hardhat test
yarn hardhat node
yarn hardhat run scripts/deploy.js
```
