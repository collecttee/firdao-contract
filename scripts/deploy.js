
async function main() {

    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:",
        await deployer.getAddress()
    );

    console.log("Account balance:", (await deployer.getBalance()).toString());

    const FirePassport = await ethers.getContractFactory("FirePassport");
    const fp = await FirePassport.deploy("0xD72af154997F1aE03cdf621Ae3Dd1a649Ee071D2","0x5D0C84105D44919Dee994d729f74f8EcD05c30fB","https://bafybeibcc3hlcdndeigexxxjk3j2wkbkic7l32cttsvqptqqwajh7htnye.ipfs.nftstorage.link/");

    await fp.deployed();

    console.log("Token address:", fp.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });