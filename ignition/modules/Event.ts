import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("EventModule", (m) => {
  const event = m.contract("Event");
  return { event };
});
