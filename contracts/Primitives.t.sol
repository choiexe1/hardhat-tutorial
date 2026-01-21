// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {Primitives} from "./Primitives.sol";

contract PrimitivesTest is Test {
    Primitives primitives;

    function test_boo() public {
        primitives = new Primitives();
        assertEq(primitives.boo(), true);
    }

    function test_int() public {
        primitives = new Primitives();
        assertEq(primitives.i8(), int8(-1));
        assertEq(primitives.i256(), int256(-123));
        assertEq(primitives.i(), int256(-456));
    }

    function test_uint() public {
        primitives = new Primitives();
        assertEq(primitives.u8(), uint8(1));
        assertEq(primitives.u256(), uint256(123));
        assertEq(primitives.u(), uint(456));
    }

    function test_min_max() public {
        primitives = new Primitives();
        assertEq(primitives.minUint(), 0);
        assertEq(primitives.maxUint(), type(uint).max);
        assertEq(primitives.minInt(), type(int).min);
        assertEq(primitives.maxInt(), type(int).max);
    }

    function test_address() public {
        primitives = new Primitives();
        assertEq(primitives.addr(), address(0));
    }
}
