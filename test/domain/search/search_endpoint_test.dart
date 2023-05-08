import 'dart:convert';
import 'package:coingecko_client/src/domain/search/search_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/search_mock_data.dart';

void main() {
  SearchEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getResult method in', () {
    final basePath = "/search";
    group('SearchEndpoint test endpoint path creation', () {
      var sut = SearchEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: SearchMockData.validResponseBody));

      test('with required parameters', () async {
        await sut.getResult(query: 'bybit');
        expect(sut.endpointPath, "$apiVersionPath$basePath?query=bybit");
      });
    });

    group('SearchEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = SearchEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: SearchMockData.validResponseBody));
        final result = await sut!.getResult(query: 'bybit');

        expect(result, {
          "coins": [],
          "exchanges": [
            {
              "id": "bybit_spot",
              "name": "Bybit",
              "market_type": "spot",
              "thumb":
                  "https://assets.coingecko.com/markets/images/698/thumb/bybit_spot.png",
              "large":
                  "https://assets.coingecko.com/markets/images/698/large/bybit_spot.png"
            },
            {
              "id": "bybit",
              "name": "Bybit (Futures)",
              "market_type": "futures",
              "thumb":
                  "https://assets.coingecko.com/markets/images/460/thumb/photo_2021-08-12_18-27-50.jpg",
              "large":
                  "https://assets.coingecko.com/markets/images/460/large/photo_2021-08-12_18-27-50.jpg"
            }
          ],
          "icos": [],
          "categories": [
            {"id": 145, "name": "Move To Earn"},
            {"id": 119, "name": "Play To Earn"}
          ],
          "nfts": []
        });

        expect(jsonEncode(result).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = SearchEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: SearchMockData.responseBodyWithIncompleteKeys));
        final result = await sut!.getResult(query: 'bybit');

        expect(result, {
          "coins": [],
          "exchanges": [
            {
              "id": "bybit_spot",
              "name": "Bybit",
              "market_type": "spot",
              "thumb":
                  "https://assets.coingecko.com/markets/images/698/thumb/bybit_spot.png",
              "large":
                  "https://assets.coingecko.com/markets/images/698/large/bybit_spot.png"
            },
            {
              "id": "bybit",
              "name": "Bybit (Futures)",
              "market_type": "futures",
              "thumb":
                  "https://assets.coingecko.com/markets/images/460/thumb/photo_2021-08-12_18-27-50.jpg",
              "large":
                  "https://assets.coingecko.com/markets/images/460/large/photo_2021-08-12_18-27-50.jpg"
            }
          ]
        });

        expect(jsonEncode(result).runtimeType, String);
      });
    });

    group('SearchEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = SearchEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: SearchMockData.validResponseBody));
        await expectLater(sut!.getResult(query: 'bybit'),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = SearchEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(sut!.getResult(query: 'bybit'),
            throwsA(isA<DataParsingException>()));

        sut = SearchEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: SearchMockData.responseBodyWithInvalidFormat));
        await expectLater(sut!.getResult(query: 'bybit'),
            throwsA(isA<DataParsingException>()));

        sut = SearchEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(sut!.getResult(query: 'bybit'),
            throwsA(isA<DataParsingException>()));
      });
    });
  });
}
