// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import '../struct/User.sol';
interface IUsers {
    function usernameExists(string memory username) external returns(bool);
    function getUserCount() external view  returns(uint);
}
