pragma solidity ^0.5.0;

import "./MetroBiki.sol";
//conditions under which a reviewer can review

contract Review is BicycleRegister {

    mapping(address => uint[]) reviewerToBicycle;

    modifier notReviewed(uint _bicycleId) {
        uint flag = 0;
        for(uint i = 0; i < reviewerToBicycle[msg.sender].length; i++) {
            if(reviewerToBicycle[msg.sender][i] == _bicycleId) {
                flag == 1;
                break;
            }
        }
        require(flag == 0, "Already review submitted!");
        _;
    }

    function upvoteBicycle(uint _bicycleId) public notReviewed(_bicycleId) {
        require(msg.sender != bicycleToOwner[_bicycleId], "Owner can not review!");  
        Bicycle storage testBicycle = bicycles[_bicycleId];
        testBicycle.upvoteCount++;
    }

    function downvoteBicycle(uint _bicycleId) public notReviewed(_bicycleId) {  //seee this
        require(msg.sender != bicycleToOwner[_bicycleId], "Owner can not review!");  
        Bicycle storage testBicycle = bicycles[_bicycleId];
        testBicycle.downvoteCount++;
    }
}
