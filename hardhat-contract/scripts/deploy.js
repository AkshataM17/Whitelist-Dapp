const hre = require("hardhat");
const {ethers} = require("hardhat");

async function main(){
   
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  const deployWhitelistContract = await whitelistContract.deploy(20);

  await deployWhitelistContract.deployed();
  console.log("Your contract address is:", deployWhitelistContract.address);
}

main()
.then(() => {
  console.log("Contract successfully deployed!")
  process.exit(0);
})
.then((err) => {
  console.error(err)
  process.exit(1);
})