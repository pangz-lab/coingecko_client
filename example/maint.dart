import 'package:coingecko_client/coingecko_client.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_categories_data_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_data_ordering.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';

void main() {
  
  var client = CoinGeckoClient();

  /// sample call for - /ping
  client.ping.getResult();
  /// sample call for - /simple/price
  client.simple.getCoinPrice(ids: ['bitcoin'], vsCurrencies: [Currencies.php, Currencies.jpy]);
  /// sample call for -   /simple/token_price/{id}
  client.simple.getTokenPrice(id: 'avalanche', contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'], vsCurrencies: ['btc', 'eth']);
  /// sample call for -   /simple/supported_vs_currencies
  client.simple.getSupportedVsCurrencies();
  

  /// sample call for - /coins/list
  client.coins.getBasicList();
  /// sample call for - /coins/{id}/history
  client.coins.getHistory(id: 'bitcoin', date: DateTime.now());
  /// sample call for - /coins/markets
  client.coins.getMarketList(vsCurrency: Currencies.php);
  /// sample call for - /coins/{id}
  client.coins.getInfo(id: 'verus-coin');
  /// sample call for - /coins/{id}/tickers
  client.coins.getTickers(id: 'bitcoin');
  /// sample call for - /coins/{id}/market_chart
  client.coins.getMarketHistory(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.in1Day,
    interval: 'daily'
  );
  /// sample call for - /coins/{id}/market_chart/range
  client.coins.getMarketHistoryWithDateRange(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1392577232),
    to: DateTime.fromMillisecondsSinceEpoch(1396587232)
  );
  /// sample call for - /coins/{id}/ohlc
  client.coins.getOhlcList(
    id: 'bitcoin',
    vsCurrency: Currencies.php,
    days: DataRange.max
  );


  /// sample call for - /exchanges
  client.exchanges.getList();
  /// sample call for - /exchanges/list
  client.exchanges.getBasicList();
  /// sample call for - /exchanges/{id}
  client.exchanges.getInfo(id: 'binance');
  /// sample call for - /exchanges/{id}/tickers
  client.exchanges.getTickerList(
    id: 'binance',
    coinIds: ['bitcoin', 'ethereum'],
    includeExchangeLogo: true,
    page: 1,
    depth: true,
    order: ExchangeDataOrdering.trustScoreDesc
  );
  /// sample call for - /exchanges/{id}/volume_chart
  client.exchanges.getVolumeChartList(
    id: 'binance',
    days: DataRange.in1Day
  );

  /// sample call for - /simple/price
  client.simple.getCoinPrice(
    ids: ['bitcoin', 'ethereum', 'verus-coin'],
    vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
  );
  /// sample call for - /simple/token_price/{id}
  client.simple.getTokenPrice(
    id: 'avalanche',
    contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
    vsCurrencies: ['btc', 'eth'],
    includeMarketCap: true,
    include24hrVol: true,
    include24hrChange: true,
    includeLastUpdatedAt: true,
    precision: 18
  );
  /// sample call for - /simple/supported_vs_currencies
  client.simple.getSupportedVsCurrencies();


  /// sample call for - /derivatives
  client.derivatives.getList(
    includeTickers: DerivativesTickers.unexpired
  );
  /// sample call for - /derivatives/exchanges
  client.derivatives.getExchangeList(
    order: DerivativesExchangeOrdering.nameAsc,
    perPage: 10,
    page: 2
  );
  /// sample call for - /derivatives/exchanges/{id}
  client.derivatives.getExchange(
    id: "bybit",
    includeTickers: DerivativesTickers.unexpired
  );
  /// sample call for - /derivatives/exchanges/list
  client.derivatives.getExchangeBasicInfoList();


  /// sample call for - /indexes
  client.indexes.getList(
    perPage: 10,
    page: 2
  );
  /// sample call for - /indexes/{market_id}/{id}
  client.indexes.getInfo(
    marketId: 'bybit',
    id: 'HOT',
  );
  /// sample call for - /indexes/list
  client.indexes.getBasicInfo();


  /// sample call for - /nfts/list
  client.nfts.getBasicList(
    perPage: 10,
    page: 2
  );
  /// sample call for - /nfts/{id}
  client.nfts.getInfo(
    id: 'meebits',
  );
  /// sample call for - /nfts/{asset_platform_id}/contract/{contract_address}
  client.nfts.getContractInfo(
    assetPlatformId: 'ethereum',
    contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
  );


  /// sample call for - /coins/{id}/contract/{contract_address}/market_chart
  client.contract.getMarketHistory(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.jpy,
    days : DataRange.in2Weeks,
  );
  /// sample call for - /coins/{id}/contract/{contract_address}/market_chart/range
  client.contract.getMarketHistoryWithDateRange(
    id: 'ethereum',
    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    vsCurrency: Currencies.php,
    from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
    to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
  );


  /// sample call for - /coins/categories/list
  client.categories.getBasicList();
  /// sample call for - /coins/categories
  client.categories.getList(
    order: CoinCategoriesDataOrdering.marketCapAsc
  );


  /// sample call for - /global
  client.global.getCryptoInfo();
  /// sample call for - /global/decentralized_finance_defi
  client.global.getDefiInfo();


  /// sample call for - /exchange_rates
  client.exchangeRates.getList();


  /// sample call for - /companies/public_treasury/{coin_id}
  client.companies.getList(
    coinId: 'ethereum'
  );


  /// sample call for - /search/trending
  client.trending.getResult();


  /// sample call for - /search
  client.search.getResult(query: 'bybit');
}