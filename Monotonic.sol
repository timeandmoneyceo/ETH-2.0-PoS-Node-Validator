// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Monotonic.sol
contract Monotonic {
    function f(uint x) internal pure returns (uint) {
        require(x < type(uint128).max);
        return x * 42;
    }

    function inv(uint a, uint b) public pure {
        require(b > a);
        assert(f(b) > f(a));
    }
}
