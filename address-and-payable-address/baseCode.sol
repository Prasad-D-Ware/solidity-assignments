// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address payable owner;

    constructor(){
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        
    }

    function withdrawAll() public payable {
        require(msg.sender == owner);
         owner.transfer(address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
