import 'package:coingecko_client/src/coingecko_client_base.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platform.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_categories_data_ordering.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_category_basic_info.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_category_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_basic_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market_history.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_ohlc.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_price_change.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_tickers.dart';
import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/domain/companies/models/company_list.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_info.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_market_history.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives.dart';
import 'package:coingecko_client/src/domain/exchange_rates/models/exchange_rate.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_data_ordering.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_basic_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_volume_chart.dart';
import 'package:coingecko_client/src/domain/global/models/global_crypto_info.dart';
import 'package:coingecko_client/src/domain/global/models/global_defi_info.dart';
import 'package:coingecko_client/src/domain/indexes/models/market_index.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_basic_info.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_info.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:test/test.dart';

void main() {
  var client = CoinGeckoClient();
  var delay = 4200;
  group('Integration test for AssetPlatformsEndpoint', () {
    var sut = client.assetPlatforms;
    test('should return a valid response', () async {
      var result = await sut.getList();
      expect(result.elementAt(0).runtimeType, AssetPlatform);
    });
  });

  group('Integration test for CoinsEndpoint for', () {
    var sut = client.coins;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, CoinBasicInfo);
    });

    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getHistory(id: 'bitcoin', date: DateTime.now());
      expect(result.runtimeType, CoinInfo);
    });

    test('getMarketList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketList(
        vsCurrency: Currencies.php,
        ids: ['bitcoin','verus-coin'],
        category: 'aave-tokens',
        order: CoinMarketDataOrdering.marketCapDesc,
        perPage: 20,
        page: 1,
        sparkline: true,
        priceChangePercentage: [ 
          CoinPriceChange.in1Hour,
          CoinPriceChange.in24Hours,
          CoinPriceChange.in7Days,
          CoinPriceChange.in14Days,
          CoinPriceChange.in30Days,
          CoinPriceChange.in200Days,
          CoinPriceChange.in1Year,
        ],
      );
      expect(result.elementAt(0).runtimeType, CoinMarket);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
          id: 'verus-coin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );
      expect(result.runtimeType, CoinInfo);
    });
    
    test('getTickers: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getTickers(
        id: 'bitcoin'
      );
      expect(result.runtimeType, CoinTickers);
    });

    test('getMarketHistory: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistory(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.in1Day,
        interval: 'daily'
      );
      expect(result.runtimeType, CoinMarketHistory);
    });

    test('getMarketHistoryWithDateRange: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistoryWithDateRange(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        from: DateTime.fromMillisecondsSinceEpoch(1392577232),
        to: DateTime.fromMillisecondsSinceEpoch(1396587232)
      );
      expect(result.runtimeType, CoinMarketHistory);
    });

    test('getOhlcList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getOhlcList(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.max
      );
      expect(result.elementAt(0).runtimeType, CoinOhlc);
    });
  });
  
  group('Integration test for ExchangesEndpoint for', () {
    var sut = client.exchanges;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList();
      expect(result.elementAt(0).runtimeType, ExchangeInfo);
    });

    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, ExchangeBasicInfo);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(id: 'binance');
      expect(result.runtimeType, ExchangeInfo);
    });
     
    test('getTickerList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getTickerList(
          id: 'binance',
          coinIds: ['bitcoin', 'ethereum'],
          includeExchangeLogo: true,
          page: 1,
          depth: true,
          order: ExchangeDataOrdering.trustScoreDesc
        );
      expect(result?.elementAt(0).runtimeType, TickerInfo);
    });

    test('getVolumeChartList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getVolumeChartList(
        id: 'binance',
        days: DataRange.in1Day
      );
      expect(result.elementAt(0).runtimeType, ExchangeVolumeChart);
    });
  });

  group('Integration test for SimpleEndpoint for', () {
    var sut = client.simple;
    test('getCoinPrice: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getCoinPrice(
          ids: ['bitcoin', 'ethereum', 'verus-coin'],
          vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );
      expect(result['verus-coin'].runtimeType.toString(), '_Map<String, dynamic>');
    });

    test('getTokenPrice: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc, CryptoCurrencies.eth ],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
    });

    test('getSupportedVsCurrencies: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getSupportedVsCurrencies();
      expect(result.runtimeType, List<String>);
    });
  });

  group('Integration test for DerivativesEndpoint for', () {
    var sut = client.derivatives;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList(
        includeTickers: DerivativesTickers.unexpired
      );
      expect(result.runtimeType, List<Derivatives>);
    });

    test('getExchangeList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchangeList(
        order: DerivativesExchangeOrdering.nameAsc,
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<DerivativesExchange>);
    });

    test('getExchange: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchange(
        id: "bybit",
        includeTickers: DerivativesTickers.unexpired
      );
      expect(result.runtimeType, DerivativesExchange);
    });
    
    test('getSupportedVsCurrencies: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchangeBasicInfoList();
      expect(result.runtimeType, List<ExchangeBasicInfo>);
    });
  });

  group('Integration test for IndexesEndpoint for', () {
    var sut = client.indexes;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList(
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<MarketIndex>);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
        marketId: 'bybit',
        id: 'HOT',
      );
      expect(result.runtimeType, MarketIndex);
    });
    
    test('getBasicInfoList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicInfoList();
      expect(result.runtimeType, List<MarketIndex>);
    });
  });

  group('Integration test for NftsEndpoint for', () {
    var sut = client.nfts;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList(
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<NftBasicInfo>);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
        id: 'meebits',
      );
      expect(result.runtimeType, NftInfo);
    });
    
    test('getContractInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getContractInfo(
        assetPlatformId: 'ethereum',
        contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
      );
      expect(result.runtimeType, NftInfo);
    });
  });

  group('Integration test for ContractEndpoint for', () {
    var sut = client.contract;
    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
      );
      expect(result.runtimeType, ContractInfo);
    });

    test('getMarketHistory: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistory(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
        vsCurrency: Currencies.jpy,
        days : DataRange.in2Weeks,
      );
      expect(result.runtimeType, ContractMarketHistory);
    });
    
    test('getMarketHistoryWithDateRange: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistoryWithDateRange(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
        vsCurrency: Currencies.php,
        from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
        to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
      );
      expect(result.runtimeType, ContractMarketHistory);
    });
  });

  group('Integration test for CategoriesEndpoint for', () {
    var sut = client.categories;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList();
      expect(result.runtimeType, List<CoinCategoryBasicInfo>);
    });

    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList(
        order: CoinCategoriesDataOrdering.marketCapAsc
      );
      expect(result.runtimeType, List<CoinCategoryInfo>);
    });
  });

  group('Integration test for GlobalEndpoint for', () {
    var sut = client.global;
    test('getCryptoInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getCryptoInfo();
      expect(result.runtimeType, GlobalCryptoInfo);
    });

    test('getDefiInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getDefiInfo();
      expect(result.runtimeType, GlobalDefiInfo);
    });
  });

  group('Integration test for ExchangeRatesEndpoint for', () {
    var sut = client.exchangeRates;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList();
      expect(result.runtimeType, List<ExchangeRate>);
    });
  });

  group('Integration test for CompaniesEndpoint for', () {
    var sut = client.companies;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList(
        coinId: 'ethereum'
      );
      expect(result.runtimeType, CompanyList);
    });
  });
  
  group('Integration test for TrendingEndpoint for', () {
    var sut = client.trending;
    test('getResult: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getResult();
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
    });
  });

  group('Integration test for SearchEndpoint for', () {
    var sut = client.search;
    test('getResult: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getResult(query: 'bybit');
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
    });
  });
}