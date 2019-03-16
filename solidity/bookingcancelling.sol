User talks via contract EthBooking

contract EthBooking {
    function addBooking(uint listingId) public payable returns(uint bookingId) {
    bookingId =  BookingLibrary.book(ethDB, listingId, msg.sender, msg.value);

    //Send money to the contract
    return bookingId;
}
}
Booking Library code:

library BookingLibrary {

function book(address db, uint listingId, address sender, uint value) 
        internal returns (uint bookingId) 
{
    var cost = ListingLibrary.getCost(db,listingId);
        //Create Contract wallet
        EthWallet wallet = new EthWallet();
        //Send money to the contract
        wallet.receiveFunds.value(cost);
    return bookingId;
}
EthWallet Code:

contract EthWallet is Mortal {

function ethWallet() {
}

function receiveFunds() payable {

}

function sendFunds(address receiver, uint amount) {
    receiver.transfer(amount);
}