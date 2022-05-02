// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "./KYC.sol";
contract StorageContract is Ownable,KYC {

    mapping(address => uint) public balances;

    event Deposit(address indexed _from, address indexed _id, uint _value);
    event Withdraw(address indexed _from, uint _value);

    function setDeposit(address recipient ,uint amount) onlyOwner public {
        require(recipient != address(0) || amount != 0,"Address cannot be null or balance cannot be 0");
        balances[recipient] += amount;
        emit Deposit(msg.sender,recipient,amount);
    }

    function setWidthdrawl(address recipient , uint amount) onlyKYCApproved public {
        require(recipient != address(0),"Address cannot be null");
        require(balances[recipient] != 0 , "You are not the owner");
        require(amount < balances[recipient],"Not enough balance");
        balances[recipient] -= amount;
        emit Withdraw(recipient,amount);
    }

}