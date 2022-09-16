import { ethers } from "hardhat";

async function main() {
  const ERC20A = await ethers.getContractFactory("ImplementationA");
  const erc20A = await ERC20A.deploy();

  await erc20A.deployed();

  console.log("ERC20A Address", erc20A.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


