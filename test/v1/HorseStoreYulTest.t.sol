// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Base_TestV1, IHorseStore} from "./BaseTestV1.t.sol";
import {HorseStoreYul} from "../../src/horseStoreV1/HorseStoreYul.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";

contract HorseStoreYulTest is Base_TestV1 {
    function setUp() public override {
        horseStore = IHorseStore(new HorseStoreYul());
    }
}
