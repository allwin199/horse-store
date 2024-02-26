// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

contract HorseStore {
    uint256 numberOfHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        numberOfHorses = newNumberOfHorses;
    }

    function readNumberOfHorses() external view returns (uint256) {
        return numberOfHorses;
    }
}

// when `updateHorseNumber` is called via `remix`
// 0xcdfead2e0000000000000000000000000000000000000000000000000000000000000001 this is the input data and it is also called as `calldata`.
// How does solidity know by seeing the `calldata` which function to call?
// when `updateHorseNumber` is called via `remix` this is what happens behind the scenes
// remix will get the function selector for the called function
// cast sig "updateHorseNumber(uint256)"
// o/p => 0xcdfead2e
// It will output the function selector. Function selector is first 4 bytes of the function signature.
// It will call `abi.encodeWithSelector(0xcdfead2e, newNumberOfHorses)`
// o/p => 0xcdfead2e0000000000000000000000000000000000000000000000000000000000000001
// cast --calldata-decode "updateHorseNumber(uint256)" "0xcdfead2e0000000000000000000000000000000000000000000000000000000000000001"

// By seeing the function selector `solidity` knows which function to call in the contract.
// This is called `function dispatching`

// send calldata -> function dispatch -> function

// we send the calldata -> solidity will check the function selector and call that specified function
