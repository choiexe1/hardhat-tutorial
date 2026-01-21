// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "./HelloWorld.sol";

contract HelloWorldTest is Test {
    function test_Greet() public {
        HelloWorld hello = new HelloWorld();
        assertEq(hello.greet(), "Hello World!");
    }
}
