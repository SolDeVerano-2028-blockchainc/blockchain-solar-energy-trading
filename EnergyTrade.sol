// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;
contract EnergyTrade {
  address public seller;
  address public buyer;
  uint public kWh;
  uint public price;
  bool public accepted;
  bool public confirmed;
  address public meter;
  uint public deliveredKWh;


  constructor(uint _kWh, uint _price, address _meter) {
seller = msg.sender;
kWh = _kWh;
price =  _price;
meter = _meter;

}

function acceptTrade() public payable {
require(accepted == false, "Already accepted");
require(msg.sender != seller, "Seller cannot buy");
require(msg.value == price, "Wrong payment");

buyer = msg.sender;
accepted = true;
}

function confirmDelivery (uint _deliveredKWh) public {
require(msg.sender == meter,"Only meter can confirm");
require(accepted == true, "Trade not accepted");
require(confirmed == false, "Already confirmed");

deliveredKWh = _deliveredKWh;
confirmed = true;
 }

  }
    
