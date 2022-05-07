const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Voted", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Voted = await ethers.getContractFactory("Voted");
    const voted = await Voted.deploy();
    await voted.deployed();

    console.log('hello world')
  });
});
