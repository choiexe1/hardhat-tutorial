// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Constants {
    // 상수는 바이트코드에 포함되서 가스비 저렴함
    address public constant MY_ADDRESS =
        address(0x6bef025f14D36bcB6b881cf54e2A5eA0Cf007613);
    uint public constant MY_UINT = 123;

    // immutable 생성자 불변변수
    // 생성자에만 사용가능함
    address public immutable owner;
    uint public immutable myUint;

    // 상태변수가 가장 비싸고 나머지 로컬 변수, 상수, 이뮤터블은 비슷함
    constructor() {
        owner = msg.sender;
        myUint = 456;
    }
}
