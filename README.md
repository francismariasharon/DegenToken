# Degen Token-Christmans Edition

In this special christmas season, I have created a Degen Token contract which has customised functions and gifts for the user to redeem, but make sure you know the codenumber :))) .This contract is deployed and verified on the Avalanche testnet.

## Description

It follows the widely accepted ERC-20 standard for fungible tokens on the Ethereum blockchain.
The contract includes custom functionality for redeeming items based on a provided item number, a Christmas greeting function, and associated state variables.
### State Variables
* minimum_balance: A string indicating the minimum balance required for certain operations.

* degen_shop: A string providing information about available items in the Degen shop for Christmas.

* inv_item: A string representing an error message for an invalid item number.

* codenumber: An internal variable holding a code number for validation.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    
    string  minimum_balance;
    string public degen_shop;
    string inv_item;
    uint internal codenumber=1001;
    
    constructor() ERC20("Degen", "DGN") {
        minimum_balance="Minimum Balance required:1000";
        degen_shop="Degen items available for X-mas: 1. Degen Bells 2. Degen Degen Lights 3. Degen X-mas Tree ";
        inv_item="Invalid Item number";
    }


    function mint(address to_address, uint256 amt) public onlyOwner {
        _mint(to_address, amt);
        
    }

    function redeem(uint256 x_item,uint pwd) public {
        assert(pwd==codenumber)
        if(x_item<0 && x_item>3){
            revert(inv_item);
        }
        require(balanceOf(msg.sender)>1000, minimum_balance);
        
        _burn(msg.sender, x_item*750);
       
    }
    function merry_christmas(string memory name) public returns (string memory, string memory ) {
    _mint(msg.sender, 1000);
    return ("Merry Christmas ", name);
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Remember to connect to the contract using Remix and MetaMask, paying test AVAX tokens on the Avalanche Fuji testnet.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

* Only the owner can mint new tokens using the mint function.

* Users can redeem items by providing a valid item number and a password. The password is internally set to codenumber.

* Users can receive a Christmas greeting and mint 1000 tokens.

In order to deploy this contract to the fuji testnet, run this this command:

```shell
npx hardhat run/scripts/deploy.js --network fuji
```

In order to verify the contract address , run this this command:
```shell
npx hardhat verify <address placeholder> --network fuji
```
Make sure to replace the address placeholder with the address you want to verify on fuji testnet.
## Authors

Francis MS
@francismariasharon@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
