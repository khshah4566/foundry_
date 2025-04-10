// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/UBToken.sol";

contract UBTokenDeploy is Script {
    function run() external {
        uint256 initialSupply = 1_000_000 * 10 ** 18; // 1,000,000 tokens with 18 decimals

        // Start broadcasting transactions
        vm.startBroadcast();

        // Deploy UBToken contract
        UBToken ubToken = new UBToken(initialSupply);

        // Transfer 100 tokens with 18 decimals to a specific address
        ubToken.transfer(0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc, 100 * 10 ** 18);

        vm.stopBroadcast();
    }
}
