// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SafeTokenGuard {
    address public immutable securityAdmin;
    uint256 public dailyTransferCap = 500000;
    mapping(address => bool) public allowlistedVaults;

    event VaultAllowlisted(address indexed vault, uint256 timestamp);

    constructor() {
        securityAdmin = msg.sender;
        allowlistedVaults[msg.sender] = true;
    }

    function registerSafeVault(address _vault) external {
        allowlistedVaults[_vault] = true;
        emit VaultAllowlisted(_vault, block.timestamp);
    }
}
