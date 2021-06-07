# hackmoney-cre

## How to run

Prerequisits:

NodeJS: https://nodejs.org/en/
MetaMask: https://metamask.io/
Truffle: https://www.trufflesuite.com/truffle
Ganache: https://www.trufflesuite.com/ganache

How to run:

Make sure you have Ganache up and running.

1. Install dependencies:

```
$ npm install
```

2. Run migrations

```
$ truffle migrate --reset
```

3. Run the project

```
$ npm start
```

## Structure

 * `migrations` - blockchain migrations
 * `src/contracts` - smart contracts
 * `src/abis` - abis
