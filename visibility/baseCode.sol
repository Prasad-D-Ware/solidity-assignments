// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityExample {

    function internalFunction() pure internal returns (string memory){
        return "Internal Function Called";
    }
    
    function externalFunction() pure external returns (string memory){
        return "External Function Called";
    }
}