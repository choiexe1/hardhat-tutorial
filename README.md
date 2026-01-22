# Hardhat 3 튜토리얼

Hardhat 3 Beta 프로젝트 (`node:test` + `viem`)

## 배포된 컨트랙트

### Myto (ERC20 토큰)

| 항목 | 값 |
|-----|---|
| 네트워크 | Polygon Amoy (테스트넷) |
| 주소 | `0x7dD7c0c8b792a2b819f85DA3c7d978C7225A3Ebf` |
| 이름 / 심볼 | Myto / MT |
| Owner만 민트 가능 | ✓ |

[Polygonscan에서 보기](https://amoy.polygonscan.com/address/0x7dD7c0c8b792a2b819f85DA3c7d978C7225A3Ebf)

## 프로젝트 구조

```
contracts/
├── Counter.sol      # 카운터 컨트랙트 (튜토리얼)
├── Counter.t.sol    # 카운터 Solidity 테스트
├── Myto.sol         # ERC20 토큰 컨트랙트
└── Myto.t.sol       # Myto Solidity 테스트

test/
└── Counter.ts       # TypeScript 통합 테스트

ignition/modules/
├── Counter.ts       # Counter 배포 모듈
└── Myto.ts          # Myto 배포 모듈
```

## 명령어

### 빌드

```shell
pnpm hardhat build
```

### 테스트

```shell
pnpm hardhat test              # 전체 테스트
pnpm hardhat test solidity     # Solidity만
pnpm hardhat test nodejs       # TypeScript만
```

### 커버리지

```shell
pnpm hardhat test --coverage
```

## 배포

### 로컬 시뮬레이션 (임시)

```shell
pnpm hardhat ignition deploy ignition/modules/Myto.ts
```

### 로컬 노드

```shell
# 터미널 1: 노드 실행
pnpm hardhat node

# 터미널 2: 배포
pnpm hardhat ignition deploy ignition/modules/Myto.ts --network localhost
```

### 배포된 컨트랙트와 상호작용

```shell
pnpm hardhat console --network localhost
```

```typescript
const { viem } = await network.connect();
const myto = await viem.getContractAt("Myto", "<배포된_주소>");

// 1000 토큰 민트
const [owner] = await viem.getWalletClients();
await myto.write.mint([owner.account.address, 1000n * 10n ** 18n]);

// 잔액 확인
await myto.read.balanceOf([owner.account.address]);
```

### Polygon Amoy 테스트넷

```shell
# 개인키 설정
pnpm hardhat keystore set AMOY_PRIVATE_KEY

# 배포
pnpm hardhat ignition deploy ignition/modules/Myto.ts --network amoy
```

## Solidity 학습 진행 (Solidity by Example)

### 완료

- [x] Hello World
- [x] First App (Counter)
- [x] Primitive Data Types
- [x] Variables
- [x] Constants & Immutable
- [x] Reading and Writing to State Variable
- [x] Gas and Gas Price
- [x] Mapping
- [x] Events

### 다음

- [ ] Ether and Wei
- [ ] If/Else
- [ ] For and While Loop
- [ ] Array
- [ ] Enum
- [ ] Struct
- [ ] Data Locations (Storage, Memory, Calldata)
- [ ] Function
- [ ] View and Pure Functions
- [ ] Error (require, revert, assert)
- [ ] Modifier
- [ ] Constructor
- [ ] Inheritance
- [ ] Visibility
- [ ] Interface

참고: https://solidity-by-example.org

## 참고

- [Hardhat 3 시작하기](https://hardhat.org/docs/getting-started)
- [Hardhat Ignition](https://hardhat.org/ignition/docs)
- [viem](https://viem.sh/)
