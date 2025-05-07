// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusContract {
    enum Status {
        Pending,
        Active,
        Completed
    }
    address public owner;
    Status public currentStatus;
    uint256 public currentBalance;

    event StatusChanged(Status status);

    constructor() payable {
        owner = msg.sender;
        currentStatus = Status.Pending;
        currentBalance = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only allowed to owner");
        _;
    }

    function activate() external onlyOwner {
        currentStatus = Status.Active;
        emit StatusChanged(currentStatus);
    }

    function complete() external onlyOwner {
        require(currentStatus == Status.Active, "Contract not active");
        currentStatus = Status.Completed;
        emit StatusChanged(currentStatus);
    }

    function fundContract() external payable {
        require(msg.value > 0, "Must be greater then zero");
        currentBalance += msg.value;
    }

    function _getStatus() internal view returns (Status) {
        return currentStatus;
    }

    function isComplete() external view returns (bool) {
        return currentStatus == Status.Completed;
    }
}
