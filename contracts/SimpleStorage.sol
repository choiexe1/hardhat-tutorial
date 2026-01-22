// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint public num;
    uint private id;

    mapping(uint => address) public addresses;

    // 상태 변수 쓰기 작업은 가스비가 발생
    // 아래의 경우 세번의 쓰기 작업이 발생함
    // 먼저 id++; 에 SSTORE 발생하고
    // 매핑해주는 부분에서 한번
    // 마지막 num에 할당하는 부분에서 한번.
    function set(uint _num) public {
        _setId();
        num = _num;
    }

    function _setId() private {
        id++;
        addresses[id] = msg.sender;
    }

    // 상태 변수 읽기 작업은 가스비가 발생하지 않는다
    // 결국 컨트랙트의 연산이 많으면 많을수록 가스비가 비싸진다, 왜냐면 분산원장시스템에서 모든 노드가 같은 상태를 가져야하기 때문
    // 상태 업데이트 치는 비용..
    // 따라서 상태 변수를 다룰 때 최소한의 연산을 수행해야 하는 것이 경쟁력을 가진다
    function get() public view returns (uint) {
        return num;
    }
}
