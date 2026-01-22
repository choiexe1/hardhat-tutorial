import assert from "node:assert/strict";
import { describe, it } from "node:test";

import { network } from "hardhat";

describe("SimpleStorage", async () => {
  const { viem } = await network.connect();
  const publicClient = await viem.getPublicClient();

  it("가스비 예측", async () => {
    const contract = await viem.deployContract("SimpleStorage");
    const args = 123n;

    const estimatedGas = await publicClient.estimateContractGas({
      address: contract.address,
      abi: contract.abi,
      functionName: "set",
      args: [args],
    });

    const writeTx = await contract.write.set([33n]);
    const receipt = await publicClient.getTransactionReceipt({ hash: writeTx });

    // 가스비 예측과 결과가 틀린 경우가 있는데
    // 컨트랙느 내에서 조건문 분기, 동적 배열 순회, 외부 컨트랙트 호출 등
    // 컨트랙트의 코드에 따라 예측이 틀릴 수 있다
    // 이 케이스에서는 분기문 등 동적으로 코드의 흐름이 바뀌지 않기때문에 예측과 동일함
    assert.equal(receipt.gasUsed, estimatedGas);
  });
});
