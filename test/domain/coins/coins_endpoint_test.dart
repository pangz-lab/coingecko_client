import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/coin.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_price_change.dart';
import 'package:coingecko_client/src/domain/coins/models/roi.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/coins_mock_data.dart';

void main() {
  CoinsEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getCoinsList method in', () {
    group('CoinsEndpoint test endpoint path creation', () {
      var sut = CoinsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: CoinListMockData.validResponseBody
        )
      );

      test('without parameters', () async {
        await sut.getCoinsList();
        expect(sut.endpointPath, "$apiVersionPath/coins/list");
      });

      test('with parameters', () async {
        await sut.getCoinsList(includePlatform: true);
        expect(sut.endpointPath, "$apiVersionPath/coins/list?include_platform=true");
        await sut.getCoinsList(includePlatform: false);
        expect(sut.endpointPath, "$apiVersionPath/coins/list?include_platform=false");
      });
    });

    group('CoinsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinListMockData.validResponseBody
          )
        );
        var result = await sut!.getCoinsList();
        expect(result.elementAt(0), isA<Coin>());
        expect(result.elementAt(0).id, '01coin');
        expect(result.elementAt(0).symbol, 'zoc');
        expect(result.elementAt(0).name, '01coin');
        expect(result.elementAt(1).id, '0chain');
        expect(result.elementAt(1).symbol, 'zcn');
        expect(result.elementAt(1).name, 'Zus');

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinListMockData.validResponseBodyWithPlatforms
          )
        );
        result = await sut!.getCoinsList(includePlatform: true);
        expect(result.elementAt(0).platforms!.length, 2);
        expect(result.elementAt(0).platforms!["ethereum"], "0xb9ef770b6a5e12e45983c5d80545258aa38f3b78");
        expect(result.elementAt(0).platforms!["polygon-pos"], "0x8bb30e0e67b11b978a5040144c410e1ccddcba30");

        expect(result.elementAt(1).platforms!.length, 4);
        expect(result.elementAt(1).platforms!["ethereum"], "0xe41d2489571d322189246dafa5ebde1f4699f498");
        expect(result.elementAt(1).platforms!["avalanche"], "0x596fa47043f99a4e0f122243b841e55375cde0d2");
        
      });

      test('should still return a result for incomplete data format', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinListMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getCoinsList(includePlatform: true);
        expect(result.length, 2);
        expect(result.elementAt(0).id, '01coin');
        expect(result.elementAt(0).name, '01coin');
        expect(result.elementAt(0).symbol, null);
        expect(result.elementAt(0).platforms!.length, 2);
        expect(result.elementAt(1).id, '0chain');
        expect(result.elementAt(1).name, 'Zus');
        expect(result.elementAt(1).symbol, 'zcn');
        expect(result.elementAt(1).platforms, {});
      });
    });

    group('CoinsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: CoinListMockData.validResponseBody
          )
        );
        await expectLater(sut!.getCoinsList(), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getCoinsList(), throwsA(isA<DataParsingException>()));

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinListMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getCoinsList(includePlatform: true), throwsA(isA<DataParsingException>()));

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getCoinsList(includePlatform: true), throwsA(isA<DataParsingException>()));
      });
    });
  });


  
  group('getCoinsMarkets method in', () {
    var basePath = "/coins/markets";
    group('CoinsEndpoint test endpoint path creation', () {
      var sut = CoinsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: CoinMarketMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getCoinsMarkets(vsCurrency: Currencies.php);
        expect(sut.endpointPath, "$apiVersionPath$basePath?vs_currency=php");
        await sut.getCoinsMarkets(vsCurrency: Currencies.jpy);
        expect(sut.endpointPath, "$apiVersionPath$basePath?vs_currency=jpy");
      });

      test('with all parameters', () async {
        await sut.getCoinsMarkets(
          vsCurrency: Currencies.php,
          ids: ['btc','vrsc','eth'],
          category: 'nft',
          order: CoinMarketDataOrdering.marketCapDesc,
          perPage: 10,
          page: 1,
          sparkline: true,
          priceChangePercentage: [ 
            CoinPriceChange.in1Hour,
            CoinPriceChange.in7Days,
            CoinPriceChange.in24Hours,
          ],
        );

        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?vs_currency=php&ids=btc,vrsc,eth&category=nft&order=market_cap_desc&per_page=10&page=1&sparkline=true&price_change_percentage=1h,7d,24h"
        );
      });
    });

    group('CoinsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinMarketMockData.validResponseBody
          )
        );
        var result = await sut!.getCoinsMarkets(
          vsCurrency: Currencies.php
        );
        var item1 = result.elementAt(0);
        expect(result.length, 1);
        expect(item1.id, "vechain");
        expect(item1.symbol, "vet");
        expect(item1.name, "VeChain");
        expect(item1.image, "https://assets.coingecko.com/coins/images/1167/large/VeChain-Logo-768x725.png?1547035194");
        expect(item1.currentPrice, 3.02);
        expect(item1.marketCap, 218513465202);
        expect(item1.marketCapRank, 38);
        expect(item1.fullyDilutedValuation, 261309869861);
        expect(item1.totalVolume, 13631729213);
        expect(item1.high24h, 3.15);
        expect(item1.low24h, 2.9);
        expect(item1.priceChange24h, -0.11247230191365132);
        expect(item1.priceChangePercentage24h, -3.59128);
        expect(item1.marketCapChange24h, -9155770360.097015);
        expect(item1.marketCapChangePercentage24h, -4.02152);
        expect(item1.circulatingSupply, 72511146418);
        expect(item1.totalSupply, 85985041177);
        expect(item1.maxSupply, 86712634466);
        expect(item1.ath, 30.55);
        expect(item1.athChangePercentage, -90.11764);
        expect(item1.athDate, DateTime.parse("2021-04-19T01:08:21.675Z"));
        expect(item1.atl, 0.201403);
        expect(item1.atlChangePercentage, 1399.17337);
        expect(item1.atlDate, DateTime.parse("2020-03-13T02:29:59.652Z"));
        expect(item1.roi!.times, 3.6135702295092447);
        expect(item1.roi!.currency, "eth");
        expect(item1.roi!.percentage, 361.3570229509245);
      });

      test('with data with complete parameters in getting the correct response type', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinMarketMockData.validResponseBodyWithCompleteParameter
          )
        );

        var result = await sut!.getCoinsMarkets(
          vsCurrency: Currencies.jpy,
          ids: ['bitcoin','verus-coin'],
          category: 'aave-tokens',
          order: CoinMarketDataOrdering.marketCapDesc,
          perPage: 20,
          page: 1,
          sparkline: true,
          priceChangePercentage: [ 
            CoinPriceChange.in1Hour,
            CoinPriceChange.in24Hours,
            CoinPriceChange.in7Days,
            CoinPriceChange.in14Days,
            CoinPriceChange.in30Days,
            CoinPriceChange.in200Days,
            CoinPriceChange.in1Year,
          ],
        );
        
        var item1 = result.elementAt(0);
        expect(item1.id, "aave-amm-bptbalweth");
        expect(item1.symbol, "aammbptbalweth");
        expect(item1.name, "Aave AMM BptBALWETH");
        expect(item1.image, "https://assets.coingecko.com/coins/images/17261/large/aAmmBptBALWETH.png?1626959531");
        expect(item1.currentPrice, 34006);
        expect(item1.marketCap, 0);
        expect(item1.marketCapRank, null);
        expect(item1.fullyDilutedValuation, null);
        expect(item1.totalVolume, null);
        expect(item1.high24h, 35471);
        expect(item1.low24h, 33335);
        expect(item1.priceChange24h, -1153.9176068902307);
        expect(item1.priceChangePercentage24h, -3.28193);
        expect(item1.marketCapChange24h, 0);
        expect(item1.marketCapChangePercentage24h, 0);
        expect(item1.circulatingSupply, 0);
        expect(item1.totalSupply, 52.6134911192542);
        expect(item1.maxSupply, null);
        expect(item1.ath, 124370);
        expect(item1.athChangePercentage, -72.65746);
        expect(item1.athDate, DateTime.tryParse("2021-09-04T13:07:05.461Z"));
        expect(item1.atl, 18940.5);
        expect(item1.atlChangePercentage, 79.54002);
        expect(item1.atlDate, DateTime.tryParse("2022-06-18T21:00:56.647Z"));
        expect(item1.lastUpdated, DateTime.tryParse("2023-03-23T09:08:01.270Z"));
        expect(item1.priceChangePercentage14dInCurrency, 1.1486264036796594);
        expect(item1.priceChangePercentage1hInCurrency, -0.16307046821360777);
        expect(item1.priceChangePercentage1yInCurrency, -46.416895306779104);
        expect(item1.priceChangePercentage200dInCurrency, -16.957767393408776);
        expect(item1.priceChangePercentage24hInCurrency, -2.9201300645222434);
        expect(item1.priceChangePercentage30dInCurrency, -17.765285429740334);
        expect(item1.priceChangePercentage7dInCurrency, 1.4191558625633633);
        expect(item1.roi!.times, 3.6135702295092447);
        expect(item1.roi!.currency, "eth");
        expect(item1.roi!.percentage, 361.3570229509245);
        expect(item1.roi!.percentage, 361.3570229509245);
        expect(item1.sparklineIn7d!['price']!.length, 4);
        expect(item1.sparklineIn7d!['price']!, [
          249.37679377676122,
          249.28503490939102,
          249.0714321528849,
          249.24412926857016
        ]);
      });

      test('should still return a result for incomplete data format', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinMarketMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getCoinsMarkets(vsCurrency: Currencies.php);
        var item = result.elementAt(0);
        expect(item.currentPrice, 34006);
        expect(item.marketCap, 23.3);
        expect(item.marketCapRank, 23);
        expect(item.fullyDilutedValuation, null);
        expect(item.totalVolume, 233.3);
        expect(item.high24h, 35471);
        expect(item.low24h, 33335);
        expect(item.priceChange24h, -1153.9176068902307);
        expect(item.maxSupply, null);
        expect(item.ath, null);
        expect(item.athChangePercentage, null);
        expect(item.athDate, null);
        expect(item.atl, 18940.5);
        expect(item.atlChangePercentage, 79.54002);
        expect(item.atlDate, DateTime.parse("2022-06-18T21:00:56.647Z"));
        expect(item.sparklineIn7d, {});
        expect(item.roi, isA<Roi>());
      });
    });

    group('CoinsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: CoinMarketMockData.validResponseBody
          )
        );
        await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{
    "error": "coin not found"
  }'''
          )
        );
        await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinMarketMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));
      });
    });
  });


  group('getCoinInfo method in', () {
    var basePath = "/coins/bitcoin";
    group('CoinsEndpoint test endpoint path creation', () {
      var sut = CoinsEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: CoinInfoMockData.validResponseBody
        )
      );

      test('with required parameters', () async {
        await sut.getCoinInfo(id: 'bitcoin');
        expect(sut.endpointPath, "$apiVersionPath$basePath");
      });

      test('with all parameters', () async {
        await sut.getCoinInfo(
          id: 'bitcoin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );

        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?localization=true&tickers=true&community_data=true&developer_data=true&sparkline=true"
        );
      });
    });

    group('CoinsEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinInfoMockData.validResponseBody
          )
        );
        var result = await sut!.getCoinInfo(
          id: 'bitcoin',
          localization: false,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );
        
        expect(result.id, 'bitcoin');
        expect(result.symbol, 'btc');
        expect(result.name, 'Bitcoin');
        expect(result.assetPlatformId, null);
        expect(result.platforms![''], '');
        expect(result.detailPlatforms![''], <String, dynamic>{'decimal_place': null, 'contract_address': ''});
        expect(result.blockTimeInMinutes, 10);
        expect(result.hashingAlgorithm, "SHA-256");
        expect(result.categories, [ "Cryptocurrency", "Layer 1 (L1)" ]);
        expect(result.publicNotice, null);
        expect(result.additionalNotices, []);
        expect(result.description!['en'], "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.");
        expect(result.links!.homepage!.elementAt(1), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.blockchainSite!.elementAt(3), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.officialForumUrl!.elementAt(2), "");
        expect(result.links!.chatUrl!.elementAt(0), "");
        expect(result.links!.announcementUrl!.elementAt(1), "");
        expect(result.links!.twitterScreenName, "bitcoin");
        expect(result.links!.facebookUsername, "bitcoins");
        expect(result.links!.bitcointalkThreadIdentifier, null);
        expect(result.links!.telegramChannelIdentifier, "");
        expect(result.links!.subredditUrl, "https://www.reddit.com/r/Bitcoin/");
        expect(List<String>.from(result.links!.reposUrl!['github']!).elementAt(2), "https://github.com/bitcoin/bips");
        expect(List<String>.from(result.links!.reposUrl!['bitbucket']!).isEmpty, true);
        expect(result.image, <String, dynamic>{
          "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
          "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
          "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
        });
        expect(result.countryOrigin, "");
        expect(result.genesisDate, DateTime.parse("2009-01-03"));
        expect(result.sentimentVotesUpPercentage, 82.84);
        expect(result.sentimentVotesDownPercentage, 17.16);
        expect(result.marketCapRank, 1);
        expect(result.coingeckoRank, 1);
        expect(result.coingeckoScore, 83.151);
        expect(result.developerScore, 99.241);
        expect(result.communityScore, 83.341);
        expect(result.liquidityScore, 100.011);
        expect(result.publicInterestScore, 0.073);
        expect(result.publicInterestStats, <String, dynamic>{
          "alexa_rank": 9440,
          "bing_matches": null
        });
        expect(result.statusUpdates!.length, 0);
        expect(result.lastUpdated!, DateTime.parse("2023-03-24T13:55:13.610Z"));
      });

      test('with data with complete parameters in getting the correct response type', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinInfoMockData.validResponseBodyWithCompleteParameter
          )
        );
        var result = await sut!.getCoinInfo(
          id: 'bitcoin',
          localization: true,
          tickers: true,
          communityData: true,
          developerData: true,
          sparkline: true
        );

        expect(result.id, 'bitcoin');
        expect(result.symbol, 'btc');
        expect(result.name, 'Bitcoin');
        expect(result.assetPlatformId, null);
        expect(result.platforms![''], '');
        expect(result.detailPlatforms![''], <String, dynamic>{'decimal_place': null, 'contract_address': ''});
        expect(result.blockTimeInMinutes, 10);
        expect(result.hashingAlgorithm, "SHA-256");
        expect(result.categories, [ "Cryptocurrency", "Layer 1 (L1)" ]);
        expect(result.publicNotice, null);
        expect(result.additionalNotices, []);
        // expect(result.description!['en'], "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.");
        expect(result.links!.homepage!.elementAt(1), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.blockchainSite!.elementAt(3), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.officialForumUrl!.elementAt(2), "");
        expect(result.links!.chatUrl!.elementAt(0), "");
        expect(result.links!.announcementUrl!.elementAt(1), "");
        expect(result.links!.twitterScreenName, "bitcoin");
        expect(result.links!.facebookUsername, "bitcoins");
        expect(result.links!.bitcointalkThreadIdentifier, null);
        expect(result.links!.telegramChannelIdentifier, "");
        expect(result.links!.subredditUrl, "https://www.reddit.com/r/Bitcoin/");
        expect(List<String>.from(result.links!.reposUrl!['github']!).elementAt(2), "https://github.com/bitcoin/bips");
        expect(List<String>.from(result.links!.reposUrl!['bitbucket']!).isEmpty, true);
        expect(result.image, <String, dynamic>{
          "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
          "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
          "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
        });
        expect(result.countryOrigin, "");
        expect(result.genesisDate, DateTime.parse("2009-01-03"));
        expect(result.sentimentVotesUpPercentage, 82.84);
        expect(result.sentimentVotesDownPercentage, 17.16);
        expect(result.marketCapRank, 1);
        expect(result.coingeckoRank, 1);
        expect(result.coingeckoScore, 83.151);
        expect(result.developerScore, 99.241);
        expect(result.communityScore, 83.341);
        expect(result.liquidityScore, 100.011);
        expect(result.publicInterestScore, 0.073);
        expect(result.publicInterestStats, <String, dynamic>{
          "alexa_rank": 9440,
          "bing_matches": null
        });
        expect(result.statusUpdates!.length, 0);
        expect(result.lastUpdated!, DateTime.parse("2023-03-24T13:55:13.610Z"));
      });

  //     test('should still return a result for incomplete data format', () async {
  //       sut = CoinsEndpoint(
  //         HttpRequestServiceMock(
  //           statusCode : 200,
  //           body: CoinMarketMockData.responseBodyWithIncompleteKeys
  //         )
  //       );
  //       var result = await sut!.getCoinsMarkets(vsCurrency: Currencies.php);
  //       var item = result.elementAt(0);
  //       expect(item.currentPrice, 34006);
  //       expect(item.marketCap, 23.3);
  //       expect(item.marketCapRank, 23);
  //       expect(item.fullyDilutedValuation, null);
  //       expect(item.totalVolume, 233.3);
  //       expect(item.high24h, 35471);
  //       expect(item.low24h, 33335);
  //       expect(item.priceChange24h, -1153.9176068902307);
  //       expect(item.maxSupply, null);
  //       expect(item.ath, null);
  //       expect(item.athChangePercentage, null);
  //       expect(item.athDate, null);
  //       expect(item.atl, 18940.5);
  //       expect(item.atlChangePercentage, 79.54002);
  //       expect(item.atlDate, DateTime.parse("2022-06-18T21:00:56.647Z"));
  //       expect(item.sparklineIn7d, {});
  //       expect(item.roi, isA<Roi>());
  //     });
    });

  //   group('CoinsEndpoint test for error handling', () {
  //     test('should throw an exception for failed request', () async {
  //       sut = CoinsEndpoint(
  //         HttpRequestServiceMock(
  //           statusCode : 500,
  //           body: CoinMarketMockData.validResponseBody
  //         )
  //       );
  //       await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<NetworkRequestException>()));
  //     });

  //     test('should return a FormatException when result is error or when parsing failed', () async {
  //       sut = CoinsEndpoint(
  //         HttpRequestServiceMock(
  //           statusCode : 200,
  //           body: '''{
  //   "error": "coin not found"
  // }'''
  //         )
  //       );
  //       await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));

  //       sut = CoinsEndpoint(
  //         HttpRequestServiceMock(
  //           statusCode : 200,
  //           body: CoinMarketMockData.responseBodyWithInvalidFormat
  //         )
  //       );
  //       await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));

  //       sut = CoinsEndpoint(
  //         HttpRequestServiceMock(
  //           statusCode : 200,
  //           body: ""
  //         )
  //       );
  //       await expectLater(sut!.getCoinsMarkets(vsCurrency: Currencies.php), throwsA(isA<DataParsingException>()));
  //     });
  //   });
  });

}
