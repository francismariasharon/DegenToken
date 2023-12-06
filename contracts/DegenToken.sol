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

}
