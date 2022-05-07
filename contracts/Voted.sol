//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

contract Voted is Ownable {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    EnumerableMap.AddressToUintMap private users;

    constructor() {
        // console.log("Deploy voting:");
    }

    function addUser(address addr) public /*onlyOwner*/ {
        console.log("Adding user to list");
        console.log(addr);
        users.set(addr, 1);
    }

    function checkUserExists(address addr) public view returns (bool) {
        console.log("Check user in list");
        console.log(addr);
        console.log(users.contains(addr));
        return users.contains(addr);
    }

}
