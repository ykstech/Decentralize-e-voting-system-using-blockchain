// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public owner;
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    constructor() {
        owner = msg.sender;
    }

    mapping(uint256 => Candidate) public candidates;
    uint256 public candidatesCount;

    mapping(address => bool) private voters;


    function addCandidate(string memory _name) public {
        require(msg.sender == owner, "Only the owner can perform this action.");
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function voteCandidate(uint256 _candidateId) public {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
        require(!voters[msg.sender], "You have already voted.");

        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;

    }


}
