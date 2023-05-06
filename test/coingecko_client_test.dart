import 'package:coingecko_client/coingecko_client.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_categories_data_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_data_ordering.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CoinGeckoClient test', () {
    var client = CoinGeckoClient();

    //## /ping
    client.ping.getResult();

    //## /simple/price
    client.simple.getCoinPrice(ids: ['bitcoin'], vsCurrencies: [Currencies.php, Currencies.jpy]);
    //##  /simple/token_price/{id}
    client.simple.getTokenPrice(id: 'avalanche', contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'], vsCurrencies: ['btc', 'eth']);
    //##  /simple/supported_vs_currencies
    client.simple.getSupportedVsCurrencies();
    

    //## /coins/list
    client.coins.getBasicList();
    //## /coins/{id}/history
    client.coins.getHistory(id: 'bitcoin', date: DateTime.now());
    //## /coins/markets
    client.coins.getMarketList(vsCurrency: Currencies.php);
    //## /coins/{id}
    client.coins.getInfo(id: 'verus-coin');
    //## /coins/{id}/tickers
    client.coins.getTickers(id: 'bitcoin');
    //## /coins/{id}/market_chart
    client.coins.getMarketHistory(
      id: 'bitcoin',
      vsCurrency: Currencies.php,
      days: DataRange.in1Day,
      interval: 'daily'
    );
    //## /coins/{id}/market_chart/range
    client.coins.getMarketHistoryWithDateRange(
      id: 'bitcoin',
      vsCurrency: Currencies.php,
      from: DateTime.fromMillisecondsSinceEpoch(1392577232),
      to: DateTime.fromMillisecondsSinceEpoch(1396587232)
    );
    //## /coins/{id}/ohlc
    client.coins.getOhlcList(
      id: 'bitcoin',
      vsCurrency: Currencies.php,
      days: DataRange.max
    );


    //## /exchanges
    client.exchanges.getList();
    //## /exchanges/list
    client.exchanges.getBasicList();
    //## /exchanges/{id}
    client.exchanges.getInfo(id: 'binance');
    //## /exchanges/{id}/tickers
    client.exchanges.getTickerList(
      id: 'binance',
      coinIds: ['bitcoin', 'ethereum'],
      includeExchangeLogo: true,
      page: 1,
      depth: true,
      order: ExchangeDataOrdering.trustScoreDesc
    );
    //## /exchanges/{id}/volume_chart
    client.exchanges.getVolumeChartList(
      id: 'binance',
      days: DataRange.in1Day
    );

    //## /simple/price
    client.simple.getCoinPrice(
      ids: ['bitcoin', 'ethereum', 'verus-coin'],
      vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
      includeMarketCap: true,
      include24hrVol: true,
      include24hrChange: true,
      includeLastUpdatedAt: true,
      precision: 18
    );
    //## /simple/token_price/{id}
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
    //## /simple/supported_vs_currencies
    client.simple.getSupportedVsCurrencies();


    //## /derivatives
    client.derivatives.getList(
      includeTickers: DerivativesTickers.unexpired
    );
    //## /derivatives/exchanges
    client.derivatives.getExchangeList(
      order: DerivativesExchangeOrdering.nameAsc,
      perPage: 10,
      page: 2
    );
    //## /derivatives/exchanges/{id}
    client.derivatives.getExchange(
      id: "bybit",
      includeTickers: DerivativesTickers.unexpired
    );
    //## /derivatives/exchanges/list
    client.derivatives.getExchangeBasicInfoList();


    //## /indexes
    client.indexes.getList(
      perPage: 10,
      page: 2
    );
    //## /indexes/{market_id}/{id}
    client.indexes.getInfo(
      marketId: 'bybit',
      id: 'HOT',
    );
    //## /indexes/list
    client.indexes.getBasicInfo();


    //## /nfts/list
    client.nfts.getBasicList(
      perPage: 10,
      page: 2
    );
    //## /nfts/{id}
    client.nfts.getInfo(
      id: 'meebits',
    );
    //## /nfts/{asset_platform_id}/contract/{contract_address}
    client.nfts.getContractInfo(
      assetPlatformId: 'ethereum',
      contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
    );


    //## /coins/{id}/contract/{contract_address}/market_chart
    client.contract.getMarketHistory(
      id: 'ethereum',
      contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
      vsCurrency: Currencies.jpy,
      days : DataRange.in2Weeks,
    );
    //## /coins/{id}/contract/{contract_address}/market_chart/range
    client.contract.getMarketHistoryWithDateRange(
      id: 'ethereum',
      contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
      vsCurrency: Currencies.php,
      from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
      to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
    );


    //## /coins/categories/list
    client.categories.getBasicList();
    //## /coins/categories
    client.categories.getList(
      order: CoinCategoriesDataOrdering.marketCapAsc
    );


    //## /global
    client.global.getCryptoInfo();
    //## /global/decentralized_finance_defi
    client.global.getDefiInfo();


    //## /exchange_rates
    client.exchangeRates.getList();


    //## /companies/public_treasury/{coin_id}
    client.companies.getList(
      coinId: 'ethereum'
    );


    //## /search/trending
    client.trending.getResult();


    //## /search
    client.search.getResult(query: 'bybit');
  });
}
