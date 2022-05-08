//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


import "./EllipticCurve.sol";

contract Voted is Ownable {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    EnumerableMap.AddressToUintMap private users;
    uint private privateKey;
    string public publicKey;
    // uint public address;

    constructor() {
        generatePrivateKey();
        derivePubKey();
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

    function generatePrivateKey() public /*returns (uint)*/ {
        // Could generate using chainlink in the future
        privateKey = uint(keccak256(abi.encodePacked("hello wrold")));
        console.log("Private key: ");
        console.log(Strings.toHexString(privateKey));
        console.log("\n");
        // return privateKey;
    }

    function substring(string memory str, uint startIndex, uint endIndex) public returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }


    // source: https://github.com/witnet/elliptic-curve-solidity
    uint public constant GX = 0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798;
    uint public constant GY = 0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8;
    uint public constant AA = 0;
    uint public constant BB = 7;
    uint public constant PP = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F;

    // x: 23007056334434277873064007289986791585149905606975921951318844578841290075836
    // y: 43734657687288629282229735894187801927062204745136220966237435241985306471099
    function derivePubKey() public  /*returns(uint qx, uint qy)*/ {
      (uint qx,  uint qy) = EllipticCurve.ecMul(
        privateKey,
        GX,
        GY,
        AA,
        PP
      );
      // console.log("qx: ");
      // // 0x7b1af6e6beda15bab468bcee673b43203040b1f06df821ff67b25f592ce8de01
      // console.log(Strings.toHexString(qx));
      // console.log("\n");

      // console.log("qy: ");
      // // 0x7bfce383ffc5177ddbf0720bf8f51d8584cfab6c5adeeebc898b7bd58dc61cee
      // console.log(Strings.toHexString(qy));
      // console.log("\n");

      publicKey = string(abi.encodePacked(substring(Strings.toHexString(qx), 2, 66), substring(Strings.toHexString(qy), 2, 66)));
      console.log("Public key: ");
      console.log(publicKey);
      console.log("\n");
    }
}

