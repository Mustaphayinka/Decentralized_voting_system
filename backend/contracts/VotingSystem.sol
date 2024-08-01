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

    uint public electionCount;
    mapping(uint => Election) public elections;

    function createElection(string memory _name, string[] memory _candidates) public {
        electionCount++;
        Election storage election = elections[electionCount];
        election.id = electionCount;
        election.name = _name;
        election.active = true;

        for (uint i = 0; i < _candidates.length; i++) {
            addCandidate(electionCount, _candidates[i]);
        }
    }

    function addCandidate(uint _electionId, string memory _name) internal {
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

    function getCandidate(uint _electionId, uint _candidateId) public view returns (uint, string memory, uint) {
        Candidate storage candidate = elections[_electionId].candidates[_candidateId];
        return (candidate.id, candidate.name, candidate.voteCount);
    }

    function getCandidates(uint _electionId) public view returns (Candidate[] memory) {
        Election storage election = elections[_electionId];
        Candidate[] memory candidates = new Candidate[](election.candidateCount);

        for (uint i = 1; i <= election.candidateCount; i++) {
            candidates[i - 1] = election.candidates[i];
        }

        return candidates;
    }

    function hasVoted(uint _electionId, address _voter) public view returns (bool) {
        return elections[_electionId].voters[_voter];
    }
}
