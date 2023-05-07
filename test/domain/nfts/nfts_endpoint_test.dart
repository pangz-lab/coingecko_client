import 'package:coingecko_client/src/domain/nfts/models/nfts_data_ordering.dart';
import 'package:coingecko_client/src/domain/nfts/nfts_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/models/image.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/nfts_mock_data.dart';

void main() {
  NftsEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getBasicList method in', () {
    var basePath = "/nfts/list";
    group('NftsEndpoint test endpoint path creation', () {
      var sut = NftsEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: NftBasicInfoListMockData.validResponseBody));

      test('without parameters', () async {
        await sut.getBasicList();
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut.getBasicList(
            order: NftsDataOrdering.marketCapUsdDesc,
            assetPlatformId: "ethereum",
            perPage: 10,
            page: 2);
        expect(sut.endpointPath,
            "$apiVersionPath$basePath?order=market_cap_usd_desc&asset_platform_id=ethereum&per_page=10&page=2");
      });
    });

    group('NftsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: NftBasicInfoListMockData.validResponseBody));
        var result = await sut!.getBasicList(
            order: NftsDataOrdering.marketCapUsdDesc,
            assetPlatformId: "ethereum",
            perPage: 10,
            page: 2);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "squiggly");
        expect(firstItem.contractAddress,
            "0x36F379400DE6c6BCDF4408B282F8b685c56adc60");
        expect(firstItem.name, "Squiggly");
        expect(firstItem.assetPlatformId, "ethereum");
        expect(firstItem.symbol, "~~");
        expect(lastItem.id, "autoglyphs");
        expect(lastItem.contractAddress,
            "0xd4e4078ca3495de5b1d4db434bebc5a986197782");
        expect(lastItem.name, "Autoglyphs");
        expect(lastItem.assetPlatformId, "ethereum");
        expect(lastItem.symbol, "☵");
      });

      test('should still return a result for incomplete data format', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftBasicInfoListMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getBasicList(
            order: NftsDataOrdering.marketCapUsdDesc,
            assetPlatformId: "ethereum",
            perPage: 10,
            page: 2);

        var firstItem = result.elementAt(0);
        var lastItem = result.elementAt(1);
        expect(result.length, 2);
        expect(firstItem.id, "squiggly");
        expect(firstItem.contractAddress,
            "0x36F379400DE6c6BCDF4408B282F8b685c56adc60");
        expect(firstItem.name, "Squiggly");
        expect(firstItem.assetPlatformId, null);
        expect(firstItem.symbol, null);
        expect(lastItem.id, "autoglyphs");
        expect(lastItem.contractAddress, null);
        expect(lastItem.name, null);
        expect(lastItem.assetPlatformId, "ethereum");
        expect(lastItem.symbol, "☵");
      });
    });

    group('NftsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: NftBasicInfoListMockData.validResponseBody));
        await expectLater(
            sut!.getBasicList(
                order: NftsDataOrdering.marketCapUsdDesc,
                assetPlatformId: "ethereum",
                perPage: 10,
                page: 2),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''{
    "error": "coin not found"
  }'''));
        await expectLater(
            sut!.getBasicList(
                order: NftsDataOrdering.marketCapUsdDesc,
                assetPlatformId: "ethereum",
                perPage: 10,
                page: 2),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftBasicInfoListMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getBasicList(
                order: NftsDataOrdering.marketCapUsdDesc,
                assetPlatformId: "ethereum",
                perPage: 10,
                page: 2),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getBasicList(
                order: NftsDataOrdering.marketCapUsdDesc,
                assetPlatformId: "ethereum",
                perPage: 10,
                page: 2),
            throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getInfo method in', () {
    var basePath = "/nfts/meebits";
    group('NftsEndpoint test endpoint path creation', () {
      var sut = NftsEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: NftInfoMockData.validResponseBody));

      test('with parameters', () async {
        await sut.getInfo(
          id: 'meebits',
        );
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('NftsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: NftInfoMockData.validResponseBody));
        var result = await sut!.getInfo(
          id: 'meebits',
        );

        expect(result.id, "meebits");
        expect(result.contractAddress,
            "0x7Bd29408f11D2bFC23c34f18275bBf23bB716Bc7");
        expect(result.assetPlatformId, "ethereum");
        expect(result.name, "Meebits");
        expect(result.symbol, "⚇");
        expect(result.image.runtimeType, Image);
        expect(result.image!.small,
            "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788");
        expect(result.image!.thumb, null);
        expect(result.image!.large, null);
        expect(result.description,
            "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.");
        expect(result.nativeCurrency, "ethereum");
        expect(result.floorPrice!["native_currency"], 2.48);
        expect(result.floorPrice!["usd"], 4710.04);
        expect(result.marketCap!["native_currency"], 49576);
        expect(result.marketCap!["usd"], 94196187);
        expect(result.volume24h!["native_currency"], 185.93);
        expect(result.volume24h!["usd"], 353271);

        expect(result.floorPriceInUsd24hPercentageChange, 2.47633);
        expect(result.numberOfUniqueAddresses, 6558);
        expect(result.numberOfUniqueAddresses24hPercentageChange, -0.07618);
        expect(result.totalSupply, 19999);
        expect(result.links!["homepage"], "https://meebits.larvalabs.com/");
        expect(result.links!["twitter"], "https://twitter.com/larvalabs");
        expect(result.links!["discord"], "");
      });

      test('should still return a result for incomplete data format', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftInfoMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getInfo(
          id: 'meebits',
        );

        expect(result.id, "meebits");
        expect(result.contractAddress, null);
        expect(result.assetPlatformId, null);
        expect(result.name, "Meebits");
        expect(result.symbol, "⚇");
        expect(result.image.runtimeType, Image);
        expect(result.image!.small,
            "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788");
        expect(result.image!.thumb, null);
        expect(result.image!.large, null);
        expect(result.description,
            "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.");
        expect(result.nativeCurrency, "ethereum");
        expect(result.floorPrice!["native_currency"], 2.48);
        expect(result.floorPrice!["usd"], null);
        expect(result.marketCap!["native_currency"], 49576);
        expect(result.marketCap!["usd"], null);
        expect(result.volume24h!["native_currency"], 185.93);
        expect(result.volume24h!["usd"], null);

        expect(result.floorPriceInUsd24hPercentageChange, null);
        expect(result.numberOfUniqueAddresses, null);
        expect(result.numberOfUniqueAddresses24hPercentageChange, -0.07618);
        expect(result.totalSupply, 19999);
        expect(result.links!["homepage"], "https://meebits.larvalabs.com/");
        expect(result.links!["twitter"], "https://twitter.com/larvalabs");
        expect(result.links!["discord"], null);
      });
    });

    group('NftsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: NftInfoMockData.validResponseBody));
        await expectLater(
            sut!.getInfo(
              id: 'meebits',
            ),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(
            sut!.getInfo(
              id: 'meebits',
            ),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftInfoMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getInfo(
              id: 'meebits',
            ),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getInfo(
              id: 'meebits',
            ),
            throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getContractInfo method in', () {
    var basePath =
        "/nfts/ethereum/contract/0x36F379400DE6c6BCDF4408B282F8b685c56adc60";
    group('NftsEndpoint test endpoint path creation', () {
      var sut = NftsEndpoint(HttpRequestServiceMock(
          statusCode: 200, body: NftInfoMockData.validResponseBody));

      test('with parameters', () async {
        await sut.getContractInfo(
            assetPlatformId: 'ethereum',
            contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60');
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });
    });

    group('NftsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200, body: NftInfoMockData.validResponseBody));
        var result = await sut!.getContractInfo(
            assetPlatformId: 'ethereum',
            contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60');

        expect(result.id, "meebits");
        expect(result.contractAddress,
            "0x7Bd29408f11D2bFC23c34f18275bBf23bB716Bc7");
        expect(result.assetPlatformId, "ethereum");
        expect(result.name, "Meebits");
        expect(result.symbol, "⚇");
        expect(result.image.runtimeType, Image);
        expect(result.image!.small,
            "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788");
        expect(result.image!.thumb, null);
        expect(result.image!.large, null);
        expect(result.description,
            "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.");
        expect(result.nativeCurrency, "ethereum");
        expect(result.floorPrice!["native_currency"], 2.48);
        expect(result.floorPrice!["usd"], 4710.04);
        expect(result.marketCap!["native_currency"], 49576);
        expect(result.marketCap!["usd"], 94196187);
        expect(result.volume24h!["native_currency"], 185.93);
        expect(result.volume24h!["usd"], 353271);

        expect(result.floorPriceInUsd24hPercentageChange, 2.47633);
        expect(result.numberOfUniqueAddresses, 6558);
        expect(result.numberOfUniqueAddresses24hPercentageChange, -0.07618);
        expect(result.totalSupply, 19999);
        expect(result.links!["homepage"], "https://meebits.larvalabs.com/");
        expect(result.links!["twitter"], "https://twitter.com/larvalabs");
        expect(result.links!["discord"], "");
      });

      test('should still return a result for incomplete data format', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftInfoMockData.responseBodyWithIncompleteKeys));
        var result = await sut!.getContractInfo(
            assetPlatformId: 'ethereum',
            contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60');

        expect(result.id, "meebits");
        expect(result.contractAddress, null);
        expect(result.assetPlatformId, null);
        expect(result.name, "Meebits");
        expect(result.symbol, "⚇");
        expect(result.image.runtimeType, Image);
        expect(result.image!.small,
            "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788");
        expect(result.image!.thumb, null);
        expect(result.image!.large, null);
        expect(result.description,
            "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.");
        expect(result.nativeCurrency, "ethereum");
        expect(result.floorPrice!["native_currency"], 2.48);
        expect(result.floorPrice!["usd"], null);
        expect(result.marketCap!["native_currency"], 49576);
        expect(result.marketCap!["usd"], null);
        expect(result.volume24h!["native_currency"], 185.93);
        expect(result.volume24h!["usd"], null);

        expect(result.floorPriceInUsd24hPercentageChange, null);
        expect(result.numberOfUniqueAddresses, null);
        expect(result.numberOfUniqueAddresses24hPercentageChange, -0.07618);
        expect(result.totalSupply, 19999);
        expect(result.links!["homepage"], "https://meebits.larvalabs.com/");
        expect(result.links!["twitter"], "https://twitter.com/larvalabs");
        expect(result.links!["discord"], null);
      });
    });

    group('NftsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 500, body: NftInfoMockData.validResponseBody));
        await expectLater(
            sut!.getContractInfo(
                assetPlatformId: 'ethereum',
                contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60'),
            throwsA(isA<NetworkRequestException>()));
      });

      test(
          'should return a FormatException when result is error or when parsing failed',
          () async {
        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: '''[{
    "error": "coin not found"
  }]'''));
        await expectLater(
            sut!.getContractInfo(
                assetPlatformId: 'ethereum',
                contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60'),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(
            statusCode: 200,
            body: NftInfoMockData.responseBodyWithInvalidFormat));
        await expectLater(
            sut!.getContractInfo(
                assetPlatformId: 'ethereum',
                contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60'),
            throwsA(isA<DataParsingException>()));

        sut = NftsEndpoint(HttpRequestServiceMock(statusCode: 200, body: ""));
        await expectLater(
            sut!.getContractInfo(
                assetPlatformId: 'ethereum',
                contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60'),
            throwsA(isA<DataParsingException>()));
      });
    });
  });
}
