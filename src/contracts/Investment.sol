pragma solidity ^0.8.4;

contract Investment {
  enum Stages {
    PENDING,
    APPROVED,
    DECLINED
  }

  string public name;
  string public description;
  uint public minApproves;
  uint public minDeclines;
  Stages public stage = Stages.PENDING;

  address[] public approvers;
  mapping(address => bool) hasApproved;

  address[] public decliners;
  mapping(address => bool) hasDeclined;

  event Approved(uint length, uint minApprovers);
  event Declined();

  function init(string calldata _name, string calldata _description) external {
    name = _name;
    description = _description;
    minApproves = 3;
    minDeclines = 3;
  }

  modifier onlyPending {
    require(stage == Stages.PENDING, "Invalid investment stage, needs to be pending");
    _;
  }

  function approve() external onlyPending {
    require(!hasApproved[msg.sender], "Caller has already approved this investment");

    approvers.push(msg.sender);
    hasApproved[msg.sender] = true;

    if (approvers.length >= minApproves) {
      stage = Stages.APPROVED;
      emit Approved(approvers.length, minApproves);
    }
  }

  function decline() external onlyPending {
    require(!hasDeclined[msg.sender], "Caller has already declined this investment");

    decliners.push(msg.sender);
    hasDeclined[msg.sender] = true;

    if (decliners.length >= minDeclines) {
      stage = Stages.DECLINED;
      emit Declined();
    }
  }
}