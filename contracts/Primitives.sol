// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Primitives {
    // 불리언
    bool public boo = true;

    // signed int
    int8 public i8 = -1;
    int256 public i256 = -123;
    // int  == int256
    int public i = -456;

    // unsigned int
    uint8 public u8 = 1;
    uint256 public u256 = 123;
    // uint == uint256
    uint public u = 456;

    // 최소/최대
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    uint public minUint = type(uint).min;
    uint public maxUint = type(uint).max;

    // 주소타입
    address public addr = address(0);

    // 바이트
    bytes1 public b1 = 0x12;
    bytes32 public b32 =
        0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;

    // 초기화 안하면 기본값됨
    // 숫자타입은 다 0
    bool public defaultBool; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000...000 이거는 Zero Address 라고 부르는데, 보통 없음 또는 소각을 의미한다고 함
}
