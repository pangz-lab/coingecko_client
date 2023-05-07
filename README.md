![version](https://img.shields.io/badge/version-v1.0.0-blue)
![coverage](https://img.shields.io/badge/coverage-100%25-success)
![version](https://img.shields.io/badge/sdk-v2.19.3-blue)
![license](https://img.shields.io/badge/license-BSD--3-blue)
[![GitHub issues by-label](https://img.shields.io/github/issues/badges/shields/open)](https://github.com/pangz-lab/coingecko_client/issues)

<a href="https://discord.gg/TK3WHBMk">
    <img src="https://img.shields.io/discord/1104687758301204512?logo=discord" alt="chat on Discord">
</a>
<a href="https://twitter.com/intent/follow?screen_name=Pangz55192569">
    <img src="https://img.shields.io/twitter/follow/Pangz55192569?style=social&logo=twitter" alt="follow on witter">
</a>

<p align="center">
    <img src="https://lh3.googleusercontent.com/fife/APg5EOY3h1MG5I3ny2d3X9NITN9GNuyx8uPlEu50W6GhYw-CsCPY7h_8DN1l9uYw8J7YjmUl9pDhuUhv6yrh5gv9jENoaWQcPebQ4NcsweTAtsFB2ehWWa9ETrSWCLoRTEVax27GsKGKVB6lLYNN1776Mytpv0RlNXgsnA-1eP30YQopud2cqf0YOTudo-heagG4oieBKBGr2A4ChIrQ5t0UglNYpmz8Q_F57k9mdq8hrBzuDmyUhdFI40tFZtg_vUKIZTY_vd2BIJmGkZZ3nuMMyZbOOMhgSTMxzlpb3dA23Gd2ymBGfNobQZOa4hBOpd_XxibFox5EOQOd9XpSbhdPt0EIAzXEb4qVsMJ4_NMW7OEdk0JQAjaAsFzZvVYL-uKFu-vzWSFg_GRWteDkUUYhv60V1H2zrmAfDdN10lE5Y9aiMbyc-62XSzaCtGBwSmmfP8iCdMP_RsJquvqWHJTEHKW6mIC8BXbMqDu8ieTsUqc8veRBfHRgn1iA1lUywABUELyAANMCqZ450v6nDYOCiRXFVeIh9-O3G9PzGgYu7V0o7MSDBhL-3Y0kENycsIqzvnPSBQX38BOKgP77in8aXU9uBzS275CDoeCValoNwx2pZOXVmLFk7y_yBHArm3VD7ctfwP_NzOkC84zNcn2QVycgmBdsXlULj_Q-POX2W_LM7T4TxLQkoAn5B4SvBikTN-Le_Ge2WkQkIcA7U3_j8GUywRSYXr8m78xeZODWi9zJEFUfc8zYt-19PYcrx0YFSivwOqOxpIm-IEm6x4vyapjB-7X-ljxc2TzeWqOShXkyl5gKK0Evd-0U6hTVN_mL_uPWAlvWLs3LCKu9IZ5bVDEmJVtBspEhxdrjQQjNqur01g4VMy3Yy_KhNientu_AJm7ndNAeAQAoKfgiUtQNrtY306648slrRdKDOt5nTLWiHUWvXcUqh6u5KyTI1YNBneHQyWk2ExhxIUFPAi2QUnzeu21IBKUoele9BDGKEoOz4dV3J1qgi0-7C1kvvWtoxxnL5z-9LSwtAEW1vaw5iEy3yhAcbN9nrKtEC0O75e3XHR2eXt4NKxBF7dgdWX9lS_llslIsvw3rFx9VOLfcCM71HTCO3tczlf8abxHg1R6TlKWOGfqaYOBdqIRqPPF1sagLZvbe75uIjRbnCwBaRtVl4Z1s7Q30I_8Jeq2oJRCnYQcgbjpXRvpClEfhlJT76ybo9hT2aG_QFE01SwptYQ2A-btnwo9jimH0hc4vIQXR1_pMFHQa62rd2hSiTla5qo95WqTQWoVtbW55hN2h7LTF4IBm1ETYo81KFpM1HTzYR7LZQOQMs2_BaUaCQBetOmIWZKhLWRZC8_X3OVSRokTj6xuXtotwcHbXln661ITXs-1yCxdgWmpIL92mPjMlljMUA_kQJru0s_lm-DEqdZaFqmuj4fdNqGjZuEN1-FQgVRd-coSHPKd4F2RY2djuATNBtQU5nIwWgm-tuXM6YHX3KzliOp1glQzUURkKVaUq3-lxgfhY4IxRBgmHrw=w1862-h968"
    height="175" />
</p>

# coingecko_client
## Coingecko API client for Dart
<br>
<p>
    <img src="https://dart.dev/assets/shared/dart-logo-for-shares.png" height="150" />
</p>


A simple and intuitive package to access the [CoinGecko REST API Service](https://www.coingecko.com/en/api/documentation).

API Version Support
---------------
- ✔️ API v3
- ✔️ Community


Requirements
---------------
- ✔️ dart sdk: >= 2.19.3

Installation
---------------
Add the dependency to your Dart / Flutter project:
```yaml
dependencies:
  coingecko_client: ^1.0.0
```

<p></p>Go to <a href="https://pub.dev/packages/coingecko_client">pub.dev</a> for more details.</p>
---


# Usage 
- Initialize the client class
- Use the client properties to send the request
- ( Checkout the <a href="https://github.com/pangz-lab/coingecko_client/tree/master/example">example folder</a> for more practical usage )

```dart
import 'package:coingecko_client/coingecko_client.dart';

var client = CoinGeckoClient();
```

___
<br>

# 🌐 ping
### 📤 */ping*
```dart
client.ping.getResult();
```

___
<br>

# 🌐 coins
### 📤 */coins/list*
```dart
client.coins.getBasicList();
```
### 📤 */coins/{id}/history*
```dart
client.coins.getHistory(
    id: 'bitcoin',
    date: DateTime.now()
);
```
### 📤 */coins/markets*
```dart
client.coins.getMarketList(
    vsCurrency: Currencies.php
);
```
### 📤 */coins/{id}*
```dart
client.coins.getInfo(id: 'verus-coin');
```
### 📤 */coins/{id}/tickers*
```dart
client.coins.getTickers(id: 'bitcoin');
```
### 📤 */coins/{id}/market_chart*
```dart
client.coins.getMarketHistory(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.in1Day,
    interval: 'daily'
);
```
### 📤 */coins/{id}/market_chart/range*
```dart
client.coins.getMarketHistoryWithDateRange(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1392577232),
    to: DateTime.fromMillisecondsSinceEpoch(1396587232)
);
```
### 📤 */coins/{id}/ohlc*
```dart
client.coins.getOhlcList(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.max
);
```

___
<br>

# 🌐 exchanges
### 📤 */exchanges*
```dart
client.exchanges.getList();
```
### 📤 */exchanges/list*
```dart
client.exchanges.getBasicList();
```
### 📤 */exchanges/{id}*
```dart
client.exchanges.getInfo(id: 'binance');
```
### 📤 */exchanges/{id}/tickers*
```dart
client.exchanges.getTickerList(
    id: 'binance',
    coinIds: ['bitcoin', 'ethereum'],
    includeExchangeLogo: true,
    page: 1,
    depth: true,
    order: ExchangeDataOrdering.trustScoreDesc
);
```
### 📤 */exchanges/{id}/volume_chart*
```dart
client.exchanges.getVolumeChartList(
    id: 'binance',
    days: DataRange.in1Day
);
```

___
<br>

# 🌐 simple
### 📤 */simple/price*
```dart
client.simple.getCoinPrice(
    ids: ['bitcoin', 'ethereum', 'verus-coin'],
    vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
);
```
### 📤 */simple/token_price/{id}*
```dart
client.simple.getTokenPrice(
    id: 'avalanche',
    contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
    vsCurrencies: [ CryptoCurrencies.btc, CryptoCurrencies.eth ],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
);
```
### 📤 */simple/supported_vs_currencies*
```dart
client.simple.getSupportedVsCurrencies();
```


___
<br>

# 🌐 derivatives
### 📤 */derivatives*
```dart
client.derivatives.getList(
    includeTickers: DerivativesTickers.unexpired
);
```
### 📤 */derivatives/exchanges*
```dart
client.derivatives.getExchangeList(
    order: DerivativesExchangeOrdering.nameAsc,
    perPage: 10,
    page: 2
);
```
### 📤 */derivatives/exchanges/{id}*
```dart
client.derivatives.getExchange(
    id: "bybit",
    includeTickers: DerivativesTickers.unexpired
);
```
### 📤 */derivatives/exchanges/list*
```dart
client.derivatives.getExchangeBasicInfoList();
```

___
<br>

# 🌐 indexes
### 📤 */indexes*
```dart
client.indexes.getList(
    perPage: 10,
    page: 2
);
```
### 📤 */indexes/{market_id}/{id}*
```dart
client.indexes.getInfo(
    marketId: 'bybit',
    id: 'HOT',
);
```
### 📤 */indexes/list*
```dart
client.indexes.getBasicInfo();
```

___
<br>

# 🌐 nfts
### 📤 */nfts/list*
```dart
client.nfts.getBasicList(
    perPage: 10,
    page: 2
);
```
### 📤 */nfts/{id}*
```dart
client.nfts.getInfo(
    id: 'meebits',
);
```
### 📤 */nfts/{asset_platform_id}/contract/{contract_address}*
```dart
client.nfts.getContractInfo(
    assetPlatformId: 'ethereum',
    contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
);
```


___
<br>

# 🌐 contract
### 📤 */coins/{id}/contract/{contract_address}/market_chart*
```dart
client.contract.getMarketHistory(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.jpy,
    days : DataRange.in2Weeks,
);
```
### 📤 */coins/{id}/contract/{contract_address}/market_chart/range*
```dart
client.contract.getMarketHistoryWithDateRange(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
    to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
);
```


___
<br>

# 🌐 categories
### 📤 */coins/categories/list*
```dart
client.categories.getBasicList();
```
### 📤 */coins/categories*
```dart
client.categories.getList(
    order: CoinCategoriesDataOrdering.marketCapAsc
);
```


___
<br>

# 🌐 global
### 📤 */global*
```dart
client.global.getCryptoInfo();
```
### 📤 */global/decentralized_finance_defi*
```dart
client.global.getDefiInfo();
```

___
<br>

# 🌐 exchange rates
### 📤 */exchange_rates*
```dart
client.exchangeRates.getList();
```


___
<br>

# 🌐 companies
### 📤 */companies/public_treasury/{coin_id}*
```dart
client.companies.getList(
    coinId: 'ethereum'
);
```

___
<br>

# 🌐 trending
### 📤 */search/trending*
```dart
client.trending.getResult();
```


___
<br>

# 🌐 search
### 📤 */search*
```dart
client.search.getResult(query: 'bybit');
```

<br>

🐞 Issues / Bugs / Improvements
---------------
- If you found any issues or bugs or any concerns, please reach me out using the following contacts.
- If you require an urgent fix, raise an issue and I'll try to find time to resolve it.
- Should you decide to make your own change, raise your PR to the main branch and let me know.

<br>

Contacts
---------------

<p>
<img src="https://static-00.iconduck.com/assets.00/gmail-icon-512x389-x9sg6cf6.png" height="15"> pangz.lab@gmail.com
</p>
<p>
<img src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/6266bc493fb42d4e27bb8393_847541504914fd33810e70a0ea73177e.ico" height="25"> Pangz#4102
</p>