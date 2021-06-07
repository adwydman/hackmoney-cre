pragma solidity ^0.8.4;

contract MyContract {
  string private initMessage;

  constructor() {
    initMessage = 'Hello there!';
  }

  function getInitMessage() external view returns (string memory) {
    return initMessage;
  } 
}

