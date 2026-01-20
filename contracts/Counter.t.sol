import {Counter} from "./Counter.sol";

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Solidity 테스트 규칙
// | 항목 | 설명 |
// |-----|------|
// | 파일 확장자 | .t.sol 또는 test/ 디렉토리 내 .sol |
// | 테스트 함수 | test로 시작하는 public 함수 |
// | 통과 조건 | revert 없이 완료 |
// | 실패 조건 | revert 발생 |

contract CounterTest {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialValueIsZero() public view {
        require(counter.x() == 0, "Initial value should be zero");
    }

    function test_IncIncreasesByOne() public {
        counter.inc();
        require(counter.x() == 1, "Counter should increase by one");
    }

    function test_IncByIncreasesByGivenAmount() public {
        counter.incBy(3);
        require(counter.x() == 3, "Counter should increase by given amount");
    }
}
