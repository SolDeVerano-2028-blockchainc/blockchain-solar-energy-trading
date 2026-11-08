// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;
contract EnergyTrade {
  address public seller;
  address public buyer;
  uint public kWh;
  uint public price;
  bool public accepted;


  constructor(uint _kWh, uint _price) {
seller = msg.sender;
kWh = _kWh;
price =  _price;

}

function acceptTrade() public payable {
require(accepted == false, "Already accepted");
require(msg.sender != seller, "Seller cannot buy");
require(msg.value == price, "Wrong payment");

buyer = msg.sender;
accepted = true;

 }

  }
    
