pragma solidity ^0.5.0;

import "./metrobikitrade.sol";               

contract ForSale is Review {

    event NewBicycleForSale(Bid, Model, Color, Price);

    Bicycle[] public forSale;

    function putForSale(uint _bicycleId, uint _price) public {
        require(msg.sender == bicycleToOwner[_bicycleId], "Not owner of bicycle!");
        Bicycle storage myBicycle = bicycles[_bicycleId];
        myBicycle.state = FORSALE;
        myBicycle.price = _price;
        forSale.push(_bicycleId);
        emit NewBicycleForSale(_bicycleId, myBicycle.Model, myBicycle.Color, myBicycle.price);
    }

    function displayBicycleForSale() public returns(uint[]) {
        return forSale;
    }


}
