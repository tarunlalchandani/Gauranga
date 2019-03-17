pragma solidity ^0.5.0;

contract Escrow {

    enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}
    State currentState;

    address public buyer;
    address public seller;

    modifier buyerOnly() {
        require(msg.sender == buyer, "NOT BUYER!");
        _;
    }

    modifier inState(State expectedState) {
        require(currentState == expectedState, "Not available in the required state!");
        _;
    }

    constructor(address _buyer, address _seller) public {
        buyer = _buyer;
        seller = _seller;
    }

    function confirmPayment() external buyerOnly inState(State.AWAITING_PAYMENT) payable {
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() external buyerOnly inState(State.AWAITING_DELIVERY) {
        // seller.transfer(address(this).balance);
        currentState = State.COMPLETE;
    }

}