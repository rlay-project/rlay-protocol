# rlay-protocol - Implementation of the Ɍlay protocol in Solidity

Smart contract for the Ɍlay protocol, a Decentralized Information Network.

The [whitepaper][rlay-whitepaper] gives a outline of the theoretical foundations of the protocol.

## Setup

- Make sure you have NPM installed.
- `npm install`

## Running locally

To run a local version of the testnet for e.g. development purposes in conjunction with [rlay-client][rlay-client-github], run in seperate terminal windows:

- `npm run testnet`
- `npm run deploy`

When testing in a scenario with multiple addresses, you may also want to use [Spout][spout-github] for distributing tokens and network currency to those addresses. The root of this project provides a Spout config file suitable for usage with the local testnet.

## Running tests

In seperate terminal windows run:

- `npm run testnet`
- `npm run test`

## Ontology Update Process

In order to update to a newer version of `ontology.proto` you need to do the following steps:

- Pull in the new `ontology.proto`
- Rewrite v3 protobuf to v2 protobuf (by hand)
- Run script to merge contracts (*TODO*) (requires [solpb][solpb-github])


[solpb-github]: https://github.com/shmookey/solpb
[rlay-client-github]: https://github.com/rlay-project/rlay-client
[spout-github]: https://github.com/rlay-project/spout
[rlay-whitepaper]: https://rlay.com/rlay-whitepaper.pdf
