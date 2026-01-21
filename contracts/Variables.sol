// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Variables {
    // State 변수는 블록체인에 저장됨
    string public text = "HELLO";
    uint public num = 123;

    function doSometing() public view returns (uint, address) {
        // Local 변수, state 변수에 비해 상대적으로 가스비가 저렴
        uint i = 456;

        // Global 변수는 블록체인이 제공함, 공짜
        uint timestamp = block.timestamp;
        address sender = msg.sender;

        return (i + timestamp, sender);
    }
}
