# Project Memory: crypto-api-core

## Architecture
- NestJS multi-tenant crypto billing API (deposits, withdrawals, balances)
- Networks: Ethereum, BNB (EVM via ethers.js), Tron (TronWeb), Bitcoin (bitcoinjs-lib + mempool.space)
- ORM: Kysely with CamelCasePlugin (DB snake_case → entities camelCase)
- Queue: BullMQ + outbox pattern for events

## Key Files
- `src/modules/networks/types/network.type.ts` — `SupportedNetworks` enum + shared interfaces
- `src/modules/networks/services/networks.service.ts` — main network facade (all switch statements)
- `src/modules/networks/types/network-service.ts` — `INetworkService` interface
- `src/configs/networks.configs.ts` — all network RPC/account config
- `src/modules/goldrush/types/chain.ts` — GoldrushChainMap (must cover all SupportedNetworks)

## BTC Integration (feature/devco-9/btc-integration)
- Libraries: `bitcoinjs-lib`, `ecpair`, `tiny-secp256k1`
- New files:
  - `src/modules/networks/bitcoin/constant.ts`
  - `src/modules/networks/bitcoin/services/mempool.service.ts` (mempool.space API)
  - `src/modules/networks/bitcoin/services/bitcoin-network.service.ts`
  - `src/modules/networks/bitcoin/bitcoin-network.module.ts`
  - `src/modules/networks/bitcoin/__tests__/bitcoin-network.service.spec.ts` (16 tests passing)
- P2WPKH addresses; testnet addresses start with `tb1`
- PSBT `witnessUtxo.value` and `addOutput.value` must be `bigint` (not `number`)
- `Decimal.toDecimalPlaces(0)` not `.toInteger()` for rounding

## HD Wallets (merged from master faeture/devco-31/HD-wallets)
- `src/modules/networks/services/hd-wallet.service.ts` — derives wallets for all networks
- BIP44 coin types: ETH/BNB=60, TRON=195, BTC=0
- HD path: `m/44'/${coinType}'/0'/0` (account-level node cached on init)
- BTC derivation: ethers HDNodeWallet → raw private key bytes → ECPair → P2WPKH → WIF
- `sweepBase` in `BtcNetworkService` expects WIF private key (from `ECPair.fromWIF`)
- `deposit-pool.service.ts` uses `hdWalletService.deriveWallet()` instead of `networksService.createAccount()`
- `deposit_pool_account` table: dropped `private_key`, added `derivation_index`
- Env var: `BTC_HD_MNEMONIC` required for BTC HD derivation

## Pre-existing Test Failures
- `src/modules/withdrawal/__tests__/withdrawal.service.spec.ts` — 2 tests fail (expect `BadRequestException` but get `HttpException`) — pre-existing, unrelated to BTC

## Error Handling Pattern
```typescript
throw ExceptionFactory.create({
  exceptionCode: 'module.errorReason',
  statusCode: HttpStatus.BAD_REQUEST,
  message: 'Human-readable message',
});
```

## Adding a New Network — Checklist
1. Add to `SupportedNetworks` enum
2. Add config section to `networks.configs.ts`
3. Create `<network>-network.module.ts` (import `ConfigModule.forFeature(networksConfigs)`)
4. Create service implementing `INetworkService`
5. Import module in `networks.module.ts`
6. Add `BtcNetworkService` to `NetworksService` constructor + all switch statements
7. Add to `GoldrushChainMap` in `src/modules/goldrush/types/chain.ts`
8. Update `sweep-funds-idempotency.spec.ts` constructor call if adding new service param
