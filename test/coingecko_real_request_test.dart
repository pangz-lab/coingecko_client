import 'package:coingecko_client/src/domain/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platform.dart';
import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_basic_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market_history.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_ohlc.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_price_change.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_tickers.dart';
import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/domain/contract/contract_endpoint.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_info.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_market_history.dart';
import 'package:coingecko_client/src/domain/derivatives/derivatives_endpoint.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives.dart';
import 'package:coingecko_client/src/domain/exchanges/exchanges_endpoint.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_data_ordering.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_basic_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_volume_chart.dart';
import 'package:coingecko_client/src/domain/indexes/indexes_endpoint.dart';
import 'package:coingecko_client/src/domain/indexes/models/market_index.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_basic_info.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_info.dart';
import 'package:coingecko_client/src/domain/nfts/nfts_endpoint.dart';
import 'package:coingecko_client/src/domain/simple/simple_endpoint.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:test/test.dart';

void main() {
  var httpService = HttpRequestService();
  var delay = 5000;
  group('Test for real request from AssetPlatformsEndpoint', () {
    var sut = AssetPlatformsEndpoint(httpService);
    test('should return a valid response', () async {
      var result = await sut();
      expect(result.elementAt(0).runtimeType, AssetPlatform);
    });
  });

  group('Test for real request from CoinsEndpoint for', () {
    var sut = CoinsEndpoint(httpService);
    test('getBasicList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, CoinBasicInfo);
    });

    test('getMarketList should return a valid response', () async {
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

    test('getInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
          id: 'bitcoin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );
      expect(result.runtimeType, CoinInfo);
    });
    
    test('getTickers should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getTickers(
        id: 'bitcoin'
      );
      expect(result.runtimeType, CoinTickers);
    });

    test('getMarketHistory should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistory(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.in1Day,
        interval: 'daily'
      );
      expect(result.runtimeType, CoinMarketHistory);
    });

    test('getMarketHistoryWithDateRange should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistoryWithDateRange(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        from: DateTime.fromMillisecondsSinceEpoch(1392577232),
        to: DateTime.fromMillisecondsSinceEpoch(1396587232)
      );
      expect(result.runtimeType, CoinMarketHistory);
    });

    test('getOhlcList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getOhlcList(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.max
      );
      expect(result.elementAt(0).runtimeType, CoinOhlc);
    });
  });
  
  group('Test for real request from ExchangesEndpoint for', () {
    var sut = ExchangesEndpoint(httpService);
    test('getList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList();
      expect(result.elementAt(0).runtimeType, ExchangeInfo);
    });

    test('getBasicList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList();
      expect(result.elementAt(0).runtimeType, ExchangeBasicInfo);
    });

    test('getInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(id: 'binance');
      expect(result.runtimeType, ExchangeInfo);
    });
     
    test('getTickerList should return a valid response', () async {
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

    test('getVolumeChartList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getVolumeChartList(
        id: 'binance',
        days: DataRange.in1Day
      );
      expect(result.elementAt(0).runtimeType, ExchangeVolumeChart);
    });
  });

  group('Test for real request from SimpleEndpoint for', () {
    var sut = SimpleEndpoint(httpService);
    test('getCoinPrice should return a valid response', () async {
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

    test('getTokenPrice should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: ['btc', 'eth'],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );
      expect(result.runtimeType.toString(), '_Map<String, dynamic>');
    });

    test('getSupportedVsCurrencies should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getSupportedVsCurrencies();
      expect(result.runtimeType, List<String>);
    });
  });

  group('Test for real request from DerivativesEndpoint for', () {
    var sut = DerivativesEndpoint(httpService);
    test('getList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getList(
        includeTickers: DerivativesTickers.unexpired
      );
      expect(result.runtimeType, List<Derivatives>);
    });

    test('getExchangeList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchangeList(
        order: DerivativesExchangeOrdering.nameAsc,
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<DerivativesExchange>);
    });

    test('getExchange should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchange(
        id: "bybit",
        includeTickers: DerivativesTickers.unexpired
      );
      expect(result.runtimeType, DerivativesExchange);
    });
    
    test('getSupportedVsCurrencies should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getExchangeBasicInfoList();
      expect(result.runtimeType, List<ExchangeBasicInfo>);
    });
  });

  group('Test for real request from IndexesEndpoint for', () {
    var sut = IndexesEndpoint(httpService);
    test('getMarketIndexList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketIndexList(
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<MarketIndex>);
    });

    test('getMarketIndex should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketIndex(
        marketId: 'bybit',
        id: 'HOT',
      );
      expect(result.runtimeType, MarketIndex);
    });
    
    test('getMarketIndexBasicInfoList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketIndexBasicInfoList();
      expect(result.runtimeType, List<MarketIndex>);
    });
  });

  group('Test for real request from NftsEndpoint for', () {
    var sut = NftsEndpoint(httpService);
    test('getBasicList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getBasicList(
        perPage: 10,
        page: 2
      );
      expect(result.runtimeType, List<NftBasicInfo>);
    });

    test('getInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
        id: 'meebits',
      );
      expect(result.runtimeType, NftInfo);
    });
    
    test('getContractInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getContractInfo(
        assetPlatformId: 'ethereum',
        contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
      );
      expect(result.runtimeType, NftInfo);
    });
  });

  group('Test for real request from ContractEndpoint for', () {
    var sut = ContractEndpoint(httpService);
    test('getInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getInfo(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
      );
      expect(result.runtimeType, ContractInfo);
    });

    test('getMarketHistory should return a valid response', () async {
      await Future.delayed(Duration(milliseconds: delay));
      var result = await sut.getMarketHistory(
        id: 'ethereum',
        contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
        vsCurrency: Currencies.jpy,
        days : DataRange.in2Weeks,
      );
      expect(result.runtimeType, ContractMarketHistory);
    });
    
    test('getMarketHistoryWithDateRange should return a valid response', () async {
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
}