pragma solidity ^0.5.0;

import "./biketrade01.sol";

contract BicycleBuy is ForSale {

    Bicycle[] public soldBicycles;
    /*
    modifier onlyAfter(uint _bicycleId) {
        require(now >= bicycles[_bicycleId].boughtAtTime + 1 days, "Waiting for transfer of asset!");
        _;
    }
    */

    function buyBicycle(uint _bicycleId) external payable {
        require(bicycles[_bicycleId].state == State.FORSALE, "Sorry, not available for sale!");
        require(msg.value >= bicycles[_bicycleId].price, "Insufficient fund transfer!");
        msg.sender.transfer(msg.value - bicycles[_bicycleId].price);

        //bicycles[_bicycleId].state = State.HOLD;
        //bicycles[_bicycleId].boughtAtTime = uint16(now);   // incomplete logic
        
        //address _owner = bicycleToOwner[_bicycleId];
        //_owner.transfer(bicycles[_bicycleId].price);
        Bicycle storage targetBicycle = bicycles[_bicycleId];
        targetBicycle.state = State.SOLD;
        targetBicycle.price = 0;
        targetBicycle.Owner = msg.sender;
    }

    /*
    function delivered(uint _bicycleId) external payable onlyAfter(_bicycleId) {   //incomplete function
        //require(msg.sender == buyer);
        
    }
    */
}