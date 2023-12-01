const dotenv = require("dotenv");
const fs = require("fs-extra");
const ethers = require("ethers");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const encryptedWallet = await wallet.encrypt(process.env.PRIVATE_KEY_PASSWORD);
  fs.writeFileSync("encryptedKey.json", encryptedWallet);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });