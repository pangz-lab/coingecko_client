import 'dart:convert';
import 'package:coingecko_client/src/domain/indexes/indexes_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/indexes_mock_data.dart';

void main() {
  IndexesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getList method in', () {
    var basePath = "/indexes";
    group('IndexesEndpoint test endpoint path creation', () {
      var sut = IndexesEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: MarketIndexListMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut.getList(perPage: 10, page: 2);
        expect(sut.endpointPath, "$apiVersionPath$basePath?per_page=10&page=2");
      });
    });

    group('IndexesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: MarketIndexListMockData.validResponseBody));
        var result = await sut!.getList(perPage: 10, page: 2);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "PEOPLE");
        expect(firstItem.name, "ZB (Derivatives) PEOPLE");
        expect(lastItem.id, "LUNA");
        expect(lastItem.name, "Bibox (Futures) LUNA");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexListMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getList(perPage: 10, page: 2);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "PEOPLE");
        expect(firstItem.name, null);
        expect(lastItem.id, null);
        expect(lastItem.name, "Bibox (Futures) LUNA");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });
    });

    group('IndexesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: MarketIndexListMockData.validResponseBody));
        await expectLater(sut!.getList(perPage: 10, page: 2),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''{
    "error": "coin not found"
  }'''));
        await expectLater(sut!.getList(perPage: 10, page: 2),
            throwsA(isA<DataParsingException>()));

        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexListMockData.responseBodyWithInvalidFormat));
        await expectLater(sut!.getList(perPage: 10, page: 2),
            throwsA(isA<DataParsingException>()));

        sut =
            IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(sut!.getList(perPage: 10, page: 2),
            throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getInfo method in', () {
    var basePath = "/indexes/bybit/HOT";
    group('IndexesEndpoint test endpoint path creation', () {
      var sut = IndexesEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: MarketIndexMockData.validResponseBody));

      test('with all parameters', () async {
        await sut.getInfo(
          marketId: 'bybit',
          id: 'HOT',
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('IndexesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: MarketIndexMockData.validResponseBody));
        var result = await sut!.getInfo(
          marketId: 'bybit',
          id: 'HOT',
        );

        expect(result.name, "Bybit (Futures) HOT");
        expect(result.market, "Bybit (Futures)");
        expect(result.last, 0.001845);
        expect(result.isMultiAssetComposite, false);

        expect(jsonEncode(result.toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getInfo(
          marketId: 'bybit',
          id: 'HOT',
        );
        expect(result.name, "Bybit (Futures) HOT");
        expect(result.market, null);
        expect(result.last, 0.001845);
        expect(result.isMultiAssetComposite, null);

        expect(jsonEncode(result.toJson()).runtimeType, String);
      });
    });

    group('IndexesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: MarketIndexMockData.validResponseBody));
        await expectLater(
            sut!.getInfo(
              marketId: 'bybit',
              id: 'HOT',
            ),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut =
            IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(
            sut!.getInfo(
              marketId: 'bybit',
              id: 'HOT',
            ),
            throwsA(isA<DataParsingException>()));

        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getInfo(
              marketId: 'bybit',
              id: 'HOT',
            ),
            throwsA(isA<DataParsingException>()));

        sut =
            IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getInfo(
              marketId: 'bybit',
              id: 'HOT',
            ),
            throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getBasicInfo method in', () {
    var basePath = "/indexes/list";
    group('IndexesEndpoint test endpoint path creation', () {
      var sut = IndexesEndpoint(HttpRequestServiceMock(
          statusCode: 200,
          body: MarketIndexBasicInfoMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getBasicInfoList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('IndexesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexBasicInfoMockData.validResponseBody));
        var result = await sut!.getBasicInfoList();

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "PEOPLE");
        expect(firstItem.name, "ZB (Derivatives) PEOPLE");
        expect(lastItem.id, "LUNA");
        expect(lastItem.name, "Bibox (Futures) LUNA");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexBasicInfoMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getBasicInfoList();

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "PEOPLE");
        expect(firstItem.name, null);
        expect(lastItem.id, null);
        expect(lastItem.name, "Bibox (Futures) LUNA");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });
    });

    group('IndexesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 500,
            body: MarketIndexBasicInfoMockData.validResponseBody));
        await expectLater(
            sut!.getBasicInfoList(), throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''{
    "error": "coin not found"
  }'''));
        await expectLater(
            sut!.getBasicInfoList(), throwsA(isA<DataParsingException>()));

        sut = IndexesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: MarketIndexBasicInfoMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getBasicInfoList(), throwsA(isA<DataParsingException>()));

        sut =
            IndexesEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getBasicInfoList(), throwsA(isA<DataParsingException>()));
      });
    });
  });
}
