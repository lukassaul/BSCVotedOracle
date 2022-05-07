//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

contract Voted is Ownable {
    // Declare a set state variable
    EnumerableMap.UintToAddressMap public users;

    constructor() {
        console.log("Deploy voting:");
    }


}
