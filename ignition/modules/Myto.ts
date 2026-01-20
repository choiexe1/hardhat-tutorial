import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("MytoModule", (m) => {
  const myto = m.contract("Myto");
  return { myto };
});
