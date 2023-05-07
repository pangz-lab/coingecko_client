import 'package:coingecko_client/src/domain/derivatives/derivatives_endpoint.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/derivatives_mock_data.dart';

void main() {
  DerivativesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getList method in', () {
    var basePath = "/derivatives";
    group('DerivativesEndpoint test endpoint path creation', () {
      var sut = DerivativesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: DerivativesMockData.validResponseBody
        )
      );

      test('without parameters', () async {
        await sut.getList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut.getList(
          includeTickers: DerivativesTickers.unexpired
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?include_tickers=unexpired"
        );
      });
    });

    group('DerivativesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesMockData.validResponseBody
          )
        );
        var result = await sut!.getList(
          includeTickers: DerivativesTickers.unexpired
        );

        var firstItem = result.elementAt(0);
        var secondItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.market, "Deepcoin (Derivatives)");
        expect(firstItem.symbol, "ETHUSDT");
        expect(firstItem.indexId, "ETH");
        expect(firstItem.price, 1904.49);
        expect(firstItem.pricePercentageChange24h, 2.3557366649822056);
        expect(firstItem.contractType, "perpetual");
        expect(firstItem.index, 1904.1);
        expect(firstItem.basis, 0.007353095653270027);
        expect(firstItem.spread, 0.01);
        expect(firstItem.fundingRate, -0.022454);
        expect(firstItem.openInterest, 7498085818.64);
        expect(firstItem.volume24h, 5125742894.90316);
        expect(firstItem.lastTradedAt!.toUtc(), DateTime.parse("2023-05-04 04:44:06.000Z"));
        expect(firstItem.lastTradedAt!.year, 2023);
        expect(firstItem.lastTradedAt!.month, 5);
        expect(firstItem.lastTradedAt!.day, 4);
        expect(firstItem.expiredAt, null);

        expect(secondItem.market, "Binance (Futures)");
        expect(secondItem.symbol, "BTCUSDT");
        expect(secondItem.indexId, "BTC");
        expect(secondItem.price, 29097.52);
        expect(secondItem.pricePercentageChange24h, 2.26582385284977);
        expect(secondItem.contractType, "perpetual");
        expect(secondItem.index, 29094.8);
        expect(secondItem.basis, 0.020282650770568844);
        expect(secondItem.spread, 0.01);
        expect(secondItem.fundingRate, 0.01);
        expect(secondItem.openInterest, 2879409940.61);
        expect(secondItem.volume24h, 19448237664.16787);
        expect(secondItem.lastTradedAt!.toUtc(), DateTime.parse("2023-05-04 04:41:59.000Z"));
        expect(secondItem.expiredAt, null);
      });

      test('should still return a result for incomplete data format', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getList(
          includeTickers: DerivativesTickers.unexpired
        );

        var firstItem = result.elementAt(0);
        var secondItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.market, null);
        expect(firstItem.symbol, null);
        expect(firstItem.indexId, null);
        expect(firstItem.price, null);
        expect(firstItem.pricePercentageChange24h, null);
        expect(firstItem.contractType, null);
        expect(firstItem.index, null);
        expect(firstItem.basis, 0.007353095653270027);
        expect(firstItem.spread, 0.01);
        expect(firstItem.fundingRate, -0.022454);
        expect(firstItem.openInterest, 7498085818.64);
        expect(firstItem.volume24h, null);
        expect(firstItem.lastTradedAt!.toUtc(), DateTime.parse("2023-05-04 04:44:06.000Z"));
        expect(firstItem.lastTradedAt!.year, 2023);
        expect(firstItem.lastTradedAt!.month, 5);
        expect(firstItem.lastTradedAt!.day, 4);
        expect(firstItem.expiredAt, null);

        expect(secondItem.market, "Binance (Futures)");
        expect(secondItem.symbol, "BTCUSDT");
        expect(secondItem.indexId, "BTC");
        expect(secondItem.price, 29097.52);
        expect(secondItem.pricePercentageChange24h, 2.26582385284977);
        expect(secondItem.contractType, null);
        expect(secondItem.index, 29094.8);
        expect(secondItem.basis, null);
        expect(secondItem.spread, null);
        expect(secondItem.fundingRate, null);
        expect(secondItem.openInterest, null);
        expect(secondItem.volume24h, null);
        expect(secondItem.lastTradedAt, null);
        expect(secondItem.expiredAt, null);
      });
    });

    group('DerivativesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: DerivativesMockData.validResponseBody
          )
        );
        await expectLater(sut!.getList(
          includeTickers: DerivativesTickers.unexpired
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getList(
          includeTickers: DerivativesTickers.unexpired
        ),throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getList(
          includeTickers: DerivativesTickers.unexpired
        ), throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getList(
            includeTickers: DerivativesTickers.unexpired
          ),
          throwsA(isA<DataParsingException>())
        );
      });
    });
  });

  group('getExchangeList method in', () {
    var basePath = "/derivatives/exchanges";
    group('DerivativesEndpoint test endpoint path creation', () {
      var sut = DerivativesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: DerivativesExchangeListMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getExchangeList();
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath"
        );
      });

      test('with all parameters', () async {
        await sut.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath?order=name_asc&per_page=10&page=2");
      });
    });

    group('DerivativesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeListMockData.validResponseBody
          )
        );
        var result = await sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        );

        var firstItem = result.elementAt(0);
        var secondtItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.name, "Gate.io (Futures)");
        expect(firstItem.id, "gate_futures");
        expect(firstItem.openInterestBtc, 63186.12);
        expect(firstItem.tradeVolume24hBtc, 60365.87);
        expect(firstItem.numberOfPerpetualPairs, 355);
        expect(firstItem.numberOfFuturesPairs, 0);
        expect(firstItem.image, "https://assets.coingecko.com/markets/images/403/small/gate_io_logo.jpg?1654182143");
        expect(firstItem.yearEstablished, null);
        expect(firstItem.country, "Hong Kong");
        expect(firstItem.description, "Gate was established in 2013, and it is the top 10 exchanges in the world in terms of authentic trading volume. It is also the first choice of over 8 million registered customers, covering 130+ countries worldwide, as we are providing the most comprehensive digital asset solutions.");
        expect(firstItem.url, "https://www.gate.io/futures_trade/BTC_USD");

        expect(secondtItem.name,"BingX (Futures)");
        expect(secondtItem.id,"bingx_futures");
        expect(secondtItem.openInterestBtc, 55689.35);
        expect(secondtItem.tradeVolume24hBtc, 231637.53);
        expect(secondtItem.numberOfPerpetualPairs, 203);
        expect(secondtItem.numberOfFuturesPairs,0);
        expect(secondtItem.image,"https://assets.coingecko.com/markets/images/917/small/ezgif.com-gif-maker.jpg?1658483171");
        expect(secondtItem.yearEstablished,null);
        expect(secondtItem.country,null);
        expect(secondtItem.description,"Founded in 2018, BingX is a crypto social trading exchange that offers spot, derivatives and copy trading services to more than 100 countries worldwide.\r\n\r\nBingX prides itself as the people's exchange by unlocking the fast-growing cryptocurrency market for everyone, connecting users with experts traders and a platform to invest in a simple, engaging and transparent way.");
        expect(secondtItem.url,"https://bingx.com/");
      });

      test('should still return a result for incomplete data format', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeListMockData.responseBodyWithIncompleteKeys
          )
        );
         var result = await sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        );

        var firstItem = result.elementAt(0);
        var secondtItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.name, null);
        expect(firstItem.id, null);
        expect(firstItem.openInterestBtc, null);
        expect(firstItem.tradeVolume24hBtc, null);
        expect(firstItem.numberOfPerpetualPairs, null);
        expect(firstItem.numberOfFuturesPairs, 0);
        expect(firstItem.image, "https://assets.coingecko.com/markets/images/403/small/gate_io_logo.jpg?1654182143");
        expect(firstItem.yearEstablished, null);
        expect(firstItem.country, "Hong Kong");
        expect(firstItem.description, "Gate was established in 2013, and it is the top 10 exchanges in the world in terms of authentic trading volume. It is also the first choice of over 8 million registered customers, covering 130+ countries worldwide, as we are providing the most comprehensive digital asset solutions.");
        expect(firstItem.url, "https://www.gate.io/futures_trade/BTC_USD");

        expect(secondtItem.name, "BingX (Futures)");
        expect(secondtItem.id ,"bingx_futures");
        expect(secondtItem.openInterestBtc, 55689.35);
        expect(secondtItem.tradeVolume24hBtc, 231637.53);
        expect(secondtItem.numberOfPerpetualPairs, 203);
        expect(secondtItem.numberOfFuturesPairs, null);
        expect(secondtItem.image, null);
        expect(secondtItem.yearEstablished, null);
        expect(secondtItem.country, null);
        expect(secondtItem.description, null);
        expect(secondtItem.url, null);
      });
    });

    group('DerivativesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: DerivativesExchangeListMockData.validResponseBody
          )
        );
        await expectLater(sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        ),throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeListMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        ), throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getExchangeList(
          order: DerivativesExchangeOrdering.nameAsc,
          perPage: 10,
          page: 2
        ), throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getExchange method in', () {
    var basePath = "/derivatives/exchanges/bybit";
    group('DerivativesEndpoint test endpoint path creation', () {
      var sut = DerivativesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: DerivativesExchangeMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getExchange(
          id: "bybit"
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath"
        );
      });

      test('with all parameters', () async {
        await sut.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath?include_tickers=unexpired");
      });
    });

    group('DerivativesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeMockData.validResponseBody
          )
        );
        var result = await sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        );

        expect(result.name, "Bybit (Futures)");
        expect(result.openInterestBtc, 152905.09);
        expect(result.tradeVolume24hBtc, 381427.73);
        expect(result.numberOfPerpetualPairs, 244);
        expect(result.numberOfFuturesPairs, 32);
        expect(result.image, "https://assets.coingecko.com/markets/images/460/small/photo_2021-08-12_18-27-50.jpg?1628764200");
        expect(result.yearEstablished, 2018);
        expect(result.country, null);
        expect(result.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
        expect(result.url, "https://www.bybit.com");

        expect(result.tickers!.length, 1);
        var tickerFirstItem = result.tickers!.elementAt(0);
        
        expect(tickerFirstItem.symbol, "10000NFTUSDT");
        expect(tickerFirstItem.base, "10000NFT");
        expect(tickerFirstItem.target, "USDT");
        expect(tickerFirstItem.tradeUrl, "https://www.bybit.com/app/exchange/10000NFTUSDT");
        expect(tickerFirstItem.contractType, "perpetual");
        expect(tickerFirstItem.last, 0.004);
        expect(tickerFirstItem.h24PercentageChange, -0.268);
        expect(tickerFirstItem.index, 0.003724);
        expect(tickerFirstItem.indexBasisPercentage, 0.242);
        expect(tickerFirstItem.bidAskSpread, 0.00134408602150544);
        expect(tickerFirstItem.fundingRate, -0.089);
        expect(tickerFirstItem.openInterestUsd, 319412.735);
        expect(tickerFirstItem.h24Volume, 18621420);
        expect(tickerFirstItem.convertedVolume!.length, 3);
        expect(tickerFirstItem.convertedVolume!['btc'], "2.381598411684822141052551");
        expect(tickerFirstItem.convertedVolume!['usd'], "69236.9969033612388211814");
        expect(tickerFirstItem.convertedLast!.length, 3);
        expect(tickerFirstItem.convertedLast!['btc'], "0.00000012788450119020366854678263");
        expect(tickerFirstItem.convertedLast!['usd'], "0.003717813536258691189050514548519798361857");
        expect(tickerFirstItem.lastTraded!.toUtc(), DateTime.parse("2023-05-04 03:46:08.000Z"));
        expect(tickerFirstItem.expiredAt, null);
      });

      test('should still return a result for incomplete data format', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeMockData.responseBodyWithIncompleteKeys
          )
        );
         var result = await sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        );

        expect(result.name, null);
        expect(result.openInterestBtc, null);
        expect(result.tradeVolume24hBtc, null);
        expect(result.numberOfPerpetualPairs, null);
        expect(result.numberOfFuturesPairs, 32);
        expect(result.image, "https://assets.coingecko.com/markets/images/460/small/photo_2021-08-12_18-27-50.jpg?1628764200");
        expect(result.yearEstablished, 2018);
        expect(result.country, null);
        expect(result.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
        expect(result.url, "https://www.bybit.com");

        expect(result.tickers!.length, 1);
        var tickerFirstItem = result.tickers!.elementAt(0);
        
        expect(tickerFirstItem.symbol, "10000NFTUSDT");
        expect(tickerFirstItem.base, "10000NFT");
        expect(tickerFirstItem.target, "USDT");
        expect(tickerFirstItem.tradeUrl, "https://www.bybit.com/app/exchange/10000NFTUSDT");
        expect(tickerFirstItem.contractType, "perpetual");
        expect(tickerFirstItem.last, 0.004);
        expect(tickerFirstItem.h24PercentageChange, -0.268);
        expect(tickerFirstItem.index, 0.003724);
        expect(tickerFirstItem.indexBasisPercentage, null);
        expect(tickerFirstItem.bidAskSpread, null);
        expect(tickerFirstItem.fundingRate, null);
        expect(tickerFirstItem.openInterestUsd, null);
        expect(tickerFirstItem.h24Volume, null);
        expect(tickerFirstItem.convertedVolume, null);
        expect(tickerFirstItem.convertedLast!.length, 2);
        expect(tickerFirstItem.convertedLast!['btc'], "0.00000012788450119020366854678263");
        expect(tickerFirstItem.convertedLast!['usd'], "0.003717813536258691189050514548519798361857");
        expect(tickerFirstItem.lastTraded!.toUtc(), DateTime.parse("2023-05-04 03:46:08.000Z"));
        expect(tickerFirstItem.expiredAt, null);
      });
    });

    group('DerivativesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: DerivativesExchangeMockData.validResponseBody
          )
        );
        await expectLater(sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        ),throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        ), throwsA(isA<DataParsingException>()));

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getExchange(
          id: "bybit",
          includeTickers: DerivativesTickers.unexpired
        ), throwsA(isA<DataParsingException>()));
      });
    });

  });

  group('getExchangeBasicInfoList method in', () {
    var basePath = "/derivatives/exchanges/list";
    group('DerivativesEndpoint test endpoint path creation', () {
      var sut = DerivativesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: DerivativesExchangeBasicInfoListMockData.validResponseBody
        )
      );

      test('without parameters', () async {
        await sut.getExchangeBasicInfoList();
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath"
        );
      });
    });

    group('DerivativesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeBasicInfoListMockData.validResponseBody
          )
        );

        var result = await sut!.getExchangeBasicInfoList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(3);
        expect(result.length, 4);
        expect(firstItem.id, "binance_futures");
        expect(firstItem.name, "Binance (Futures)");
        expect(lastItem.id, "ftx");
        expect(lastItem.name, "FTX (Derivatives)");
      });

      test('should still return a result for incomplete data format', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeBasicInfoListMockData.responseBodyWithIncompleteKeys
          )
        );

        var result = await sut!.getExchangeBasicInfoList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, null);
        expect(firstItem.name, "Binance (Futures)");
        expect(lastItem.id, "ftx");
        expect(lastItem.name, null);
      });
    });

    group('DerivativesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: DerivativesExchangeBasicInfoListMockData.validResponseBody
          )
        );
        await expectLater(sut!.getExchangeBasicInfoList(),
          throwsA(isA<NetworkRequestException>())
        );
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(
          sut!.getExchangeBasicInfoList(),
          throwsA(isA<DataParsingException>())
        );

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: DerivativesExchangeBasicInfoListMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(
          sut!.getExchangeBasicInfoList(),
          throwsA(isA<DataParsingException>())
        );

        sut = DerivativesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getExchangeBasicInfoList(),
          throwsA(isA<DataParsingException>())
        );
      });
    });

  });

}
