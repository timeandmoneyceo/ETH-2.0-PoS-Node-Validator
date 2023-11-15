// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// SlashingConditions.sol

contract SlashingConditions {
    // Adjustable parameters
    uint256 public slashingThreshold;
    uint256 public slashPenalty;

    // Address of the owner
    address public owner;

    // Events to log parameter changes
    event SlashingThresholdChanged(uint256 newThreshold);
    event SlashPenaltyChanged(uint256 newPenalty);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(uint256 _initialThreshold, uint256 _initialPenalty) {
        slashingThreshold = _initialThreshold;
        slashPenalty = _initialPenalty;
        owner = msg.sender;  // Set the contract deployer as the initial owner
    }

    // Function to set the slashing threshold, only callable by the owner
    function setSlashingThreshold(uint256 _newThreshold) external onlyOwner {
        slashingThreshold = _newThreshold;
        emit SlashingThresholdChanged(_newThreshold);
    }

// Function to set the slash penalty, only callable by the owner
    function setSlashPenalty(uint256 _newPenalty) external onlyOwner {
        slashPenalty = _newPenalty;
        emit SlashPenaltyChanged(_newPenalty);
    }

    // ... rest of your slashing conditions logic ...
}
