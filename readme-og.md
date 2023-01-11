Create a crowdfunding campaign where users can pledge funds to and claim funds from the contract.

Your contract(s) should be written such that:

1. Funds take the form of a custom ERC20 token
2. Crowdfunded projects have a funding goal
3. When a funding goal is not met, customers are be able to get a refund of their pledged funds
4. dApps using the contract can observe state changes in transaction logs
5. Optional bonus: contract is upgradeable

Project Requirements - there are two requirements for the challenge:

1. Submit your project on GitHub as a public repository that we can run locally, preferably using truffle, ganache, and hardhat.

If you prefer to use different tools, provide explicit instructions to get the contract up and running locally. We should be able to open the provided repository in VSCode and get the contract running locally within a few minutes.

2. Record a video of 5 min or less. Loom is a free online tool you could use. In the video, you will do a code walk-through where you share your screen and explain the code. In the code walk-through, run your code and explain the resulting output.

Your project must provide the following to be successfully completed:
Functionality and Explanation

Functionality

• Code compiles
• Code accomplishes task described in prompt
• Code has no glaring security issues
• Code is readable and organized
• Demonstrates ability to create and use modifiers appropriately
• Demonstrates ability to create and emit events appropriately
• Demonstrates ability to use contract inheritance appropriately
• Demonstrates ability to validate conditions and throw sensible errors
• Demonstrates ability to appropriately use global functions to access
information about the transaction, block, address, etc.
• Demonstrates ability to choose appropriate memory types for
parameters, variables, etc.
• Smart contract can quickly and easily be run on a local network
• Project demonstrates understanding of common EVM developer
tooling, e.g. truffle, ganache, hardhat, etc.
• Contract is upgradeable


# Explanation

• Demo and code read-aloud is submitted
• Demo and code read-aloud is complete (all steps explained)
• Demo and code read-aloud is clear and understandable


Now let's get coding

Take your time and feel free go back and reread the instructions. Once you are done, click on continue below and submit your GitHub and video links.

If you need any support, please email us at developer@solarsoft.io or join our Discord


# Note
When testing a smart contract, it's important to test various aspects of its functionality to ensure that it behaves as expected and is free of bugs and vulnerabilities. Here are some appropriate tests that could be performed on the crowdfunding campaign contract:

Unit tests: Unit tests focus on testing small, isolated pieces of code, such as individual functions or methods. This can include testing that the constructor initializes variables correctly, that functions such as pledge, refund, and withdraw perform their intended actions, and that events are emitted correctly.

Integration tests: Integration tests focus on testing how different parts of the contract interact with one another. This can include testing that the contract correctly interacts with the custom ERC20 token and that it properly updates the total raised and funding goal state variables.

Functional tests: Functional tests focus on testing the contract's overall behavior and functionality. This can include testing that the contract correctly handles edge cases, such as when a funding goal is not met and refunds are issued, and that the contract can be successfully upgraded.

Security tests: Security tests focus on identifying and addressing potential vulnerabilities in the contract. This can include testing for common security issues such as reentrancy attacks, front running and denial of service, and testing that the contract is properly protected against unauthorized access and malicious actors.

End-to-end tests: End-to-end tests focus on testing the contract in the context of its intended environment, such as a decentralized application (dApp) or other smart contract. This can include testing that the contract can be interacted with by external parties in the way that it is intended to be used.

It's important to keep in mind that smart contracts are complex systems and that no amount of testing can guarantee that it is completely secure. However, a comprehensive testing and audit can greatly reduce the risk and increase the trust on the smart contract.




Here are a few potential additional functionalities that you could consider adding to the contract to improve the user experience and robustness of the crowdfunding campaign:

Token transfer approval: Before transferring tokens from the user's account to the contract, you could implement a mechanism to check if the user has approved the transfer of tokens to the contract's address.

Refund after funding goal met: you could add a function that allows users to refund their pledge after the funding goal has been met, this could be implemented with a time limit for refund or a certain percentage for the funds to be refunded.

Token balance check: You could add a check to verify the balance of the contract before and after the refund process to ensure that the contract does not end up with negative balance.

Token transfer fail-safe mechanism: You could implement a fail-safe mechanism that handles the scenario where the token transfer fails, such as reverting the pledge and refunding the user their pledge.

Pledge deadline: You could implement a mechanism that allows the manager to set a deadline for pledges, after which users would no longer be able to pledge funds.

Funds withdrawal deadline: You could implement a mechanism that sets a deadline for the manager to withdraw funds after the funding goal has been met.

Update Pledge: A function could be added to let users increase their pledge, either by pledging again or updating their current pledge amount, before the deadline for the campaign.

Transparency reporting: You could add a reporting mechanism that allows users to check the pledge and refund amount for each user, or for the total amount of funds raised, the total pledge and refunded amount.

Timelock: You could add a functionality that allows the manager to lock the funds for a certain period of time before the funds are distributed.

Keep in mind that adding additional functionality also increases the complexity of the smart contract and the potential for vulnerabilities, So it's important to weigh the benefits against the potential risks.


Fail-safes are mechanisms implemented in smart contracts to prevent unintended behavior and handle unexpected situations. Here are a few potential fail-safes that could be added to the contract:

Reverting on token transfer failure: you could include a check that reverts the pledge and refunds the user in case the token transfer fails.

Emergency stop: A mechanism could be added that allows the manager to pause all contract activity in case of a security vulnerability or other emergency. This could be implemented using a modifier that checks a global variable or by calling a specific function.

Role reassignment: You could include a fail-safe that allows the role of the manager to be reassigned to another address in case the current manager is compromised or becomes unresponsive.

Gas and Ether price monitoring: Implementing a fail-safe mechanism that monitors the gas and ether price and returns the transaction if the gas price exceeds a certain threshold, this helps in avoiding unexpected high gas consumption.

Time-bound actions: You could include a fail-safe that automatically reverts transactions or functions that take too long to execute, this helps prevent malicious actors from taking control of the contract for too long.

State variable testing: You could include test to ensure that any changes made to the contract state are in line with the expected behavior of the smart contract, this helps prevent unintended state changes.

Error handling: Error handling mechanism should be added in order to provide a clear and informative message to the user on what went wrong, this helps user to understand the issue and take action accordingly.
