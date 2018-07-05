# rlay-protocol - Implementation of the Ɍlay protocol in Solidity

Smart contract for the Ɍlay protocol, a Decentralized Information Network.

The [whitepaper][rlay-whitepaper] gives a outline of the theoretical foundations of the protocol.

### Setup

- Make sure you have NPM installed.
- `npm install`

### Running locally

To run a local version of the testnet for e.g. development purposes in conjunction with [rlay-client][rlay-client-github], run in seperate terminal windows:

- `npm run testnet`
- `npm run deploy`

When testing in a scenario with multiple addresses, you may also want to use [Spout][spout-github] for distributing tokens and network currency to those addresses. The root of this project provides a Spout config file suitable for usage with the local testnet.

### Running tests

In seperate terminal windows run:

- `npm run testnet`
- `npm run test`

### Ontology Update Process

In order to update to a newer version of `ontology.proto` you need to do the following steps:

- Pull in the new `ontology.proto`
- Rewrite v3 protobuf to v2 protobuf (by hand)
- Run script to merge contracts (*TODO*) (requires [solpb][solpb-github])

## Contributing & Contact

We are very open to contributions! Feel free to open a [Github issue][github-issues], or a Pull Request.

If you want to get in contact you can find us here:

  - [Matrix chat room][matrix-chat] - development focused chat
  - [Telegram channel][telegram-chat] - general Rlay discussion

> Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as below, without any additional terms or conditions.

## License

Licensed under either of

  * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)


[solpb-github]: https://github.com/shmookey/solpb
[rlay-client-github]: https://github.com/rlay-project/rlay-client
[spout-github]: https://github.com/rlay-project/spout
[rlay-whitepaper]: https://rlay.com/rlay-whitepaper.pdf
[matrix-chat]: https://matrix.to/#/#rlay:matrix.org
[telegram-chat]: https://t.me/rlay_official
[github-issues]: https://github.com/rlay-project/rlay-protocol/issues
