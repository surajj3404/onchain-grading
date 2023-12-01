const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const provider = new ethers.JsonRpcProvider(process.env.RPC_URL);
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
  const abi = fs.readFileSync("./GradeStorage_sol_GradeStorage.abi", "utf8");
  const bytecode = fs.readFileSync(
    "./GradeStorage_sol_GradeStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, bytecode, wallet);
  console.log("Deploying the contract");
  let gasLimit = 2000000;
  const contract = await contractFactory.deploy({
    gasLimit: gasLimit,
  });
  const transactionReceipt = await contract.deployTransaction.wait("1");
  console.log("Transaction Receipt: ", transactionReceipt);
  console.log("Here are the detials of the deployed contract", contract);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
