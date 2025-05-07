// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parent {
    function greet() public virtual returns  (string memory){
        return "Hello from Parents";
    }
}

contract Child is Parent{
    function greet()  override public pure returns (string memory) {
        return "Hello from Child";
    }
}