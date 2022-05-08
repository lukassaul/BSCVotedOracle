const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Voted", function () {
  let contract;
  let owner, address1;

  beforeEach(async () => {
    [owner, address1] = await ethers.getSigners();
    const Voted = await ethers.getContractFactory("Voted");
    contract = await Voted.deploy();
    // await contract.deployed();

  });

  // it("Should add a user", async function () {
  //   let res = await contract.checkUserExists(address1.address)
  //   expect(res).to.equal(false)
  //   await contract.addUser(address1.address)
  //   res = await contract.checkUserExists(address1.address)
  //   expect(res).to.equal(true)
  // });

  it("STuff", async function () {
    // let res = await contract.generateRandom()
    // console.log(res)

    // res = await contract.derivePubKey(res)
    // console.log(res)


    let res = await contract.publicKey() 
    console.log(res)
  });
});
