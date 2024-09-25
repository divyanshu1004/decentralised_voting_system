# Voting Smart Contract

This is a simple Voting smart contract written in Solidity. It allows a chairperson to register voters, and those voters can then vote on different proposals. The contract also provides functionality to determine the winning proposal.

## Features
- Register voters (only by the chairperson)
- Allow registered voters to vote on proposals
- Retrieve the winning proposal

## Prerequisites
- Make sure you have access to the [Remix IDE](https://remix.ethereum.org/) online.
- Ensure you have MetaMask or any other Ethereum wallet if you want to deploy this contract to a test network.

## Steps to Run the Contract on Remix IDE

1. **Open Remix IDE:**
   - Go to [https://remix.ethereum.org/](https://remix.ethereum.org/)

2. **Create a New File:**
   - Create a new file named `Voting.sol` in the file explorer on the left side.

3. **Copy and Paste the Solidity Code:**
   - Copy the Solidity code from this repository and paste it into the `Voting.sol` file in Remix.

4. **Select the Solidity Compiler:**
   - Click on the "Solidity Compiler" tab on the left sidebar.
   - Select the appropriate compiler version `0.8.0` (or any compatible version) from the drop-down list.
   - Click on the "Compile Voting.sol" button to compile the code.

5. **Deploy the Contract:**
   - Click on the "Deploy & Run Transactions" tab on the left sidebar.
   - Ensure that "Injected Provider - MetaMask" or "JavaScript VM" is selected as the environment.
   - Make sure your account address is selected.
   - Under the "Deploy" section, enter the proposals (e.g., `["Proposal 1", "Proposal 2", "Proposal 3"]`) in the deployment input box.
   - Click on the "Deploy" button.

6. **Interact with the Contract:**
   - After deployment, you will see the contract under the "Deployed Contracts" section.
   - Expand the deployed contract to interact with its functions:
     - **registerVoter**: Register a voter (only the chairperson can execute this).
     - **vote**: Allows a registered voter to vote for a proposal.
     - **winningProposal**: Displays the index of the winning proposal.
     - **getWinner**: Displays the name of the winning proposal.

## Notes
- Only the chairperson (the contract deployer) can register voters.
- Each registered voter can vote only once.
- The winner is determined based on the highest vote count.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
