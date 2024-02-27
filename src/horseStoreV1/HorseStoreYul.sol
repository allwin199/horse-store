// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import {IHorseStore} from "./IHorseStore.sol";

contract HorseStoreYul is IHorseStore {
    uint256 numberOfHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        assembly {
            sstore(numberOfHorses.slot, newNumberOfHorses)
        }
    }

    function readNumberOfHorses() external view returns (uint256) {
        assembly {
            let num := sload(numberOfHorses.slot) // := means set // read from storage and set it in `num`
            mstore(0, num) // to return we have to store the value in memory => slot is `0` and value is `num`
            return(0, 0x20) // value will be at slot 0 and 0x20 is the size of the return type
        }
    }
}
