import {Myto} from "./Myto.sol";
import {Test} from "forge-std/Test.sol";

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract MytoTest is Test {
    Myto public myto;

    function setUp() public {
        myto = new Myto();
    }

    function testMint() public {
        myto.mint(address(this), 1000);
        assertEq(myto.balanceOf(address(this)), 1000);
    }
}
