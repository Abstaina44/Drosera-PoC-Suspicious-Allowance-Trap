// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "../src/SuspiciousAllowanceTrap.sol";

contract DeploySuspiciousAllowanceTrap is Script {
    function run() external {
        vm.startBroadcast();

        SuspiciousAllowanceTrap trap = new SuspiciousAllowanceTrap();

        console.log("SuspiciousAllowanceTrap deployed at:", address(trap));

        vm.stopBroadcast();
    }
}
