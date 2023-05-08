import 'dart:convert';

import 'package:coingecko_client/src/domain/categories/categories_endpoint.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_categories_data_ordering.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/categories_mock_data.dart';

void main() {
  CategoriesEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getBasicList method in', () {
    final basePath = "/coins/categories/list";
    group('CategoriesEndpoint test endpoint path creation', () {
      var sut = CategoriesEndpoint(HttpRequestServiceMock(
          statusCode: 200,
          body: CategoriesBasicInfoListMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getBasicList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('CategoriesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: CategoriesBasicInfoListMockData.validResponseBody));
        final result = await sut!.getBasicList();

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 4);
        expect(firstItem.id, "aave-tokens");
        expect(firstItem.name, "Aave Tokens");
        expect(lastItem.id, "algorand-ecosystem");
        expect(lastItem.name, "Algorand Ecosystem");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: CategoriesBasicInfoListMockData
                .responseBodyWithIncompleteKeys));
        final result = await sut!.getBasicList();

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(3);
        expect(result.length, 4);
        expect(firstItem.id, "aave-tokens");
        expect(firstItem.name, null);
        expect(lastItem.id, null);
        expect(lastItem.name, "Aptos Ecosystem");

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });
    });

    group('CategoriesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 500,
            body: CategoriesBasicInfoListMockData.validResponseBody));
        await expectLater(
            sut!.getBasicList(), throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = CategoriesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: '''{
    "error": "coin not found"
  }'''));
        await expectLater(
            sut!.getBasicList(), throwsA(isA<DataParsingException>()));

        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body:
                CategoriesBasicInfoListMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getBasicList(), throwsA(isA<DataParsingException>()));

        sut = CategoriesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getBasicList(), throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getList method in', () {
    final basePath = "/coins/categories";
    group('CategoriesEndpoint test endpoint path creation', () {
      var sut = CategoriesEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: CategoriesInfoListMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut.getList(order: CoinCategoriesDataOrdering.marketCapAsc);
        expect(
            sut.endpointPath, "$apiVersionPath$basePath?order=market_cap_asc");
      });
    });

    group('CategoriesEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: CategoriesInfoListMockData.validResponseBody));
        final result =
            await sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "farming-as-a-service-faas");
        expect(firstItem.name, "Farming-as-a-Service (FaaS)");
        expect(firstItem.marketCap, 7095886.059870023);
        expect(firstItem.marketCapChange24h, -5.4515408890635815);
        expect(firstItem.content, "");
        expect(firstItem.top3Coins, [
          "https://assets.coingecko.com/coins/images/23551/small/Logo-Digits-DAO-Icon-01.jpg?1644462126",
          "https://assets.coingecko.com/coins/images/21221/small/2022-07-13_18.49.44.jpg?1657709418",
          "https://assets.coingecko.com/coins/images/25582/small/7zyskNC.png?1652767188"
        ]);
        expect(firstItem.volume24h, 108322.37183734335);
        expect(firstItem.updatedAt, DateTime.parse("2023-05-06T04:10:29.372Z"));

        expect(lastItem.id, "fan-token");
        expect(lastItem.name, "Fan Token");
        expect(lastItem.marketCap, 332506254.94806916);
        expect(lastItem.marketCapChange24h, -2.9315845722063925);
        expect(lastItem.content,
            "Fan tokens let sporting organizations and other celebrities engage with their communities, where holders can access exclusive benefits.");
        expect(lastItem.top3Coins, [
          "https://assets.coingecko.com/coins/images/15799/small/mJgwTHzCVVCJlqo1tF0NWP57igOYSXr5k1Vqvomd.png?1621929124",
          null,
          "https://assets.coingecko.com/coins/images/11663/small/og.jpg?1592838119"
        ]);
        expect(lastItem.volume24h, 52516565.164146915);
        expect(lastItem.updatedAt, DateTime.parse("2023-05-06T04:10:10.438Z"));

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });

      test('should still return a result for incomplete data format', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: CategoriesInfoListMockData.responseBodyWithIncompleteKeys));
        final result =
            await sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "farming-as-a-service-faas");
        expect(firstItem.name, null);
        expect(firstItem.marketCap, null);
        expect(firstItem.marketCapChange24h, -5.4515408890635815);
        expect(firstItem.content, "");
        expect(firstItem.top3Coins, null);
        expect(firstItem.volume24h, 108322.37183734335);
        expect(firstItem.updatedAt, DateTime.parse("2023-05-06T04:10:29.372Z"));

        expect(lastItem.id, "fan-token");
        expect(lastItem.name, "Fan Token");
        expect(lastItem.marketCap, 332506254.94806916);
        expect(lastItem.marketCapChange24h, -2.9315845722063925);
        expect(lastItem.content,
            "Fan tokens let sporting organizations and other celebrities engage with their communities, where holders can access exclusive benefits.");
        expect(lastItem.top3Coins, [
          null,
          null,
          "https://assets.coingecko.com/coins/images/11663/small/og.jpg?1592838119"
        ]);
        expect(lastItem.volume24h, null);
        expect(lastItem.updatedAt, null);

        expect(jsonEncode(result.elementAt(0).toJson()).runtimeType, String);
      });
    });

    group('CategoriesEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 500,
            body: CategoriesInfoListMockData.validResponseBody));
        await expectLater(
            sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = CategoriesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: '''{
    "error": "coin not found"
  }'''));
        await expectLater(
            sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc),
            throwsA(isA<DataParsingException>()));

        sut = CategoriesEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: CategoriesInfoListMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc),
            throwsA(isA<DataParsingException>()));

        sut = CategoriesEndpoint(
            HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getList(order: CoinCategoriesDataOrdering.marketCapAsc),
            throwsA(isA<DataParsingException>()));
      });
    });
  });
}
