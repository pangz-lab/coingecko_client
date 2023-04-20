// import 'package:coingecko_client/src/domain/exchanges/exchanges_endpoint.dart';
// import 'package:test/test.dart';

// import '../services/http_request_service_mock.dart';
// import 'exchanges/mock/exchanges_mock_data.dart';

// void main() {
//   ExchangesEndpoint? sut;
//   final String apiVersionPath = "/api/v3";

//   group('getMarketExchangeInfo method in', () {
//     var basePath = "/exchanges";
//     group('ExchangesEndpoint test endpoint path creation', () {
//       sut = ExchangesEndpoint(
//         HttpRequestServiceMock(
//           statusCode : 200,
//           body: ExchangesMockData.validResponseBody
//         )
//       );

//       test('with required parameters', () async {
//         await sut?.getExchangeList();
//         expect(sut?.endpointPath, "$apiVersionPath$basePath");
//       });

//       test('with all parameters', () async {
//         await sut?.getExchangeList(perPage: 1, page: 3);
//         expect(
//           sut?.endpointPath,
//           "$apiVersionPath$basePath?per_page=1&page=3"
//         );
//       });
//     });

//     group('ExchangesEndpoint test endpoint response', () {
//       test('with data in getting the correct response type', () async {
//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 200,
//             body: ExchangesMockData.validResponseBody
//           )
//         );
//         var result = await sut!.getExchangeList(
//           page: 1,
//           perPage: 3
//         );
//         var firstItem = result.elementAt(0);
//         expect(result.length, 3);
//         expect(firstItem.id, "bybit_spot");
//         expect(firstItem.name, "Bybit");
//         expect(firstItem.yearEstablished, 2018);
//         expect(firstItem.country, "British Virgin Islands");
//         expect(firstItem.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
//         expect(firstItem.url, "https://www.bybit.com");
//         expect(firstItem.image, "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794");
//         expect(firstItem.hasTradingIncentive, false);
//         expect(firstItem.trustScore, 10);
//         expect(firstItem.trustScoreRank, 4);
//         expect(firstItem.tradeVolume24hBtc, 32427.38111948771);
//         expect(firstItem.tradeVolume24hBtcNormalized, 32427.38111948771);
//       });

//       test('should still return a result for incomplete data format', () async {
//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 200,
//             body: ExchangesMockData.responseBodyWithIncompleteKeys
//           )
//         );
//         var result = await sut!.getExchangeList(page: 1, perPage: 3);
//         var firstItem = result.elementAt(0);
//         expect(result.length, 1);
//         expect(firstItem.id, "bybit_spot");
//         expect(firstItem.name, "Bybit");
//         expect(firstItem.yearEstablished, null);
//         expect(firstItem.country, "British Virgin Islands");
//         expect(firstItem.description, "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.");
//         expect(firstItem.url, "https://www.bybit.com");
//         expect(firstItem.image, "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794");
//         expect(firstItem.hasTradingIncentive, null);
//         expect(firstItem.trustScore, 10);
//         expect(firstItem.trustScoreRank, null);
//         expect(firstItem.tradeVolume24hBtc, 32427.38111948771);
//         expect(firstItem.tradeVolume24hBtcNormalized, null);
//       });
//     });

//     group('ExchangesEndpoint test for error handling', () {
//       test('should throw an exception for failed request', () async {
//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 500,
//             body: ExchangesMockData.validResponseBody
//           )
//         );
//         await expectLater(sut!.getExchangeList(), throwsA(isA<NetworkRequestException>()));
//       });

//       test('should return a FormatException when result is error or when parsing failed', () async {
//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 200,
//             body: '''{
//     "error": "coin not found"
//   }'''
//           )
//         );
//         await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));

//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 200,
//             body: ExchangesMockData.responseBodyWithInvalidFormat
//           )
//         );
//         await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));

//         sut = ExchangesEndpoint(
//           HttpRequestServiceMock(
//             statusCode : 200,
//             body: ""
//           )
//         );
//         await expectLater(sut!.getExchangeList(), throwsA(isA<DataParsingException>()));
//       });
//     });
//   });
  
// }