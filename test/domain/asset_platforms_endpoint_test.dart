import 'package:coingecko_client/src/domain/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platforms_filter.dart';
import 'package:coingecko_client/src/models/exceptions/failed_request_exception.dart';
import 'package:coingecko_client/src/models/exceptions/failed_parsing_exception.dart';
import 'package:test/test.dart';

import '../services/http_request_service_mock.dart';

void main() {
  AssetPlatformsEndpoint? sut;
  final String apiVersionPath = "/api/v3";
  var responseBody = '''[
  {
    "id": "factom",
    "chain_identifier": null,
    "name": "Factom",
    "shortname": ""
  },
  {
    "id": "openledger",
    "chain_identifier": 12,
    "name": "OpenLedger",
    "shortname": ""
  }
]''';
  var responseBodyIncomplete = '''[
  {
    "id": "factom",
    "name": "Factom"
  },
  {
    "chain_identifier": 12,
    "shortname": "sn"
  }
]''';
  //With comman at the last part
  var responseBodyInvalidFormat = '''[
  {
    "id": "factom",
    "name": "Factom",
  },
]''';
  group('AssetPlatformsEndpoint test endpoint path creation', () {
    var sut = AssetPlatformsEndpoint(
      HttpRequestServiceMock(
        statusCode : 200,
        body: responseBody
      )
    );

    test('without parameters', () async {
      await sut();
      expect(sut.endpointPath, "$apiVersionPath/asset_platforms");
    });

    test('with parameters', () async {
      await sut(filter: AssetPlatformsFilter.nft);
      expect(sut.endpointPath, "$apiVersionPath/asset_platforms?filter=nft");
    });
  });

  group('AssetPlatformsEndpoint test endpoint response', () {
    sut = AssetPlatformsEndpoint(
      HttpRequestServiceMock(
        statusCode : 200,
        body: responseBody
      )
    );
    test('with data in getting the correct response type', () async {
      var result = await sut!();
      expect(result.elementAt(0).id, 'factom');
      expect(result.elementAt(0).chainIdentifier, null);
      expect(result.elementAt(0).name, 'Factom');
      expect(result.elementAt(0).shortName, '');
      expect(result.elementAt(1).name, 'OpenLedger');
      expect(result.elementAt(1).chainIdentifier, 12);
    });

    test('should still return a result for incomplete data format', () async {
      sut = AssetPlatformsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: responseBodyIncomplete
        )
      );
      var result = await sut!();
      expect(result.length, 2);
      expect(result.elementAt(0).id, 'factom');
      expect(result.elementAt(0).name, 'Factom');
      expect(result.elementAt(0).chainIdentifier, null);
      expect(result.elementAt(0).shortName, null);
      expect(result.elementAt(1).id, null);
      expect(result.elementAt(1).name, null);
      expect(result.elementAt(1).chainIdentifier, 12);
      expect(result.elementAt(1).shortName, 'sn');
    });
  });

  group('AssetPlatformsEndpoint test for error handling', () {
    test('should throw an exception for failed request', () async {
      sut = AssetPlatformsEndpoint(
        HttpRequestServiceMock(
          statusCode : 500,
          body: responseBody
        )
      );
      await expectLater(sut!(), throwsA(isA<FailedRequestException>()));
    });

    test('should return a FormatException when result is error or when parsing failed', () async {
      sut = AssetPlatformsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: '''{
  "error": "coin not found"
}'''
        )
      );
      await expectLater(sut!(), throwsA(isA<FailedParsingException>()));
      sut = AssetPlatformsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: responseBodyInvalidFormat
        )
      );
      await expectLater(sut!(), throwsA(isA<FailedParsingException>()));
      sut = AssetPlatformsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: ""
        )
      );
      await expectLater(sut!(), throwsA(isA<FailedParsingException>()));
    });
  });
}
