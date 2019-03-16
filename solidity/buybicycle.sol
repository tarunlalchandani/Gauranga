pragma solidity ^0.5.0;

import "./biketrade01.sol";

contract BicycleBuy is ForSale {

    Bicycle[] public soldBicycles;

    modifier onlyAfter(_bicycleId) {
        require(now >= bicyles[_bicycleId].boughtAtTime + 1 days, "Waiting for transfer of asset!");
    }

    function buyBicycle(uint _bicycleId) public payable {
        require(bicyles[_bicycleId].state == FORSALE, "Sorry, not available for sale!");
        require(msg.value >= bicyles[_bicycleId].price, "Insufficient fund transfer!");
        msg.sender.transfer(msg.value - bicyles[_bicycleId].price);
        bicycles[_bicycleId].state = HOLD;
        bicycles[_bicycleId].boughtAtTime = now;   // incomplete logic
        
    }

    function delivered() internal onlyAfter {   //incomplete function
        //require(msg.sender == buyer);
        address _owner = owner();
        _owner.transfer(bicyles[_bicycleId].price);
        Bicycle storage targetBicycle = bicycles[_bicycleId];
        targetBicycle.state = SOLD;
        targetBicycle.price = 0;
        targetBicycle.Owner = msg.sender;
    }
}
