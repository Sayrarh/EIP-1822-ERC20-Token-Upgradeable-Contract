import { ethers } from "hardhat";

async function main() {
 // const ImplementationAaddr = "0xe7a28A901CF0F75CF467d54788781a27f043aD51";
  const ImplementationBaddr = "0x7Ac60403C149839938e63d7514A1555c2A83d7d5";
  const Proxy = await ethers.getContractFactory("Proxy");
  const proxy = await Proxy.deploy("0x8129fc1c", ImplementationBaddr);

  await proxy.deployed();

  console.log("Proxy Contract Address", proxy.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
