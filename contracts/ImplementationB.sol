// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "./Proxiable.sol";

contract ImplementationB is Proxiable, ERC20("Classwork", "CLW")  {
    //ImplementationB Contract Address: 0x7Ac60403C149839938e63d7514A1555c2A83d7d5
    address public owner;

    
    function initialize() public {
        require(owner == address(0), "Already initalized"); //checks to see if the owner has triggered the function before
        owner = msg.sender;
        _mint(address(this), 20000e18 );
    }

    function encode() public pure returns(bytes memory){
        return abi.encodeWithSignature("initialize()");
    }

    function mint(address to, uint amount) external {
        _mint(to, amount);
    }

    function transferTokenOut(address to, uint amount)external onlyOwner  {
        uint tokenBalance = balanceOf(address(this));
        require (tokenBalance >= amount , "You can't send more than balance");
        _transfer(address(this), to , amount );
    }

    function burn(address to) public{
        uint burnable = (totalSupply() * 1) / (totalSupply() * 10000);
        _burn(to, burnable);
    }

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to perform this action");
        _;
    }
}