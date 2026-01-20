import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("CounterModule", (m) => {
  // Counter 컨트랙트 배포
  const counter = m.contract("Counter");

  // 배포 후 incBy(5) 호출
  m.call(counter, "incBy", [5n]);

  return { counter };
});
