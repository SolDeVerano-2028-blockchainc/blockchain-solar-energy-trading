// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;

contract EnergyTrade {
    address public seller;
    uint public kWh;
    uint public price;

    constructor(uint _kWh,uint _price) {
        seller=msg.sender;
        kWh = _kWh;
        price = _price;
}

  }
    