# rlay-protocol - Implementation of the Rlay protocol in Solidity

## Setup

- Make sure you have NPM installed.
- `npm install`

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
