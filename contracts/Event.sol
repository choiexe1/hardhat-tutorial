// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract Event {
    event Log(address indexed from);

    // 이런 이벤트는 SSTORE보단 저렴한 편에 속함
    // 이벤트는 메시지를 블록체인에 기록하는 것이므로
    // 메시지의 길이에 따라 가스비가 달라짐..
    // 외부 시스템에서 이벤트를 리스닝하며 로깅할 때 사용하거나.. 그 외의 이벤트를 통해 어떤 작업을 할 때 사용된다
    function emitLog() public {
        emit Log(msg.sender);
    }
}
