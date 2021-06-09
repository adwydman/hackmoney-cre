pragma solidity ^0.8.4;

contract ValidationPool {
  address public owner;
  mapping(address => bool) public activeStakers;
  mapping(address => uint) public stakingAmount;

  constructor() {
    owner = msg.sender;
  }

  receive() external payable {
    require(msg.value > 0, "Amount cannot be 0");

    if (activeStakers[msg.sender] == false) {
      activeStakers[msg.sender] = true;
      stakingAmount[msg.sender] = 0;
    }

    stakingAmount[msg.sender] += msg.value;
  }

  function withdrawFunds(uint amountToWithdraw) external {
    require(activeStakers[msg.sender] == true, "You are not currently staking");
    require(amountToWithdraw <= stakingAmount[msg.sender], "You are trying to withdraw more than deposited");

    uint currentAmount = stakingAmount[msg.sender];
    stakingAmount[msg.sender] = currentAmount - amountToWithdraw;

    if (stakingAmount[msg.sender] == 0) {
      activeStakers[msg.sender] = false;
    }

    payable(msg.sender).transfer(amountToWithdraw);
  }
}