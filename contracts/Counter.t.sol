import {Counter} from "./Counter.sol";
import {Test} from "forge-std/Test.sol";

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Solidity 테스트 규칙
// | 항목 | 설명 |
// |-----|------|
// | 파일 확장자 | .t.sol 또는 test/ 디렉토리 내 .sol |
// | 테스트 함수 | test로 시작하는 public 함수 |
// | 통과 조건 | revert 없이 완료 |
// | 실패 조건 | revert 발생 |

contract CounterTest is Test {
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

    function test_IncEmitsIncrementEvent() public {
        vm.expectEmit();
        emit Counter.Increment(1);

        counter.inc();
    }

    // 요약
    // | 구분 | 일반 테스트 | 퍼즈 테스트 |
    // |-----|-----------|-----------|
    // | 입력값 | 고정값 | 무작위 생성 |
    // | 실행 횟수 | 1회 | 다수 |
    // | 함수 매개변수 | 없음 | 있음 |
    // | 목적 | 특정 케이스 검증 | 광범위한 엣지 케이스 발견 |
    // > 퍼즈 테스트는 수동으로 생각하기 어려운 엣지 케이스를 자동으로 발견하는 데 유용합니다.
    function testFuzz_Inc(uint8 x) public {
        for (uint8 i = 0; i < x; i++) {
            counter.inc();
        }

        require(counter.x() == x, "Counter should increase by given amount");
    }
}
