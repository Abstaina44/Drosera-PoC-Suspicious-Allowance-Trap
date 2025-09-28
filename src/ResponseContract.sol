// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ResponseContract {
    event ResponseTriggered(address indexed trap, string action);

    function respond(address trap) external {
        emit ResponseTriggered(trap, "Suspicious allowance detected");
    }
}
