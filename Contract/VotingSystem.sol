// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract VotingSystem {
address private owner;
struct Candidate {
string name;
uint256 voteCount;
}
mapping(address => bool) private hasVoted;
mapping(address => Candidate) private candidates;
constructor() {
owner = msg.sender;
}
function addCandidate(string memory _name, address
 _candidateAddress) public {
 require(msg.sender == owner, "Only the owner can 
 perform this action.");
candidates[_candidateAddress] = Candidate(_name, 0);
}
function vote(address _candidateAddress) public {
require(!hasVoted[msg.sender], "You have already 
 voted.");
hasVoted[msg.sender] = true;
candidates[_candidateAddress].voteCount++;
}
function getData(address _candidateAddress) public view
 returns(string memory,uint){
require(msg.sender == owner, "Only the owner can 
 perform this action.");
return(candidates[_candidateAddress].name,
 candidates[_candidateAddress].voteCount);
}
}

