// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


abstract contract KYC is Ownable {
    mapping(address => bool) public isKYCApproved;
    event ApprovedKYC(address indexed _from, address indexed _id, bool _status);


    function setKYCApproval(address recipient) onlyOwner external{
        require(recipient != address(0),"Address cannot be null");
        require(isKYCApproved[recipient] != true,"KYC already approved");
        isKYCApproved[recipient] = true;
        emit ApprovedKYC(msg.sender,recipient,true);
    }

    modifier onlyKYCApproved() {
       require(isKYCApproved[msg.sender] == true,"KYC Not Approved");
       _;
    }
} 
