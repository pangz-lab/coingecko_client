import 'dart:convert';
import 'package:coingecko_client/coingecko_client.dart';
import 'package:test/test.dart';

void main() {
  var client = CoinGeckoClient();
  var delay = 4200;
  group('Integration test for AssetPlatformsEndpoint', () {
    var sut = client.assetPlatforms;
    test('should return a valid response', () async {
      final result = await sut.getList();
      expect(result.elementAt(0).runtimeType, AssetPlatform);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for CoinsEndpoint for', () {
    var sut = client.coins;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, CoinBasicInfo);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getHistory(id: 'bitcoin', date: DateTime.now());
      expect(result.runtimeType, CoinInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getMarketList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getMarketList(
        vsCurrency: Currencies.php,
        ids: ['bitcoin', 'verus-coin'],
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
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getInfo(
          id: 'verus-coin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true);
      expect(result.runtimeType, CoinInfo);
    });

    test('getTickers: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getTickers(id: 'bitcoin');
      expect(result.runtimeType, CoinTickers);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getMarketHistory: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getMarketHistory(
          id: 'bitcoin',
          vsCurrency: Currencies.php,
          days: DataRange.in1Day,
          interval: 'daily');
      expect(result.runtimeType, CoinMarketHistory);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test(
        'getMarketHistoryWithDateRange: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getMarketHistoryWithDateRange(
          id: 'bitcoin',
          vsCurrency: Currencies.php,
          from: DateTime.fromMillisecondsSinceEpoch(1392577232),
          to: DateTime.fromMillisecondsSinceEpoch(1396587232));
      expect(result.runtimeType, CoinMarketHistory);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getOhlcList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getOhlcList(
          id: 'bitcoin', vsCurrency: Currencies.php, days: DataRange.max);
      expect(result.elementAt(0).runtimeType, CoinOhlc);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getNewList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getNewList();
      expect(result.elementAt(0).runtimeType, CoinBasicInfo);
    });

    test('getTopGainersAndLosers: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getTopGainersAndLosers(
          vsCurrency: Currencies.php,
          duration: CoinDuration.in14Days,
          topCoins: CoinRanking.top300);
      expect(result.runtimeType, CoinRankingResult);
      expect(jsonEncode(result.topGainers?.elementAt(0)).runtimeType,
          CoinRankingInfo);
      expect(jsonEncode(result.topLosers?.elementAt(0)).runtimeType,
          CoinRankingInfo);
    });
  });

  group('Integration test for ExchangesEndpoint for', () {
    var sut = client.exchanges;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getList();
      expect(result.elementAt(0).runtimeType, ExchangeInfo);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, ExchangeBasicInfo);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getInfo(id: 'binance');
      expect(result.runtimeType, ExchangeInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getTickerList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getTickerList(
          id: 'binance',
          coinIds: ['bitcoin', 'ethereum'],
          includeExchangeLogo: true,
          page: 1,
          depth: true,
          order: ExchangeDataOrdering.trustScoreDesc);
      expect(result?.elementAt(0).runtimeType, TickerInfo);
      expect(jsonEncode(result).runtimeType, String);
    });

    test('getVolumeChartList: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result =
          await sut.getVolumeChartList(id: 'binance', days: DataRange.in1Day);
      expect(result.elementAt(0).runtimeType, ExchangeVolumeChart);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for SimpleEndpoint for', () {
    var sut = client.simple;
    test('getCoinPrice: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getCoinPrice(
          ids: ['bitcoin', 'ethereum', 'verus-coin'],
          vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18);
      expect(
          result['verus-coin'].runtimeType.toString(), '_Map<String, dynamic>');
      expect(jsonEncode(result).runtimeType, String);
    });

    test('getTokenPrice: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [CryptoCurrencies.btc, CryptoCurrencies.eth],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18);
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
      expect(jsonEncode(result).runtimeType, String);
    });

    test('getSupportedVsCurrencies: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getSupportedVsCurrencies();
      expect(result.runtimeType, List<String>);
      expect(jsonEncode(result).runtimeType, String);
    });
  });

  group('Integration test for DerivativesEndpoint for', () {
    var sut = client.derivatives;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result =
          await sut.getList(includeTickers: DerivativesTickers.unexpired);
      expect(result.runtimeType, List<Derivatives>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getExchangeList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc, perPage: 10, page: 2);
      expect(result.runtimeType, List<DerivativesExchange>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getExchange: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getExchange(
          id: "bybit", includeTickers: DerivativesTickers.unexpired);
      expect(result.runtimeType, DerivativesExchange);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getSupportedVsCurrencies: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getExchangeBasicInfoList();
      expect(result.runtimeType, List<ExchangeBasicInfo>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for IndexesEndpoint for', () {
    var sut = client.indexes;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getList(perPage: 10, page: 2);
      expect(result.runtimeType, List<MarketIndex>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getInfo(
        marketId: 'bybit',
        id: 'HOT',
      );
      expect(result.runtimeType, MarketIndex);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getBasicInfoList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getBasicInfoList();
      expect(result.runtimeType, List<MarketIndex>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for NftsEndpoint for', () {
    var sut = client.nfts;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getBasicList(perPage: 10, page: 2);
      expect(result.runtimeType, List<NftBasicInfo>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getInfo(
        id: 'meebits',
      );
      expect(result.runtimeType, NftInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getContractInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getContractInfo(
        assetPlatformId: 'ethereum',
        contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
      );
      expect(result.runtimeType, NftInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });
  });

  group('Integration test for ContractEndpoint for', () {
    var sut = client.contract;
    test('getInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984');
      expect(result.runtimeType, ContractInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getMarketHistory: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getMarketHistory(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
        vsCurrency: Currencies.jpy,
        days: DataRange.in2Weeks,
      );
      expect(result.runtimeType, ContractMarketHistory);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test(
        'getMarketHistoryWithDateRange: request should return a valid response',
        () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getMarketHistoryWithDateRange(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
        vsCurrency: Currencies.php,
        from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
        to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
      );
      expect(result.runtimeType, ContractMarketHistory);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });
  });

  group('Integration test for CategoriesEndpoint for', () {
    var sut = client.categories;
    test('getBasicList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getBasicList();
      expect(result.runtimeType, List<CoinCategoryBasicInfo>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });

    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result =
          await sut.getList(order: CoinCategoriesDataOrdering.marketCapAsc);
      expect(result.runtimeType, List<CoinCategoryInfo>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for GlobalEndpoint for', () {
    var sut = client.global;
    test('getCryptoInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getCryptoInfo();
      expect(result.runtimeType, GlobalCryptoInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });

    test('getDefiInfo: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getDefiInfo();
      expect(result.runtimeType, GlobalDefiInfo);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });
  });

  group('Integration test for ExchangeRatesEndpoint for', () {
    var sut = client.exchangeRates;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getList();
      expect(result.runtimeType, List<ExchangeRate>);
      expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
    });
  });

  group('Integration test for CompaniesEndpoint for', () {
    var sut = client.companies;
    test('getList: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getList(coinId: 'ethereum');
      expect(result.runtimeType, CompanyList);
      expect(jsonEncode(result.toJson()).runtimeType, String);
    });
  });

  group('Integration test for TrendingEndpoint for', () {
    var sut = client.trending;
    test('getResult: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getResult();
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
      expect(jsonEncode(result).runtimeType, String);
    });
  });

  group('Integration test for SearchEndpoint for', () {
    var sut = client.search;
    test('getResult: request should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      final result = await sut.getResult(query: 'bybit');
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
      expect(jsonEncode(result).runtimeType, String);
    });
  });
}
