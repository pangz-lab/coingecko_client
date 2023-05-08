import 'dart:convert';
import 'package:coingecko_client/src/domain/trending/trending_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/trending_mock_data.dart';

void main() {
  TrendingEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getResult method in', () {
    final basePath = "/search/trending";
    group('TrendingEndpoint test endpoint path creation', () {
      var sut = TrendingEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: TerndingMockData.validResponseBody));

      test('with required parameters', () async {
        await sut.getResult();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('TrendingEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = TrendingEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: TerndingMockData.validResponseBody));
        final result = await sut!.getResult();

        expect(result, {
          "coins": [
            {
              "item": {
                "id": "chaingpt",
                "coin_id": 29306,
                "name": "ChainGPT",
                "symbol": "CGPT",
                "market_cap_rank": 858,
                "thumb":
                    "https://assets.coingecko.com/coins/images/29306/thumb/200x200.png?1677992972",
                "small":
                    "https://assets.coingecko.com/coins/images/29306/small/200x200.png?1677992972",
                "large":
                    "https://assets.coingecko.com/coins/images/29306/large/200x200.png?1677992972",
                "slug": "chaingpt",
                "price_btc": 0.000005920902940245426,
                "score": 0
              }
            },
            {
              "item": {
                "id": "pepe",
                "coin_id": 29850,
                "name": "Pepe",
                "symbol": "PEPE",
                "market_cap_rank": 43,
                "thumb":
                    "https://assets.coingecko.com/coins/images/29850/thumb/pepe-token.jpeg?1682922725",
                "small":
                    "https://assets.coingecko.com/coins/images/29850/small/pepe-token.jpeg?1682922725",
                "large":
                    "https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725",
                "slug": "pepe",
                "price_btc": 1.0164505793922885e-10,
                "score": 1
              }
            }
          ]
        });

        expect(jsonEncode(result).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = TrendingEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: TerndingMockData.responseBodyWithIncompleteKeys));
        final result = await sut!.getResult();

        expect(result, {
          "coins": [
            {
              "item": {
                "market_cap_rank": 858,
                "thumb":
                    "https://assets.coingecko.com/coins/images/29306/thumb/200x200.png?1677992972",
                "small":
                    "https://assets.coingecko.com/coins/images/29306/small/200x200.png?1677992972",
                "large":
                    "https://assets.coingecko.com/coins/images/29306/large/200x200.png?1677992972",
                "slug": "chaingpt",
                "price_btc": 0.000005920902940245426,
                "score": 0
              }
            },
            {
              "item": {
                "id": "pepe",
                "coin_id": 29850,
                "name": "Pepe",
                "symbol": "PEPE",
                "market_cap_rank": 43,
                "score": 1
              }
            }
          ]
        });

        expect(jsonEncode(result).runtimeType, String);
      });
    });

    group('TrendingEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = TrendingEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: TerndingMockData.validResponseBody));
        await expectLater(
            sut!.getResult(), throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut =
            TrendingEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(
            sut!.getResult(), throwsA(isA<DataParsingException>()));

        sut = TrendingEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: TerndingMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getResult(), throwsA(isA<DataParsingException>()));

        sut =
            TrendingEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getResult(), throwsA(isA<DataParsingException>()));
      });
    });
  });
}
