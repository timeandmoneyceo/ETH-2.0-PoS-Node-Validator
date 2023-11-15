// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Token.sol
interface Token {
    function balanceOf(address _a) external view returns (uint);
    function transfer(address _to, uint _amt) external;
}

contract TokenCorrect is Token {
    mapping (address => uint) balance;
    constructor(address _a, uint _b) {
        balance[_a] = _b;
    }

    function balanceOf(address _a) public view override returns (uint) {
        return balance[_a];
    }

    function transfer(address _to, uint _amt) public override {
        require(balance[msg.sender] >= _amt);
        balance[msg.sender] -= _amt;
        balance[_to] += _amt;
    }
}
