// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address private owner;
    struct Candidate{
        string name;
        uint votes;
    }
    mapping(address => bool) public hasVoted;

    Candidate[] candidates;

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyOwner {
        require(msg.sender == owner,"Only Owner can Access this");
        _;
    }

    function addCandidates(string[] memory names) public OnlyOwner {
        for(uint i = 0 ; i < names.length; i++){
            candidates.push(Candidate(names[i],0));
        }
    }

    function vote(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "You have already Voted");
        require(candidateId < candidates.length, "Invalid id");
        candidates[candidateId].votes += 1;
        hasVoted[msg.sender] = true;
    }

    function getVotes(uint256 candidateId) public view returns (uint256) {
        require(candidateId < candidates.length, "Invalid id");
        return candidates[candidateId].votes;
    }
}
