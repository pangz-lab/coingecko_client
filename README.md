<p align="center">
    <img src="https://lh3.googleusercontent.com/fife/APg5EOY3h1MG5I3ny2d3X9NITN9GNuyx8uPlEu50W6GhYw-CsCPY7h_8DN1l9uYw8J7YjmUl9pDhuUhv6yrh5gv9jENoaWQcPebQ4NcsweTAtsFB2ehWWa9ETrSWCLoRTEVax27GsKGKVB6lLYNN1776Mytpv0RlNXgsnA-1eP30YQopud2cqf0YOTudo-heagG4oieBKBGr2A4ChIrQ5t0UglNYpmz8Q_F57k9mdq8hrBzuDmyUhdFI40tFZtg_vUKIZTY_vd2BIJmGkZZ3nuMMyZbOOMhgSTMxzlpb3dA23Gd2ymBGfNobQZOa4hBOpd_XxibFox5EOQOd9XpSbhdPt0EIAzXEb4qVsMJ4_NMW7OEdk0JQAjaAsFzZvVYL-uKFu-vzWSFg_GRWteDkUUYhv60V1H2zrmAfDdN10lE5Y9aiMbyc-62XSzaCtGBwSmmfP8iCdMP_RsJquvqWHJTEHKW6mIC8BXbMqDu8ieTsUqc8veRBfHRgn1iA1lUywABUELyAANMCqZ450v6nDYOCiRXFVeIh9-O3G9PzGgYu7V0o7MSDBhL-3Y0kENycsIqzvnPSBQX38BOKgP77in8aXU9uBzS275CDoeCValoNwx2pZOXVmLFk7y_yBHArm3VD7ctfwP_NzOkC84zNcn2QVycgmBdsXlULj_Q-POX2W_LM7T4TxLQkoAn5B4SvBikTN-Le_Ge2WkQkIcA7U3_j8GUywRSYXr8m78xeZODWi9zJEFUfc8zYt-19PYcrx0YFSivwOqOxpIm-IEm6x4vyapjB-7X-ljxc2TzeWqOShXkyl5gKK0Evd-0U6hTVN_mL_uPWAlvWLs3LCKu9IZ5bVDEmJVtBspEhxdrjQQjNqur01g4VMy3Yy_KhNientu_AJm7ndNAeAQAoKfgiUtQNrtY306648slrRdKDOt5nTLWiHUWvXcUqh6u5KyTI1YNBneHQyWk2ExhxIUFPAi2QUnzeu21IBKUoele9BDGKEoOz4dV3J1qgi0-7C1kvvWtoxxnL5z-9LSwtAEW1vaw5iEy3yhAcbN9nrKtEC0O75e3XHR2eXt4NKxBF7dgdWX9lS_llslIsvw3rFx9VOLfcCM71HTCO3tczlf8abxHg1R6TlKWOGfqaYOBdqIRqPPF1sagLZvbe75uIjRbnCwBaRtVl4Z1s7Q30I_8Jeq2oJRCnYQcgbjpXRvpClEfhlJT76ybo9hT2aG_QFE01SwptYQ2A-btnwo9jimH0hc4vIQXR1_pMFHQa62rd2hSiTla5qo95WqTQWoVtbW55hN2h7LTF4IBm1ETYo81KFpM1HTzYR7LZQOQMs2_BaUaCQBetOmIWZKhLWRZC8_X3OVSRokTj6xuXtotwcHbXln661ITXs-1yCxdgWmpIL92mPjMlljMUA_kQJru0s_lm-DEqdZaFqmuj4fdNqGjZuEN1-FQgVRd-coSHPKd4F2RY2djuATNBtQU5nIwWgm-tuXM6YHX3KzliOp1glQzUURkKVaUq3-lxgfhY4IxRBgmHrw=w1862-h968"
    height="200" />
</p>

# coingecko_client
## Coingecko API client for the Dart Language
<br>
<p align="center">
    <img src="https://dart.dev/assets/shared/dart-logo-for-shares.png" height="100" />
</p>


A simple and intuitive API Client for the [CoinGecko REST API Service](https://www.coingecko.com/en/api/documentation).

API Version Support
---------------
- ✔️ API v3
- ✔️ Community Endpoint


Requirements
---------------
- ✔️ dart sdk: >= 2.19.3

Installation
---------------
Add the dependency to your Dart / Flutter project:
```yaml
dependencies:
  coingecko_api: ^1.0.0
```
---

# Usage 
- Initialize the client class
- Use the client properties to send the request
**
```dart
import 'package:coingecko_client/coingecko_client.dart';

var client = CoinGeckoClient();
```

___
## 🌐  [ ping endpoint ]
### 📤 **/ping**
```dart
client.ping.getResult():
```

___
## 🌐  [ coins endpoint ]
### 📤 **/coins/list**
```dart
client.coins.getBasicList():
```
### 📤 **/coins/{id}/history**
```dart
client.coins.getHistory(
    id: 'bitcoin',
    date: DateTime.now()
):
```
### 📤 **/coins/markets**
```dart
client.coins.getMarketList(
    vsCurrency: Currencies.php
):
```
### 📤 **/coins/{id}**
```dart
client.coins.getInfo(id: 'verus-coin'):
```
### 📤 **/coins/{id}/tickers**
```dart
client.coins.getTickers(id: 'bitcoin'):
```
### 📤 **/coins/{id}/market_chart**
```dart
client.coins.getMarketHistory(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.in1Day,
    interval: 'daily'
):
```
### 📤 **/coins/{id}/market_chart/range**
```dart
client.coins.getMarketHistoryWithDateRange(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1392577232),
    to: DateTime.fromMillisecondsSinceEpoch(1396587232)
):
```
### 📤 **/coins/{id}/ohlc**
```dart
client.coins.getOhlcList(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.max
):
```

___
## 🌐  [ exchanges endpoint ]
### 📤 **/exchanges**
```dart
client.exchanges.getList():
```
### 📤 **/exchanges/list**
```dart
client.exchanges.getBasicList():
```
### 📤 **/exchanges/{id}**
```dart
client.exchanges.getInfo(id: 'binance'):
```
### 📤 **/exchanges/{id}/tickers**
```dart
client.exchanges.getTickerList(
    id: 'binance',
    coinIds: ['bitcoin', 'ethereum'],
    includeExchangeLogo: true,
    page: 1,
    depth: true,
    order: ExchangeDataOrdering.trustScoreDesc
):
```
### 📤 **/exchanges/{id}/volume_chart**
```dart
client.exchanges.getVolumeChartList(
    id: 'binance',
    days: DataRange.in1Day
):
```

___
## 🌐  [ simple endpoint ]
### 📤 **/simple/price**
```dart
client.simple.getCoinPrice(
    ids: ['bitcoin', 'ethereum', 'verus-coin'],
    vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
):
```
### 📤 **/simple/token_price/{id}**
```dart
client.simple.getTokenPrice(
    id: 'avalanche',
    contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
    vsCurrencies: ['btc', 'eth'],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
):
```
### 📤 **/simple/supported_vs_currencies**
```dart
client.simple.getSupportedVsCurrencies():
```


___
## 🌐  [ derivatives endpoint ]
### 📤 **/derivatives**
```dart
client.derivatives.getList(
    includeTickers: DerivativesTickers.unexpired
):
```
### 📤 **/derivatives/exchanges**
```dart
client.derivatives.getExchangeList(
    order: DerivativesExchangeOrdering.nameAsc,
    perPage: 10,
    page: 2
):
```
### 📤 **/derivatives/exchanges/{id}**
```dart
client.derivatives.getExchange(
    id: "bybit",
    includeTickers: DerivativesTickers.unexpired
):
```
### 📤 **/derivatives/exchanges/list**
```dart
client.derivatives.getExchangeBasicInfoList():
```

___
## 🌐  [ indexes endpoint ]
### 📤 **/indexes**
```dart
client.indexes.getList(
    perPage: 10,
    page: 2
):
```
### 📤 **/indexes/{market_id}/{id}**
```dart
client.indexes.getInfo(
    marketId: 'bybit',
    id: 'HOT',
):
```
### 📤 **/indexes/list**
```dart
client.indexes.getBasicInfo():
```

___
## 🌐  [ nfts endpoint ]
### 📤 **/nfts/list**
```dart
client.nfts.getBasicList(
    perPage: 10,
    page: 2
):
```
### 📤 **/nfts/{id}**
```dart
client.nfts.getInfo(
    id: 'meebits',
):
```
### 📤 **/nfts/{asset_platform_id}/contract/{contract_address}**
```dart
client.nfts.getContractInfo(
    assetPlatformId: 'ethereum',
    contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
):
```


___
## 🌐  [ contract endpoint ]
### 📤 **/coins/{id}/contract/{contract_address}/market_chart**
```dart
client.contract.getMarketHistory(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.jpy,
    days : DataRange.in2Weeks,
):
```
### 📤 **/coins/{id}/contract/{contract_address}/market_chart/range**
```dart
client.contract.getMarketHistoryWithDateRange(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
    to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
):
```


___
## 🌐  [ categories endpoint ]
### 📤 **/coins/categories/list**
```dart
client.categories.getBasicList():
```
### 📤 **/coins/categories**
```dart
client.categories.getList(
    order: CoinCategoriesDataOrdering.marketCapAsc
):
```


___
## 🌐  [ global endpoint ]
### 📤 **/global**
```dart
client.global.getCryptoInfo():
```
### 📤 **/global/decentralized_finance_defi**
```dart
client.global.getDefiInfo():
```

___
## 🌐  [ exchange rates endpoint ]
### 📤 **/exchange_rates**
```dart
client.exchangeRates.getList():
```


___
## 🌐  [ companies endpoint ]
### 📤 **/companies/public_treasury/{coin_id}**
```dart
client.companies.getList(
    coinId: 'ethereum'
):
```

___
## 🌐  [ trending endpoint ]
### 📤 **/search/trending**
```dart
client.trending.getResult():
```


___
## 🌐  [ search endpoint ]
### 📤 **/search**
```dart
client.search.getResult(query: 'bybit'):
```