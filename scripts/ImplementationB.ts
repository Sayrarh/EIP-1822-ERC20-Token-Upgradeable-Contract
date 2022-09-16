import { ethers } from "hardhat";

async function main() {
  const ERC20B = await ethers.getContractFactory("ImplementationB");
  const erc20B = await ERC20B.deploy();

  await erc20B.deployed();

  console.log("ERC20B Address", erc20B.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


