import 'package:coingecko_client/src/domain/global/global_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/global_mock_data.dart';

void main() {
  GlobalEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getCryptoInfo method in', () {
    var basePath = "/global";
    group('GlobalEndpoint test endpoint path creation', () {
      var sut = GlobalEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: GlobalCryptoMockData.validResponseBody
        )
      );

      test('without parameters', () async {
        await sut.getCryptoInfo();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('GlobalEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: GlobalCryptoMockData.validResponseBody
          )
        );
        var result = await sut!.getCryptoInfo();

        expect(result.activeCryptocurrencies, 10689);
        expect(result.upcomingIcos, 0);
        expect(result.ongoingIcos, 49);
        expect(result.endedIcos, 3376);
        expect(result.markets, 730);
        expect(result.totalMarketCap, {
          "btc": 42878529.36821942,
          "eth": 640948223.5557362,
          "ltc": 14426069664.536545,
          "bch": 10580973266.418148,
          "sats": 4287852936821942
        });
        expect(result.totalVolume, {
          "btc": 2690072.986370203,
          "eth": 40211208.902308844,
          "ltc": 905049237.3655756,
          "bch": 663819183.4674561
        });
        expect(result.marketCapPercentage, {
          "btc": 45.16322104636624,
          "eth": 18.786970593968423,
          "usdt": 6.5166124733657265,
          "bnb": 4.075733958995251,
          "usdc": 2.409475289744893,
          "xrp": 1.9118766850578561,
          "ada": 1.08634805454502,
          "steth": 0.9844427873710667,
          "doge": 0.8758498755197673,
          "matic": 0.7245310857878053
        });
        expect(result.marketCapChangePercentage24hUsd, 1.0640913224189947);
        expect(result.updatedAt.toString(), '2023-05-06 14:28:35.000');
      });

      test('should still return a result for incomplete data format', () async {
        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: GlobalCryptoMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getCryptoInfo();

        expect(result.activeCryptocurrencies, 10689);
        expect(result.upcomingIcos, 0);
        expect(result.ongoingIcos, 49);
        expect(result.endedIcos, 3376);
        expect(result.markets, 730);
        expect(result.totalMarketCap, null);
        expect(result.totalVolume, null);
        expect(result.marketCapPercentage, null);
        expect(result.marketCapChangePercentage24hUsd, 1.0640913224189947);
        expect(result.updatedAt.toString(), '2023-05-06 14:28:35.000');

      });
    });

    group('GlobalEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: GlobalCryptoMockData.validResponseBody
          )
        );
        await expectLater(sut!.getCryptoInfo(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getCryptoInfo(),throwsA(isA<DataParsingException>()));

        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: GlobalCryptoMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getCryptoInfo(), throwsA(isA<DataParsingException>()));

        sut = GlobalEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getCryptoInfo(),
          throwsA(isA<DataParsingException>())
        );
      });
    });
  });

}
