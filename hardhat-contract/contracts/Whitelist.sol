//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Whitelist{

    //maximum number of whitelist
    //If already whitelisted, should not be whitelisted again
    
    uint256 public maxNumberOfWhitelist;
    uint256 public numOfWhitelisted;
    mapping (address => bool) public whitelistedAddresses;

    constructor(uint8 _maxNumberOfWhitelist){
       maxNumberOfWhitelist = _maxNumberOfWhitelist;
    }

    function addToWhitelist() public {
        require(maxNumberOfWhitelist > numOfWhitelisted, "No more whitelist spots left");
        require(!whitelistedAddresses[msg.sender], "Address already in whitelist");
        whitelistedAddresses[msg.sender] = true;
        numOfWhitelisted += 1;
    }
    
    function checkIfAddressIsWhitelisted() public view returns (bool){
        return whitelistedAddresses[msg.sender];
    }


}