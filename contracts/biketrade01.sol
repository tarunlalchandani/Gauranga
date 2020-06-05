pragma solidity ^0.5.0;

import "./metrobikitrade.sol";               

contract ForSale is Review {

    //event NewBicycleForSale(_bicycleId, Model, Color, Price);

    uint[] public bicycleForSale;

    function putForSale(uint _bicycleId, uint _price) public {
        require(msg.sender == bicycleToOwner[_bicycleId], "Not owner of bicycle!");
        Bicycle storage myBicycle = bicycles[_bicycleId];
        myBicycle.state = State.FORSALE;
        myBicycle.price = _price;
        bicycleForSale.push(_bicycleId);
        //emit NewBicycleForSale(myBicycle.Model, myBicycle.Color, myBicycle.price);
    }

    function displayBicyclesForSale() external view returns(uint[] memory) {
        return bicycleForSale;
    }
}
