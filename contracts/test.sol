pragma solidity ^0.8.0;
import "./FirePassport.sol";

contract test {
    FirePassport  fp;

     function setAddress(address payable _address) public {
        fp = FirePassport(_address);            
    }    

    function add(address user) public view returns(uint256,address,string memory,string memory,uint256){
       return fp.userInfo(user);
    }
}
