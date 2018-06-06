pragma solidity ^0.4.19;

import "tokens/eip20/EIP20.sol";

contract RlayToken is EIP20 {
  function RlayToken() EIP20(
    10000000,
    "RLAY Token",
    10,
    "RLAY"
  ) public {}
}
