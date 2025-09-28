// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SuspiciousAllowanceTrap {
    event AllowanceSpikeDetected(address owner, address spender, uint256 oldAmount, uint256 newAmount);

    uint256 public constant THRESHOLD = 1000;

    function checkAllowance(
        address owner,
        address spender,
        uint256 oldAllowance,
        uint256 newAllowance
    ) external returns (bool) {
        if (newAllowance >= oldAllowance + THRESHOLD) {
            emit AllowanceSpikeDetected(owner, spender, oldAllowance, newAllowance);
            return true;
        }
        return false;
    }
}