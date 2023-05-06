## [ ping endpoint]
___
#### /ping
```dart
client.ping.getResult():
```

## [ coins endpoint]
___
#### /coins/list
```dart
client.coins.getBasicList():
```
#### /coins/{id}/history
```dart
client.coins.getHistory(
    id: 'bitcoin',
    date: DateTime.now()
):
```
#### /coins/markets
```dart
client.coins.getMarketList(
    vsCurrency: Currencies.php
):
```
#### /coins/{id}
```dart
client.coins.getInfo(id: 'verus-coin'):
```
#### /coins/{id}/tickers
```dart
client.coins.getTickers(id: 'bitcoin'):
```
#### /coins/{id}/market_chart
```dart
client.coins.getMarketHistory(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.in1Day,
    interval: 'daily'
):
```
#### /coins/{id}/market_chart/range
```dart
client.coins.getMarketHistoryWithDateRange(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1392577232),
    to: DateTime.fromMillisecondsSinceEpoch(1396587232)
):
```
#### /coins/{id}/ohlc
```dart
client.coins.getOhlcList(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.max
):
```

## [ exchanges endpoint]
___
#### /exchanges
```dart
client.exchanges.getList():
```
#### /exchanges/list
```dart
client.exchanges.getBasicList():
```
#### /exchanges/{id}
```dart
client.exchanges.getInfo(id: 'binance'):
```
#### /exchanges/{id}/tickers
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
#### /exchanges/{id}/volume_chart
```dart
client.exchanges.getVolumeChartList(
    id: 'binance',
    days: DataRange.in1Day
):
```

## [ simple endpoint]
___
#### /simple/price
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
#### /simple/token_price/{id}
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
#### /simple/supported_vs_currencies
```dart
client.simple.getSupportedVsCurrencies():
```


## [ derivatives endpoint]
___
#### /derivatives
```dart
client.derivatives.getList(
    includeTickers: DerivativesTickers.unexpired
):
```
#### /derivatives/exchanges
```dart
client.derivatives.getExchangeList(
    order: DerivativesExchangeOrdering.nameAsc,
    perPage: 10,
    page: 2
):
```
#### /derivatives/exchanges/{id}
```dart
client.derivatives.getExchange(
    id: "bybit",
    includeTickers: DerivativesTickers.unexpired
):
```
#### /derivatives/exchanges/list
```dart
client.derivatives.getExchangeBasicInfoList():
```

## [ indexes endpoint]
___
#### /indexes
```dart
client.indexes.getList(
    perPage: 10,
    page: 2
):
```
#### /indexes/{market_id}/{id}
```dart
client.indexes.getInfo(
    marketId: 'bybit',
    id: 'HOT',
):
```
#### /indexes/list
```dart
client.indexes.getBasicInfo():
```

## [ nfts endpoint]
___
#### /nfts/list
```dart
client.nfts.getBasicList(
    perPage: 10,
    page: 2
):
```
#### /nfts/{id}
```dart
client.nfts.getInfo(
    id: 'meebits',
):
```
#### /nfts/{asset_platform_id}/contract/{contract_address}
```dart
client.nfts.getContractInfo(
    assetPlatformId: 'ethereum',
    contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
):
```


## [ contract endpoint]
___
#### /coins/{id}/contract/{contract_address}/market_chart
```dart
client.contract.getMarketHistory(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.jpy,
    days : DataRange.in2Weeks,
):
```
#### /coins/{id}/contract/{contract_address}/market_chart/range
```dart
client.contract.getMarketHistoryWithDateRange(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
    to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
):
```


## [ categories endpoint]
___
#### /coins/categories/list
```dart
client.categories.getBasicList():
```
#### /coins/categories
```dart
client.categories.getList(
    order: CoinCategoriesDataOrdering.marketCapAsc
):
```


## [ global endpoint]
___
#### /global
```dart
client.global.getCryptoInfo():
```
#### /global/decentralized_finance_defi
```dart
client.global.getDefiInfo():
```

## [ exchange rates endpoint]
___
#### /exchange_rates
```dart
client.exchangeRates.getList():
```


## [ companies endpoint]
___
#### /companies/public_treasury/{coin_id}
```dart
client.companies.getList(
    coinId: 'ethereum'
):
```

## [ trending endpoint]
___
#### /search/trending
```dart
client.trending.getResult():
```


## [ search endpoint]
___
#### /search
```dart
client.search.getResult(query: 'bybit'):
```