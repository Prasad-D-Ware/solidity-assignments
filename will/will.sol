// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Will {
    address payable  owner;
    address payable reciepient;
    uint public lastVisited;
    uint tenYears;

    constructor(address _reciepient){
        owner = payable(msg.sender);
        reciepient = payable(_reciepient);
        lastVisited = block.timestamp;
        tenYears = 10;
    }

    modifier OnlyOwner {
        require(msg.sender ==owner, "Only owner can change the reciepient");
         _;
    }

    function changeReciepient(address __reciepient) public OnlyOwner {
        reciepient = payable(__reciepient);
    }

    function deposit() public payable OnlyOwner {
        lastVisited = block.timestamp;
    }

    function ping() public OnlyOwner {
        lastVisited = block.timestamp;
    }

    function drain() public {
        require(msg.sender == reciepient,"Your are not the reciepient");
        require(lastVisited < block.timestamp - tenYears);
        payable(reciepient).transfer(address(this).balance);
    }
}