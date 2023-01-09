pragma solidity ^0.8.0;

contract test {
    uint public balance = 1;

    function add(uint256 deposit) public {
        balance += deposit;
    }
}
