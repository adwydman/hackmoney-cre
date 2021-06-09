## Contracts

### Investment

Smart contract representing a single investment.

Attributes:
 - `name`
 - `decription`
 - `stage` - pending, approved, declined
 - `minApproves` - minimum required number of approvals
 - `minDeclines` - minimum required number of declines

Methods:
 - `approve` - sender can approve an investment
 - `decline` - sender can decline an investment

#### To do:

 - Check if the sender has entered the validation pool
 - Case where a sender that previously approved/declined now does the opposite
 - Rewarding/punishing mechanisms
 - Add more details about the investment


### InvestmentFactory

`InvestmentFactory` uses `CloneFactory` which produces clones of `Investment` smart contract.

Factory is a popular design pattern, where a class/function produces multiple instances of the same objects.

These objects have the same structure, methods and attributes.

Unfortunately simply creating new smart contracts and adding them to the blockchain costs a lot of ETH.

Therefore it's better to use a factory that produces clones.

The `Investment` smart contract is deployed onto the blockchain once and clones are created off of it.

#### To do:

 - Check if user entered the pool before submitting an investment

### ValidationPool

Smart contract handling validators entering and leaving the pool.

User first has to enter the pool before they are able to submit or validate investments

### ValToken

Smart contract representing rewards for participating in the pool.