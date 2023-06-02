// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/CollatzPuzzle.sol";

contract CollatzHackTest is Test {
    /// @dev Address of the SimpleStore contract.
    CollatzPuzzle public collatzPuzzle;
    CollatzHack public collatzHack;

    /// @dev Setup the testing environment.
    function setUp() public {
        // deploy the target contract 
        collatzPuzzle = new CollatzPuzzle();
        // deploy the hack contract
        collatzHack = CollatzHack(HuffDeployer.deploy("CollatzHack"));
    }

    /// @dev Ensure that you can set and get the value.
    function testHack() public {
        assertTrue(collatzPuzzle.callMe(address(collatzHack)));
    }
}

interface CollatzHack {
    function collatzIteration(uint256 n) external pure returns (uint256);
}
