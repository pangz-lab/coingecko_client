import 'package:coingecko_client/src/domain/exchanges/exchanges_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/exchanges_mock_data.dart';

void main() {
  ExchangesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getExchangeList method in', () {
    var basePath = "/exchanges";
    group('ExchangesEndpoint test endpoint path creation', () {
      sut = ExchangesEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: ExchangesMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut?.getExchangeList();
        expect(sut?.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut?.getExchangeList(perPage: 1, page: 3);
        expect(
          sut?.endpointPath,
          "$apiVersionPath$basePath?per_page=1&page=3"
        );
      });
    });

    group('ExchangesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ExchangesMockData.validResponseBody
          )
        );
        var result = await sut!.getExchangeList(
          page: 1,
          perPage: 3
        );
        var firstItem = result.elementAt(0);
        expect(result.length, 3);
        expect(firstItem.id, "bybit_spot");
        expect(firstItem.name, "Bybit");
        expect(firstItem.yearEstablished, 2018);
        expect(firstItem.country, "British Virgin Islands");
        expect(firstItem.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
        expect(firstItem.url, "https://www.bybit.com");
        expect(firstItem.image, "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794");
        expect(firstItem.hasTradingIncentive, false);
        expect(firstItem.trustScore, 10);
        expect(firstItem.trustScoreRank, 4);
        expect(firstItem.tradeVolume24hBtc, 32427.38111948771);
        expect(firstItem.tradeVolume24hBtcNormalized, 32427.38111948771);
      });

      test('should still return a result for incomplete data format', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ExchangesMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getExchangeList(page: 1, perPage: 3);
        var firstItem = result.elementAt(0);
        expect(result.length, 1);
        expect(firstItem.id, "bybit_spot");
        expect(firstItem.name, "Bybit");
        expect(firstItem.yearEstablished, null);
        expect(firstItem.country, "British Virgin Islands");
        expect(firstItem.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
        expect(firstItem.url, "https://www.bybit.com");
        expect(firstItem.image, "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794");
        expect(firstItem.hasTradingIncentive, null);
        expect(firstItem.trustScore, 10);
        expect(firstItem.trustScoreRank, null);
        expect(firstItem.tradeVolume24hBtc, 32427.38111948771);
        expect(firstItem.tradeVolume24hBtcNormalized, null);
      });
    });

    group('ExchangesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: ExchangesMockData.validResponseBody
          )
        );
        await expectLater(sut!.getExchangeList(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));

        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ExchangesMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));

        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));
      });
    });
  });
  
  group('getMarketExchangeList method in', () {
    var basePath = "/exchanges/list";
    group('ExchangesEndpoint test endpoint path creation', () {
      test('with required parameters', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeMockData.validResponseBody
          )
        );
        await sut?.getMarketExchangeList();
        expect(sut?.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('ExchangesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeMockData.validResponseBody
          )
        );
        var result = await sut!.getMarketExchangeList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(3);
        expect(result.length, 4);
        expect(firstItem.id, '1bch');
        expect(firstItem.name, '1BCH');
        expect(lastItem.id, 'abcc');
        expect(lastItem.name, 'ABCC');
      });

      test('should still return a result for incomplete data format', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getMarketExchangeList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "1bch");
        expect(firstItem.name, null);
        expect(lastItem.id, null);
        expect(lastItem.name, "ABCC");
      });
    });

    group('ExchangesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: MarketExchangeMockData.validResponseBody
          )
        );
        await expectLater(sut!.getMarketExchangeList(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getMarketExchangeList(), throwsA(isA<DataParsingException>()));

        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getMarketExchangeList(), throwsA(isA<DataParsingException>()));

        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getMarketExchangeList(), throwsA(isA<DataParsingException>()));
      });
    });
  });



  group('getMarketExchangeInfo method in', () {
    var basePath = "/exchanges/binance";
    group('ExchangesEndpoint test endpoint path creation', () {

      test('with all parameters', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeInfoMockData.validResponseBody
          )
        );
        await sut?.getMarketExchangeInfo(id: 'binance');
        expect(
          sut?.endpointPath,
          "$apiVersionPath$basePath"
        );
      });
    });

    group('ExchangesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeInfoMockData.validResponseBody
          )
        );
        var result = await sut!.getMarketExchangeInfo(id: 'binance');
        expect(result.id, null);
        expect(result.name, "Binance");
        expect(result.yearEstablished, 2017);
        expect(result.country, "Cayman Islands");
        expect(result.description, "Binance Weekly Report: Record BNB Burn at \$68M\r\n\r\nRead here ➡️ https://ter.li/Binance-Report-October-23");
        expect(result.url, "https://www.binance.com/");
        expect(result.image, "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250");
        expect(result.facebookUrl, "https://www.test.com/");
        expect(result.redditUrl, "https://www.test.com/");
        expect(result.telegramUrl, "https://www.test.com/");
        expect(result.slackUrl, "https://www.test.com/");
        expect(result.otherUrl1, "https://www.test.com/");
        expect(result.otherUrl2, "https://www.test.com/");
        expect(result.twitterHandle, "binance");
        expect(result.hasTradingIncentive, false);
        expect(result.centralized, true);
        expect(result.publicNotice, "notice test");
        expect(result.alertNotice, "notice test");
        expect(result.trustScore, 10);
        expect(result.trustScoreRank, 4);
        expect(result.tradeVolume24hBtc, 511298.14836440206);
        expect(result.tradeVolume24hBtcNormalized, 511298.14836440206);
        expect(result.tickers?.length, 2);
        expect(result.statusUpdates?.length, 2);

        var ticke1 = result.tickers?.elementAt(0);
        expect(ticke1?.base, 'BUSD');
        expect(ticke1?.target, 'USDT');
        expect(ticke1?.market!['name'], 'Binance');
        expect(ticke1?.market!['has_trading_incentive'], false);
        expect(ticke1?.last, 0.9996);
        expect(ticke1?.volume, 495186394.1897759);
        expect(ticke1?.trustScore, "green");
        expect(ticke1?.bidAskSpreadPercentage, 0.010003);
        expect(ticke1?.isAnomaly, false);

        var status1 = result.statusUpdates?.elementAt(0);
        expect(status1?.description, "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens");
        expect(status1?.category, "general");
        expect(status1?.createdAt.toString(), "2020-12-14 11:18:49.085Z");
        expect(status1?.user, "Darc");
        expect(status1?.userTitle, "Marketing");
        expect(status1?.pin, false);
        expect(status1?.project?.type, "Market");
        expect(status1?.project?.id, "binance");
        expect(status1?.project?.name, "Binance");
        expect(status1?.project?.image?.thumb, "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250");
        expect(status1?.project?.image?.small, "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250");
        expect(status1?.project?.image?.large, "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250");
      });

      test('should still return a result for incomplete data format', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeInfoMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getMarketExchangeInfo(id: 'binance');
        expect(result.id, null);
        expect(result.name, "Binance");
        expect(result.yearEstablished, 2017);
        expect(result.country, "Cayman Islands");
        expect(result.description, "Binance Weekly Report: Record BNB Burn at \$68M\r\n\r\nRead here ➡️ https://ter.li/Binance-Report-October-23");
        expect(result.url, "https://www.binance.com/");
        expect(result.image, "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250");
        expect(result.facebookUrl, null);
        expect(result.redditUrl, null);
        expect(result.telegramUrl, null);
        expect(result.slackUrl, null);
        expect(result.otherUrl1, "https://www.test.com/");
        expect(result.otherUrl2, "https://www.test.com/");
        expect(result.twitterHandle, "binance");
        expect(result.hasTradingIncentive, false);
        expect(result.centralized, null);
        expect(result.publicNotice, "notice test");
        expect(result.alertNotice, null);
        expect(result.trustScore, 10);
        expect(result.trustScoreRank, 4);
        expect(result.tradeVolume24hBtc, null);
        expect(result.tradeVolume24hBtcNormalized, 511298.14836440206);
        expect(result.tickers?.length, 2);
        expect(result.statusUpdates?.length, 2);

        var ticke1 = result.tickers?.elementAt(0);
        expect(ticke1?.base, 'BUSD');
        expect(ticke1?.target, 'USDT');
        expect(ticke1?.market!['name'], 'Binance');
        expect(ticke1?.market?['has_trading_incentive'], null);
        expect(ticke1?.last, 0.9996);
        expect(ticke1?.volume, null);
        expect(ticke1?.trustScore, "green");
        expect(ticke1?.bidAskSpreadPercentage, 0.010003);
        expect(ticke1?.isAnomaly, false);

        var status1 = result.statusUpdates?.elementAt(0);
        expect(status1?.description, "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens");
        expect(status1?.category, "general");
        expect(status1?.createdAt, null);
        expect(status1?.user, "Darc");
        expect(status1?.userTitle, "Marketing");
        expect(status1?.pin, false);
        expect(status1?.project?.type, "Market");
        expect(status1?.project?.id, null);
        expect(status1?.project?.name, null);
        expect(status1?.project?.image?.thumb, "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250");
        expect(status1?.project?.image?.small, null);
        expect(status1?.project?.image?.large, "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250");
      
      });
    });

    group('ExchangesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: MarketExchangeInfoMockData.validResponseBody
          )
        );
        await expectLater(sut!.getMarketExchangeInfo(id: 'binance'), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: MarketExchangeInfoMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getMarketExchangeInfo(id: 'binance'), throwsA(isA<DataParsingException>()));

        sut = ExchangesEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getMarketExchangeInfo(id: 'binance'), throwsA(isA<DataParsingException>()));
      });
    });
  });
}
