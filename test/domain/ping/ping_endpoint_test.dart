import 'package:coingecko_client/src/domain/ping/ping_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/ping_mock_data.dart';

void main() {
  PingEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getResult method in', () {
    var basePath = "/ping";
    group('PingEndpoint test endpoint path creation', () {
      var sut = PingEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: PingMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getResult();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('PingEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: PingMockData.validResponseBody
          )
        );
        var result = await sut!.getResult();

        expect(result, {
          "gecko_says": "(V3) To the Moon!"
        });
      });

      test('should still return a result for incomplete data format', () async {
        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: PingMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getResult();

        expect(result, {});
      });
    });

    group('PingEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: PingMockData.validResponseBody
          )
        );
        await expectLater(sut!.getResult(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getResult(),throwsA(isA<DataParsingException>()));

        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: PingMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getResult(), throwsA(isA<DataParsingException>()));

        sut = PingEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getResult(),
          throwsA(isA<DataParsingException>())
        );
      });
    });
  });
}
