pragma solidity ^0.8.4;

import "./Investment.sol";
import "./CloneFactory.sol";

contract InvestmentFactory is CloneFactory {
  mapping(address => Investment) public children;
  address private masterContract;

  event ChildCreated(Investment investment);
  event ChildRemoved();

  constructor(address _masterContract) {
    masterContract = _masterContract;
  }

  function createInvestment(string calldata _name, string calldata _description) external {
    Investment investment = Investment(payable (createClone(masterContract)));
    investment.init(_name, _description);
    children[address(investment)] = investment;
    
    emit ChildCreated(investment);
  }

  function removeChild(address childAddress) private {
    delete children[childAddress];

    emit ChildRemoved();
  }
}