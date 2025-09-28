// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ResponseContract {
    event SuspiciousAllowanceDetected(address owner, address spender, uint256 prev, uint256 curr);

    function executeAllowance(address owner, address spender, uint256 prev, uint256 curr) external {
        emit SuspiciousAllowanceDetected(owner, spender, prev, curr);
    }
}