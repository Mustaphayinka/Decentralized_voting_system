// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    struct Election {
        uint id;
        string name;
        mapping(uint => Candidate) candidates;
        uint candidateCount;
        mapping(address => bool) voters;
        bool active;
    }

    mapping(uint => Election) public elections;
    uint public electionCount;

    function createElection(string memory _name) public {
        electionCount++;
        elections[electionCount].id = electionCount;
        elections[electionCount].name = _name;
        elections[electionCount].active = true;
    }

    function addCandidate(uint _electionId, string memory _name) public {
        Election storage election = elections[_electionId];
        election.candidateCount++;
        election.candidates[election.candidateCount] = Candidate(election.candidateCount, _name, 0);
    }

    function vote(uint _electionId, uint _candidateId) public {
        Election storage election = elections[_electionId];
        require(election.active, "Election is not active");
        require(!election.voters[msg.sender], "You have already voted");

        election.voters[msg.sender] = true;
        election.candidates[_candidateId].voteCount++;
    }

    function endElection(uint _electionId) public {
        Election storage election = elections[_electionId];
        election.active = false;
    }

    function getResults(uint _electionId) public view returns (string memory, uint) {
        Election storage election = elections[_electionId];
        uint maxVotes = 0;
        string memory winner;

        for (uint i = 1; i <= election.candidateCount; i++) {
            if (election.candidates[i].voteCount > maxVotes) {
                maxVotes = election.candidates[i].voteCount;
                winner = election.candidates[i].name;
            }
        }

        return (winner, maxVotes);
    }
}
