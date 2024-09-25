// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint256 votedProposal;
    }

    struct Proposal {
        string name;
        uint256 voteCount;
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].isRegistered = true;

        for (uint256 i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Only chairperson can call this function");
        _;
    }

    function registerVoter(address voter) public onlyChairperson {
        Voter storage sender = voters[voter];
        require(!sender.isRegistered, "Voter is already registered");

        sender.isRegistered = true;
    }

    function vote(uint256 proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.isRegistered, "Not registered as a voter");
        require(!sender.hasVoted, "Already voted");
        require(proposal < proposals.length, "Invalid proposal");

        sender.hasVoted = true;
        sender.votedProposal = proposal;

        proposals[proposal].voteCount += 1;
    }

    function winningProposal() public view returns (uint256 winningProposal_) {
        uint256 winningVoteCount = 0;
        for (uint256 i = 0; i < proposals.length; i++) {
             if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposal_ = i;
            }
        }

        assert(winningVoteCount >= 0); // Ensure that winningVoteCount is non-negative
    }

    function getWinner() public view returns (string memory winnerName_) {
        uint256 winnerIndex = winningProposal();
        if (winnerIndex >= proposals.length) {
            revert("No proposals have been voted on");
        }

        winnerName_ = proposals[winnerIndex].name;
    }
}
