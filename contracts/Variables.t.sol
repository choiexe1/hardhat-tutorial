// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {Variables} from "./Variables.sol";

contract VariablesTest is Test {
    Variables variables;

    // 셋업 함수가 있는데.. beforeEach랑 같은것인듯
    function setUp() public {
        variables = new Variables();
    }

    function test_doSomething() public {
        (uint result, address sender) = variables.doSometing();
        assertEq(result, 456 + block.timestamp);
        assertEq(sender, address(this));
    }
}
