# Blockchain Solar Energy TRading

**Sudent**: Marcela Carcamo L00205231
**Module**: TECHIT904 Block Chain - ATU Donegal

## What the app does

My project is a small decentralised application for trading solar energy between two people. For example, a household with solar panels sell 2 kWh of extra energy to a neighbour.
The buyer sends the payment to the smart contract. The money stays there until the meter confirms how much energy was delivered.

## After that:
- If the full amount of energy delovered, the seller receives the payment.
- If less energy is delivered, the money is returned to the buyer.

## Roles
| **Role** | **Account in Remix VM** | **What they can do** |
|---|---|---|
| Seller | Account 1 | Creates the contract and can call settle. |
| Buyer | Account 2 |Accepts the trade, makes the payment and can call settle.|
| Meter (oracle) |Account 3 |Confirms the amounts pf energy delivered using confimDelivery. |


## Fuctions 
- **acceptTrade()** - The buyer the trade and sends the correct payment.
- **confirmDelivery(uint)** - The meter confirms how many kWh wre delivered.
- **settle()** - Sends the money to the seller if delivery is correct, or returns it to buyer if lees enernergy was delivered. This function can only be used once.

## How to run it (Remix)

1. Open **EnergyTrade.sol** in Remix (https://remix.ethereum.org) and compile the contract using Solidity 0.8.x.
2. Deploy the contract using Account 1. Enter _kWh = 2, _price = **400000000000000** and the address of Account 3 as _meter.
3. Select Account 2, enter the payment amount **400000000000000** wei in Value (Low level interaction) and call **acceptTrade**.
4. Change Value back to 0.
5. Select Account 3 and call **confirmDelivery(2)**.
6. Finally, Account 1 or Account 2 can call **settle**.

## Test

I carried out manual A-K using Remix VM to check that the different function worked correctly and that the contract rejected actions that were not allowed. I also took screenshots of the test and saved them in the **evidebce folder.

| **Test** | **What I tested** | **Result** |
|---|---|---|
|A | The meter cannot confirm before the buyer pays. | Reject as expected: "Trade not accepted"  |
|B | The buyer sends the correct payment. | Reject as expected: "Successful"  |
|C | Only the meter can confirm the delivey. | Reject as expected: "Only meter can confirm"  |
|D/E | The delivery can not be confirm twice. | First Successful, second rejected: Already confirmed  |
|F | The buyer can not before delivey confirmed. | Reject as expected: "Delivery not confirmed"  |
|G | The meter cannot cal settle. | Reject as expected: "Not Allowed"  |
|H | The seller receives the payment after full delivy. | Successful: seller received 0.0004 ETH  |
|I | The same trade can not be settled twice. | Reject as expected: "Already settled"  |
|J | The buyer gets a refund if only 1 kWh is delivered instead of 2 kWh.. | Successful: money returned to buyer  |
|K | The seller cannot buy their own trade. | Reject as expected: "Seller cannot buy "  |
|L | The buyer cannot accept the same trade again. | Reject as expected: "Already accepted"  |

## Security

I added some checks using require to make sure that only the correct accounts can use each function.

- Only the buyer can accept the trade and make the payment.
- Only the meter can confirm the energy delivery.
- Only the seller or buyer can call settle.
- The contract checks that the payment is exactly the agreed price.
- The settled variable is changed to true before sending the money, to prevent the same payment from happening twice.












