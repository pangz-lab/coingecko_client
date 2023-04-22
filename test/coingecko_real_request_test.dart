import 'package:coingecko_client/src/domain/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platform.dart';
import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/coin.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market_chart.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_ohlc.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_price_change.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_tickers.dart';
import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/domain/exchanges/exchanges_endpoint.dart';
import 'package:coingecko_client/src/domain/exchanges/models/market_exchange_data_ordering.dart';
import 'package:coingecko_client/src/domain/exchanges/models/market_exchange_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/market_exchange_basic_info.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:test/test.dart';

void main() {
  var httpService = HttpRequestService();
  var delay = 600;
  group('Test for real request', () {
    test('from AssetPlatformsEndpoint should return a valid response', () async {
      var sut = AssetPlatformsEndpoint(httpService);
      var result = await sut();
      expect(result.elementAt(0).runtimeType, AssetPlatform);
    });
  });

  group('Test for real request', () {
    test('from CoinsEndpoint for getCoinList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinList();
      expect(result.elementAt(0).runtimeType, Coin);
    });

    test('from CoinsEndpoint for getCoinMarkets should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinMarkets(
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

    test('from CoinsEndpoint for getCoinInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinInfo(
          id: 'bitcoin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );
      expect(result.runtimeType, CoinInfo);
    });
    
    test('from CoinsEndpoint for getCoinTickers should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinTickers(
        id: 'bitcoin'
      );
      expect(result.runtimeType, CoinTickers);
    });

    test('from CoinsEndpoint for getCoinMarketChart should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinMarketChart(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.in1Day,
        interval: 'daily'
      );
      expect(result.runtimeType, CoinMarketChart);
    });

    test('from CoinsEndpoint for getCoinMarketChartWithRange should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinMarketChartWithRange(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        from: DateTime.fromMillisecondsSinceEpoch(1392577232),
        to: DateTime.fromMillisecondsSinceEpoch(1396587232)
      );
      expect(result.runtimeType, CoinMarketChart);
    });

    test('from CoinsEndpoint for getCoinOhlc should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = CoinsEndpoint(httpService);
      var result = await sut.getCoinOhlc(
        id: 'bitcoin',
        vsCurrency: Currencies.php,
        days: DataRange.max
      );
      expect(result.elementAt(0).runtimeType, CoinOhlc);
    });
  });
  
  group('Test for real request', () {
    test('from ExchangesEndpoint for getExchangeList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = ExchangesEndpoint(httpService);
      var result = await sut.getExchangeList();
      expect(result.elementAt(0).runtimeType, MarketExchangeInfo);
    });

    test('from ExchangesEndpoint for getMarketExchangeList should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = ExchangesEndpoint(httpService);
      var result = await sut.getMarketExchangeList();
      expect(result.elementAt(0).runtimeType, MarketExchangeBasicInfo);
    });

    test('from ExchangesEndpoint for getMarketExchangeInfo should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = ExchangesEndpoint(httpService);
      var result = await sut.getMarketExchangeInfo(id: 'binance');
      expect(result.runtimeType, MarketExchangeInfo);
    });
     
    test('from ExchangesEndpoint for getMarketExchangeTickers should return a valid response', () async {
      await Future.delayed(Duration(milliseconds:  delay));
      var sut = ExchangesEndpoint(httpService);
      var result = await sut.getMarketExchangeTickers(
          id: 'binance',
          coinIds: ['bitcoin', 'ethereum'],
          includeExchangeLogo: true,
          page: 1,
          depth: true,
          order: MarketExchangeDataOrdering.trustScoreDesc
        );
      expect(result?.elementAt(0).runtimeType, TickerInfo);
    });
  });
}