import assert from "node:assert/strict";
import { describe, it } from "node:test";

// Hardhat의 네트워크 객체 - 블록체인 연결 및 컨트랙트 상호작용에 사용
import { network } from "hardhat";

describe("Counter", async () => {
  // 시뮬레이션 네트워크에 연결하고 viem 클라이언트 획득
  // viem: 컨트랙트 배포 및 함수 호출용 클라이언트
  const { viem } = await network.connect();

  // publicClient: 블록체인 읽기 전용 클라이언트 (블록 번호 조회, 이벤트 조회 등)
  const publicClient = await viem.getPublicClient();

  it("Increment 이벤트의 합이 현재 값과 일치해야함", async () => {
    // 1. 컨트랙트 배포
    // 문자열로 artifacts/contracts/Counter.sol/Counter.json 경로에 hardhat 프레임워크로 빌드한 바이트코드로 변환된 컨트랙트를 알아서 찾아서
    // Counter.sol 컨트랙트를 로컬 시뮬레이션 네트워크에 배포
    const counter = await viem.deployContract("Counter");

    // 배포된 블록 번호 저장 (이벤트 조회 시 시작점으로 사용)
    const deploymentBlockNumber = await publicClient.getBlockNumber();

    // 2. incBy 함수 10번 호출
    // 1n, 2n, ... 10n: BigInt 리터럴
    // BigInt: 이더리움의 큰 숫자(uint256)를 정확히 표현하기 위해 사용
    // 호출 결과: x = 1 + 2 + 3 + ... + 10 = 55
    for (let i = 1n; i <= 10n; i++) {
      // counter.write: 상태를 변경하는 쓰기 트랜잭션 전송
      // incBy([i]): 인자를 배열로 전달
      await counter.write.incBy([i]);
    }

    // 3. 발생한 이벤트 조회
    // 컨트랙트에서 발생한 Increment 이벤트들 조회
    const events = await publicClient.getContractEvents({
      address: counter.address, // 조회할 컨트랙트 주소
      abi: counter.abi, // 컨트랙트 ABI (배포된 컨트랙트 자체는 바이트코드기 때문에.. 이벤트 해석용으로 사용함)
      eventName: "Increment", // 조회할 이벤트 이름
      fromBlock: deploymentBlockNumber, // 조회 시작 블록
      strict: true, // 엄격 모드: 타입 안전한 이벤트 args 반환
    });

    // 4. 이벤트 값 계산
    let total = 0n; // 0n 인 이유는 반환값의 타입떄문임, 빅인트 리터럴
    for (const event of events) {
      total += event.args.by;
    }

    // 5. 검증
    // counter.read: 상태를 읽기만 하는 호출 (블록체인의 상태를 변경하는 작업이 아닐때는 가스비 없음)
    // counter.read.x(): Counter 컨트랙트의 public 변수 x 값 조회
    assert.equal(total, await counter.read.x());
  });
});
