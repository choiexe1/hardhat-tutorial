import { network } from "hardhat";

const { viem } = await network.connect("localhost");

// hardhat의 로컬 편의 기능.. 10개의 지갑 자동 생성함, 그 중 디폴트 지갑 사용하는것
// 명시적으로 선언하든 안하든 작동은 함
// 테스트넷이나 메인넷의 경우 PK 설정해야함
// 이런걸 봤을 때 블록체인은 그 테스트 코드 작성이 정말 중요할듯..
const [wallet] = await viem.getWalletClients();
const ev = await viem.getContractAt(
  "Event",
  "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512",
);

await ev.write.emitLog({ account: wallet.account });

//
// go_contract_event_monitor on  main [+] via 🐹 v1.25.5 took 3s
// ❯ go run monitor.go
// Hardhat 로컬 노드 연결 성공
// 이벤트 감지 시작: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
// [Block 7] from: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, tx: 0xf9634b338059bee6f13bfe314a6598c87f9d4633f669dda17713bf8221988d6e
// [Block 8] from: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, tx: 0xeac8dea1ef673ba79b0540268b0f853eadb71f92d5907edbba4616938294c1b5
// [Block 9] from: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, tx: 0x714cffaf96ceacae3ad885b211c25799067f3be23397f1e66d573b15b9ab1c11
