pragma solidity ^0.8.0;
import "./interface/IPriceConsumerV3.sol";
import "./interface/IFirePassport.sol";
import "./interface/IFireSoul.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./libraries/TransferHelper.sol";
import "./interface/IWETH.sol";
contract SeedDonation {
    using SafeMath for uint256;
    IPriceConsumerV3 public priceFeed;
    IFirePassport public firePassport;
    IFireSoul public fireSoul;
    uint public round;
    uint public currentRemaining;
    address public weth;
    address public feeReceiver;
    constructor(IPriceConsumerV3 _priceFeed,IFirePassport _firePassport,IFireSoul _fireSoul,address  _feeReceiver,address _weth){
        priceFeed = _priceFeed;
        firePassport = _firePassport;
        fireSoul = _fireSoul;
        weth = _weth;
        feeReceiver = _feeReceiver;
    }
    function donate(uint _amount) payable external {
        bool hasFID = fireSoul.checkFID(msg.sender);
        bool hasPID = firePassport.hasPID(msg.sender);
        require(hasPID || hasFID , 'donate:No permission');
        if(_amount == 0) {
            require(_checkDonateAmount(msg.value) == true,'donate:The quantity does not meet the requirements');
            if(hasFID){
                require(msg.value <= 1 ether,'donate:The quantity does not meet the requirements');
            }else if(hasPID){
                require(msg.value <= 0.3 ether,'donate:The quantity does not meet the requirements');
            }else{
                revert("donate:No permission");
            }
            TransferHelper.safeTransferFrom(weth,msg.sender,feeReceiver,_amount);
        }else{
            require(_checkDonateAmount(_amount) == true,'donate:The quantity does not meet the requirements');
            if(hasFID){
                require(_amount <= 1 ether,'donate:The quantity does not meet the requirements');
            }else if(hasPID){
                require(_amount <= 0.3 ether,'donate:The quantity does not meet the requirements');
            }else{
                revert("donate:No permission");
            }
            IWETH(weth).deposit{value: msg.value}();
            IWETH(weth).transfer(feeReceiver,msg.value);
        }


    }
    function _checkDonateAmount(uint _amount) internal view returns(bool) {
        uint minAmount = 0.1 ether;
        for(uint i =1;i<=10;i++){
            if(minAmount.mul(i) == _amount){
                return true;
            }
        }
        return false;
    }
}
