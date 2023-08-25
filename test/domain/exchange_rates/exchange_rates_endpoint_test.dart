import 'dart:convert';
import 'package:coingecko_client/coingecko_client.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/exchange_rates_mock_data.dart';

void main() {
  ExchangeRatesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getList method in', () {
    final basePath = "/exchange_rates";
    group('ExchangeRatesEndpoint test endpoint path creation', () {
      var sut = ExchangeRatesEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: ExchangeRatesMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('ExchangeRatesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ExchangeRatesEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: ExchangeRatesMockData.validResponseBody));
        final result = await sut!.getList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(2);

        expect(result.length, 3);
        expect(firstItem.name, "Bitcoin");
        expect(firstItem.unit, "BTC");
        expect(firstItem.value, 1);
        expect(firstItem.type, "crypto");
        expect(lastItem.name, "XRP");
        expect(lastItem.unit, "XRP");
        expect(lastItem.value, 63171.034);
        expect(lastItem.type, "crypto");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = ExchangeRatesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: ExchangeRatesMockData.responseBodyWithIncompleteKeys));

        final result = await sut!.getList();
        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(2);

        expect(result.length, 3);
        expect(firstItem.name, null);
        expect(firstItem.unit, null);
        expect(firstItem.value, 1);
        expect(firstItem.type, "crypto");
        expect(lastItem.name, "XRP");
        expect(lastItem.unit, "XRP");
        expect(lastItem.value, null);
        expect(lastItem.type, null);

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });
    });

    group('ExchangeRatesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ExchangeRatesEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: ExchangeRatesMockData.validResponseBody));
        await expectLater(
            sut!.getList(), throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = ExchangeRatesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(sut!.getList(), throwsA(isA<DataParsingException>()));

        sut = ExchangeRatesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: ExchangeRatesMockData.responseBodyWithInvalidFormat));
        await expectLater(sut!.getList(), throwsA(isA<DataParsingException>()));

        sut = ExchangeRatesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(sut!.getList(), throwsA(isA<DataParsingException>()));
      });
    });
  });
}
