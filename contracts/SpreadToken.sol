pragma solidity ^0.4.19;

import "tokens/eip20/EIP20.sol";

contract SpreadToken is EIP20 {
  function SpreadToken() EIP20(
    10000000,
    "SPRD Token",
    10,
    "SPRD"
  ) public {}
}
