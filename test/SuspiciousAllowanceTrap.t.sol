// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import "../src/SuspiciousAllowanceTrap.sol";
import "../src/ResponseContract.sol";
import "../src/MockERC20.sol";

contract SuspiciousAllowanceTrapTest is Test {
    SuspiciousAllowanceTrap trap;
    ResponseContract response;
    MockERC20 token;

    function setUp() public {
        trap = new SuspiciousAllowanceTrap();
        response = new ResponseContract();
        token = new MockERC20("MockToken", "MTK", 18);
    }

    function testTriggerOnSpike() public {
        bool triggered = trap.checkAllowance(address(this), address(0xBEEF), 100, 2000);
        assertTrue(triggered, "Trap should trigger on big allowance spike");
    }

    function testNoTriggerOnSmallIncrease() public {
        bool triggered = trap.checkAllowance(address(this), address(0xBEEF), 100, 150);
        assertFalse(triggered, "Trap should NOT trigger on small allowance increase");
    }
}
