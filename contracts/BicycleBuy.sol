pragma solidity ^0.5.0;

import "./biketrade01.sol";
import "./Escrow.sol";

contract BicycleBuy is ForSale {

    Bicycle[] public soldBicycles;
    //Escrow public transactionBuy()

    function buyBicycle(uint _bicycleId) external payable {
        require(bicycles[_bicycleId].state == State.FORSALE, "Sorry, not available for sale!");
        require(msg.value >= bicycles[_bicycleId].price, "Insufficient fund transfer!");
        msg.sender.transfer(msg.value - bicycles[_bicycleId].price);
        bicycles[_bicycleId].buyer = msg.sender;
        bicycles[_bicycleId].state = State.HOLD;
        bicycles[_bicycleId].boughtAtTime = uint16(now);  
    }
    
    function delivered(uint _bicycleId) external payable {   //incomplete function
        require(msg.sender == bicycles[_bicycleId].buyer, "Not buyer!");
        //address owner = bicycleToOwner[_bicycleId];
        //owner.transfer(bicycles[_bicycleId].price);
        Bicycle storage targetBicycle = bicycles[_bicycleId];
        targetBicycle.state = State.SOLD;
        targetBicycle.price = 0;
        targetBicycle.Owner = msg.sender;
        targetBicycle.buyer = address(0);
    }
}
