import React, { useState, useEffect } from 'react';
import Web3 from 'web3';
import MyContract from '../abis/MyContract.json';
import './App.css';

const App = () => {
  const [ account, setAccount ] = useState('0x0');
  const [ mainContract, setMainContract ] = useState({});

  const loadBlockchainData = async () => {
    const web3 = window.web3;
    const accounts = await web3.eth.getAccounts();

    setAccount(accounts[0]);

    const networkId = await web3.eth.net.getId();
    const myContractData = MyContract.networks[networkId];
    if (myContractData) {
      const myContract = new web3.eth.Contract(MyContract.abi, myContractData.address);
      
      setMainContract(myContract);
    } else {
      window.alert('MyContract contract not deployed to detected network');
    }
  };

  const loadWeb3 = async () => {
    if (window.ethereum) {
      window.web3 = new Web3(window.ethereum);
      await window.ethereum.enable();
    }
    else if (window.web3) {
      window.web3 = new Web3(window.web3.currentProvider);
    }
    else {
      window.alert('Non-Ethereum browser detected. You should consider using Metamask');
    }
  };

  useEffect(() => {
    const init = async () => {
      await loadWeb3();
      await loadBlockchainData();
    };

    init();
  }, []);

  const callMyContract = async () => {
    const contractMessage = await mainContract.methods.getInitMessage().call();
    alert(contractMessage);
  };

  return (
    <div>
      <div className="container-fluid mt-5">
        <div className="row">
          <main role="main" className="col-lg-12 ml-auto mr-auto" style={{ maxWidth: '600px' }}>
            <div>
              My account: { account }
            </div>
            <button
              onClick={ callMyContract }
            >
              What does your contract say?
            </button>
          </main>
        </div>
      </div>
    </div>
  );
};

export default App;
