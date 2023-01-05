// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPriceConsumerV3 {
    function getLatestPrice() public view returns (int);
}
