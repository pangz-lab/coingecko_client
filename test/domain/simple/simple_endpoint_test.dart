import 'package:coingecko_client/src/domain/simple/simple_endpoint.dart';
import 'package:coingecko_client/src/models/currencies.dart';

import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/simple_mock_data.dart';

void main() {
  SimpleEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getSimpleCoinPrice method in', () {
    var basePath = "/simple/price";
    group('SimpleEndpoint test endpoint path creation', () {
      var sut = SimpleEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: SimpleCoinPriceMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getCoinPrice(
          ids: ['bitcoin'],
          vsCurrencies: [Currencies.jpy],
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath?ids=bitcoin&vs_currencies=jpy");
      });

      test('with all parameters', () async {
        await sut.getCoinPrice(
          ids: ['bitcoin', 'ethereum', 'verus-coin'],
          vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?ids=bitcoin,ethereum,verus-coin&vs_currencies=jpy,usd,php&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true&include_last_updated_at=true&precision=18"
        );
      });
    });

    group('SimpleEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleCoinPriceMockData.validResponseBody
          )
        );
        var result = await sut!.getCoinPrice(
          ids: ['bitcoin', 'ethereum', 'verus-coin'],
          vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );

        var firstItem = result["bitcoin"];
        var secondItem = result["ethereum"];
        var thirdItem = result["verus-coin"];
        expect(result.length, 3);
        expect(firstItem["jpy"], 3881924.3037475827);
        expect(firstItem["jpy_market_cap"], 74963848431157.84);
        expect(firstItem["jpy_24h_vol"], 2319295474939.273);
        expect(firstItem["jpy_24h_change"], 0.8304785217679028);
        expect(firstItem["usd"], 28527.72397490793);
        expect(firstItem["usd_market_cap"], 551045734456.4741);
        expect(firstItem["usd_24h_vol"], 17044181171.035738);
        expect(firstItem["usd_24h_change"], 1.9342642953468947);
        expect(firstItem["php"], 1578805.0923411534);
        expect(firstItem["php_market_cap"], 30492667312929.062);
        expect(firstItem["php_24h_vol"], 943273289214.5586);
        expect(firstItem["php_24h_change"], 1.9533072546775028);
        expect(secondItem["jpy"], 253266.49596619446);
        expect(thirdItem["jpy"], 96.560977993782572222);
      });

      test('should still return a result for incomplete data format', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleCoinPriceMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getCoinPrice(
          ids: ['bitcoin', 'ethereum', 'verus-coin'],
          vsCurrencies: [Currencies.jpy, Currencies.usd, Currencies.php],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );

        var firstItem = result["bitcoin"];
        var secondItem = result["ethereum"];
        var thirdItem = result["verus-coin"];
        expect(result.length, 3);
        expect(firstItem["jpy"], null);
        expect(secondItem["jpy"], null);
        expect(thirdItem["jpy"], null);
        expect(firstItem["jpy_market_cap"], 74963848431157.84);
        expect(firstItem["jpy_24h_vol"], 2319295474939.273);
        expect(firstItem["jpy_24h_change"], 0.8304785217679028);
        expect(firstItem["usd"], 28527.72397490793);
        expect(firstItem["usd_market_cap"], 551045734456.4741);
        expect(firstItem["usd_24h_vol"], 17044181171.035738);
        expect(firstItem["usd_24h_change"], 1.9342642953468947);
        expect(firstItem["php"], 1578805.0923411534);
        expect(firstItem["php_market_cap"], 30492667312929.062);
        expect(firstItem["php_24h_vol"], 943273289214.5586);
        expect(firstItem["php_24h_change"], 1.9533072546775028);
      });
    });

    group('SimpleEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: SimpleCoinPriceMockData.validResponseBody
          )
        );
        await expectLater(sut!.getCoinPrice(
          ids: ['bitcoin'],
          vsCurrencies: [Currencies.jpy],
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getCoinPrice(
          ids: ['bitcoin'],
          vsCurrencies: [Currencies.jpy],
        ),throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleCoinPriceMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getCoinPrice(
          ids: ['bitcoin'],
          vsCurrencies: [Currencies.jpy],
        ), throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getCoinPrice(
          ids: ['bitcoin'],
          vsCurrencies: [Currencies.jpy],
        ), throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getTokenPrice method in', () {
    var basePath = "/simple/token_price/avalanche";
    group('SimpleEndpoint test endpoint path creation', () {
      var sut = SimpleEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: SimpleTokenPriceMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ],
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?contract_addresses=0x2098fABE9C82eb5280AF4841a5000f373E99a498&vs_currencies=btc"
        );
      });

      test('with all parameters', () async {
        await sut.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath?contract_addresses=0x2098fABE9C82eb5280AF4841a5000f373E99a498&vs_currencies=btc&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true&include_last_updated_at=true&precision=18");
      });
    });

    group('SimpleEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleTokenPriceMockData.validResponseBody
          )
        );
        var result = await sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );

        var firstItem = result["0x2098fABE9C82eb5280AF4841a5000f373E99a498"];
        expect(result.length, 1);
        expect(firstItem["btc"], 3881924.3037475827);
        expect(firstItem["btc_market_cap"], 74963848431157.84);
        expect(firstItem["btc_24h_vol"], 2319295474939.273);
        expect(firstItem["btc_24h_change"], 0.8304785217679028);
      });

      test('should still return a result for incomplete data format', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleTokenPriceMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ],
          includeMarketCap: true,
          include24hrVol: true,
          include24hrChange: true,
          includeLastUpdatedAt: true,
          precision: 18
        );

        var firstItem = result["0x2098fABE9C82eb5280AF4841a5000f373E99a498"];
        expect(result.length, 1);
        expect(firstItem["btc"], 3881924.3037475827);
        expect(firstItem["btc_market_cap"], null);
        expect(firstItem["btc_24h_vol"], 2319295474939.273);
        expect(firstItem["btc_24h_change"], 0.8304785217679028);
      });
    });

    group('SimpleEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: SimpleTokenPriceMockData.validResponseBody
          )
        );
        await expectLater(sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ]
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ]
        ),throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleTokenPriceMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ]
        ), throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getTokenPrice(
          id: 'avalanche',
          contractAddresses: ['0x2098fABE9C82eb5280AF4841a5000f373E99a498'],
          vsCurrencies: [ CryptoCurrencies.btc ]
        ), throwsA(isA<DataParsingException>()));
      });
    });
  });
  
  group('getSupportedVsCurrencies method in', () {
    var basePath = "/simple/supported_vs_currencies";
    group('SimpleEndpoint test endpoint path creation', () {
      test('with required parameters', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleSupportedVsCurrencyMockData.validResponseBody
          )
        );
        await sut?.getSupportedVsCurrencies();
        expect(sut?.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('SimpleEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleSupportedVsCurrencyMockData.validResponseBody
          )
        );
        var result = await sut!.getSupportedVsCurrencies();
        expect(result.length, 10);
        expect(result.first, 'vrsc');
        expect(result.last, 'sats');
      });
    });

    group('SimpleEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: SimpleSupportedVsCurrencyMockData.validResponseBody
          )
        );
        await expectLater(sut!.getSupportedVsCurrencies(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getSupportedVsCurrencies(), throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: SimpleSupportedVsCurrencyMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getSupportedVsCurrencies(), throwsA(isA<DataParsingException>()));

        sut = SimpleEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getSupportedVsCurrencies(), throwsA(isA<DataParsingException>()));
      });
    });
  });
}
