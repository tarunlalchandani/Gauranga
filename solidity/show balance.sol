
pragma solidity ^0.5.0;

contract CommunityChest {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

