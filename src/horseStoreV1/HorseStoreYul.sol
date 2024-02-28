// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import {IHorseStore} from "./IHorseStore.sol";

contract HorseStoreYul is IHorseStore {
    uint256 numberOfHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        assembly {
            sstore(numberOfHorses.slot, newNumberOfHorses)
            // storing `newNumberOfHorses` in slot of `numberOfHorses`
        }
    }

    function readNumberOfHorses() external view returns (uint256) {
        assembly {
            let num := sload(numberOfHorses.slot)
            // := means set
            // load from `storage slot` and set it in `num`

            mstore(0, num)
            // to return we have to store the value in memory => slot is `0` and value is `num`

            return(0, 0x20)
            // value will be at `slot 0` and `0x20` is the size of the return type
        }
    }
}

// Yul is little different than working with huff
// when we call `mstore` in huff
// we are expecting `offset` and `value` to be already on the stack
// but in Yul, we are giving it as a parameter
// mstore(0, num)
// which means `offset` is at the top of the stack which is `0`
// Right underneath is the `value` which is `num`
// Yul will push `offset` and `value` on the stack and execute
