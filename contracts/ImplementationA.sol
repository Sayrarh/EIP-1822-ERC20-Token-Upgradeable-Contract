// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "./Proxiable.sol";

contract ImplementationA is Proxiable, ERC20("Classwork", "CLW")  {
    //contract address of ImplementationA: 0xe7a28A901CF0F75CF467d54788781a27f043aD51
    address public owner;

    
    function initialize() public {
        require(owner == address(0), "Already initalized"); //checks to see if the owner has triggered the function before
        owner = msg.sender;
        _mint(address(this), 20000e18);
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


    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to perform this action");
        _;
    }
}