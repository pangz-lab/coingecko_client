import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/coin.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';
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
        expect(result.elementAt(1).platforms, null);
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
        expect(result.localization!['ru'], "Биткоин");
        expect(result.localization!['ja'], "ビットコイン");
        expect(result.localization!['zh'], "比特币");
        expect(result.localization!['zh-tw'], "比特幣");
        expect(result.localization!['ko'], "비트코인");
        expect(result.localization!['ar'], "بيتكوين");
        expect(result.localization!['th'], "บิตคอยน์");
        expect(result.description!['sl'], "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.");
        expect(result.description!['ko'], "비트코인은 2009년 나카모토 사토시가 만든 디지털 통화로, 통화를 발행하고 관리하는 중앙 장치가 존재하지 않는 구조를 가지고 있다. 대신, 비트코인의 거래는 P2P 기반 분산 데이터베이스에 의해 이루어지며, 공개 키 암호 방식 기반으로 거래를 수행한다. 비트코인은 공개성을 가지고 있다. 비트코인은 지갑 파일의 형태로 저장되며, 이 지갑에는 각각의 고유 주소가 부여되며, 그 주소를 기반으로 비트코인의 거래가 이루어진다. 비트코인은 1998년 웨이따이가 사이버펑크 메일링 리스트에 올린 암호통화란 구상을 최초로 구현한 것 중의 하나이다.\r\n\r\n비트코인은 최초로 구현된 가상화폐입니다. 발행 및 유통을 관리하는 중앙권력이나 중간상인 없이, P2P 네트워크 기술을 이용하여 네트워크에 참여하는 사용자들이 주체적으로 화폐를 발행하고 이체내용을 공동으로 관리합니다. 이를 가능하게 한 블록체인 기술을 처음으로 코인에 도입한 것이 바로 비트코인입니다.\r\n\r\n비트코인을 사용하는 개인과 사업자의 수는 꾸준히 증가하고 있으며, 여기에는 식당, 아파트, 법률사무소, 온라인 서비스를 비롯한 소매상들이 포함됩니다. 비트코인은 새로운 사회 현상이지만 아주 빠르게 성장하고 있습니다. 이를 바탕으로 가치 증대는 물론, 매일 수백만 달러의 비트코인이 교환되고 있습니다. \r\n\r\n비트코인은 가상화폐 시장에서 현재 유통시가총액과 코인의 가치가 가장 크고, 거래량 또한 안정적입니다. 이더리움이 빠르게 추격하고 있지만 아직은 가장 견고한 가상화폐라고 볼 수 있습니다. \r\n\r\n코인 특징\r\n1. 중앙주체 없이 사용자들에 의해 거래내용이 관리될 수 있는 비트코인의 운영 시스템은 블록체인 기술에서 기인합니다. 블록체인은 쉽게 말해 다 같이 장부를 공유하고, 항상 서로의 컴퓨터에 있는 장부 파일을 비교함으로써 같은 내용만 인정하는 방식으로 운영됩니다. 따라서 전통적인 금융기관에서 장부에 대한 접근을 튼튼하게 방어하던 것과는 정반대의 작업을 통해 보안을 달성합니다. 장부를 해킹하려면 51%의 장부를 동시에 조작해야 하는데, 이는 사실상 불가능합니다. 왜냐하면, 이를 실행하기 위해서는 컴퓨팅 파워가 어마어마하게 소요되고, 이것이 가능한 슈퍼컴퓨터는 세상에 존재하지 않기 때문입니다. 또한, 장부의 자료들은 줄글로 기록되는 것이 아니라 암호화 해시 함수형태로 블록에 저장되고, 이 블록들은 서로 연결되어 있어서 더 강력한 보안을 제공합니다. \r\n\r\n2. 비트코인은 블록발행보상을 채굴자에게 지급하는 방식으로 신규 코인을 발행합니다. 블록발행보상은 매 21만 블록(약 4년)을 기준으로 발행량이 절반으로 줄어듭니다. 처음에는 50비트코인씩 발행이 되었고, 4년마다 계속 반으로 감소하고 있습니다. 코인의 총량이 2,100만 개에 도달하면 신규 발행은 종료되고, 이후에는 거래 수수료만을 통해 시스템이 지탱될 것입니다. \r\n\r\n핵심 가치\r\n(키워드: 통화로 사용될 수 있는 보편성 및 편의성)\r\n\r\n1. 다양한 알트코인들의 등장에 앞서 비트코인은 가상화폐 시장에서 독보적이었기 때문에, 현재 가장 보편적인 결제수단으로 사용됩니다. 실생활에서 이를 활용할 수 있는 가맹점이 알트코인들보다 압도적으로 많을 뿐만 아니라, 이 또한 증가하고 있습니다. 일례로 일본 업체들이 비트코인 결제 시스템을 도입하면서 곧 비트코인을 오프라인 점포 26만 곳에서 이용할 수 있게 될 것입니다. \r\n\r\n2. 여러 나라에서 비트코인을 정식 결제 수단으로 인정하면서, 실물화폐와 가상화폐를 거래할 때 더는 부가가치세가 부과되지 않게 된다고 합니다. 실제로 일본과 호주에서는 이미 비트코인을 합법적 결제 수단으로 인정하면서 제도권 안으로 들여오고 있고, 미국에서는 비트코인 ETF 승인 노력도 진행되고 있습니다. 각국에 비트코인을 기반으로 한 ATM 기계도 설치되었다고 합니다. ");
        expect(result.links!.homepage!.elementAt(1), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.blockchainSite!.elementAt(8), "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579");
        expect(result.links!.officialForumUrl!.elementAt(2), "");
        expect(result.links!.chatUrl!.elementAt(2), "");
        expect(result.links!.announcementUrl!.elementAt(1), "");
        expect(result.links!.twitterScreenName, "bitcoin");
        expect(result.links!.facebookUsername, "bitcoins");
        expect(result.links!.bitcointalkThreadIdentifier, null);
        expect(result.links!.telegramChannelIdentifier, "");
        expect(result.links!.subredditUrl, "https://www.reddit.com/r/Bitcoin/");
        expect(List<String>.from(result.links!.reposUrl!['github']!).elementAt(1), "https://github.com/bitcoin/bips");
        expect(List<String>.from(result.links!.reposUrl!['bitbucket']!).isEmpty, true);
        expect(result.image, <String, dynamic>{
          "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
          "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
          "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
        });
        expect(result.countryOrigin, "");
        expect(result.genesisDate, DateTime.parse("2009-01-03"));
        expect(result.sentimentVotesUpPercentage, 79.42);
        expect(result.sentimentVotesDownPercentage, 20.58);
        expect(result.marketCapRank, 1);
        expect(result.coingeckoRank, 1);
        expect(result.coingeckoScore, 83.151);
        expect(result.developerScore, 99.241);
        expect(result.communityScore, 83.341);
        expect(result.liquidityScore, 100.011);
        expect(result.publicInterestScore, 0.073);
        expect(result.marketData!.currentPrice, {
          "aed": 101948,
          "link": 3820,
          "sats": 99954976
        });
        expect(result.marketData!.totalValueLocked, null);
        expect(result.marketData!.mcapToTvlRatio, null);
        expect(result.marketData!.fdvToTvlRatio, null);
        expect(result.marketData!.roi, null);
        expect(result.marketData!.ath, {
          "aed": 253608,
          "ars": 6913791,
          "aud": 93482,
          "link": 74906,
          "sats": 105823579
        });
        expect(result.marketData!.athChangePercentage, {
          "aed": -59.80036,
          "ars": -17.58205,
          "link": -94.89451,
          "sats": -5.53046
        });
        expect(result.marketData!.athDate, {
          "aed": "2021-11-10T14:24:11.849Z",
          "ars": "2021-11-10T14:24:11.849Z",
          "aud": "2021-11-10T14:24:11.849Z",
          "sats": "2021-05-19T16:00:11.072Z"
        });
        expect(result.marketData!.atl, {
          "aed": 632.31,
          "ars": 1478.98,
          "aud": 72.61,
          "bch": 3.513889,
          "link": 598.477,
          "sats": 95099268
        });
        expect(result.marketData!.atlChangePercentage, {
          "aed": 16023.26026,
          "ars": 385180.1279,
          "sats": 5.12284
        });
        expect(result.marketData!.atlDate, {
          "aed": "2015-01-14T00:00:00.000Z",
          "ars": "2015-01-14T00:00:00.000Z",
          "aud": "2013-07-05T00:00:00.000Z",
          "sats": "2021-05-19T13:14:13.071Z"
        });
        expect(result.marketData!.marketCap, {
          "aed": 1970450379979,
          "ars": 110133107915714,
          "yfi": 63724224,
          "zar": 9749354182286,
          "bits": 19321723174292,
          "link": 73912121864,
          "sats": 1932172317429155
        });
        expect(result.marketData!.marketCapRank, 1);
        expect(result.marketData!.fullyDilutedValuation,  {
          "aed": -0.2140964212242,
          "ars": 1.3527194715,
          "aud": 876405985438,
          "sats": null
        });
        expect(result.marketData!.totalVolume, {
          "aed": 77994537033,
          "ars": 4359298184417,
          "sats": 76469824499968
        });
        expect(result.marketData!.high24h, {
          "aed": null,
          "ars": 5853.397,
          "zar": 0,
          "bits": -10.07623,
          "link": 3848,
          "sats": 100762326
        });
        expect(result.marketData!.low24h, {
          "aed": 99926,
          "ars": null,
          "bits": 99.6387,
          "link": 0,
          "sats": -99.638749
        });
        expect(result.marketData!.priceChange24h, -595.8179206881);
        expect(result.marketData!.priceChangePercentage7d, 1.06962);
        expect(result.marketData!.priceChangePercentage14d, 37.46052);
        expect(result.marketData!.priceChangePercentage30d, 14.96873);
        expect(result.marketData!.priceChangePercentage60d, null);
        expect(result.marketData!.priceChangePercentage200d, 4030547);
        expect(result.marketData!.priceChangePercentage1y, -36.81627);
        expect(result.marketData!.marketCapChange24h, -12023865909.323);
        expect(result.marketData!.marketCapChangePercentage24h, -2.19182);
        expect(result.marketData!.priceChange24hInCurrency, {
          "aed": -2188.090669203142,
          "ars": -136378.84121314343,
          "aud": -782.5840326772086,
          "zar": -9418.30084696709,
          "bits": -123.82997696346138,
          "link": 77.405,
          "sats": -12382.997696354985
        });
        expect(result.marketData!.priceChangePercentage1hInCurrency, {
          "aed": 0.55875,
          "ars": 0.55875,
          "link": 0.09927,
          "sats": 0.04844
        });
        expect(result.marketData!.priceChangePercentage24hInCurrency, {
          "aed": -2.10118,
          "ars": -2.33746,
          "link": 2.06835,
          "sats": -0.01239
        });
        expect(result.marketData!.priceChangePercentage7dInCurrency, {
          "aed": 1.06219,
          "ars": 3.00866,
          "zar": -0.48955,
          "bits": -0.10797,
          "link": 0.63096,
          "sats": -0.10797
        });
        expect(result.marketData!.priceChangePercentage14dInCurrency, {
          "aed": 37.45172,
          "ars": 40.50144,
          "btc": 0,
          "link": 17.87076,
          "sats": -0.01568
        });
        expect(result.marketData!.priceChangePercentage30dInCurrency, {
          "aed": 14.95167,
          "dose": 12,
          "bits": -0.03675,
          "link": 21.91687,
          "sats": -0.03675
        });
        expect(result.marketData!.priceChangePercentage60dInCurrency, {
          "aed": 20.75754,
          "zar": 27.69664,
          "bits": -0.0305,
          "link": 16.99998,
          "sats": -0.0305
        });
        expect(result.marketData!.priceChangePercentage200dInCurrency, {
          "aed": 40.2793,
          "ars": 105.47193,
          "btc": 0,
          "bits": -0.06327,
          "link": 42.25333,
          "sats": -0.06327
        });
        expect(result.marketData!.priceChangePercentage1yInCurrency, {
          "aed": -36.82805,
          "ars": 17.22559,
          "bits": -0.04898,
          "link": 40.41278,
          "sats": -0.04898
        });
        expect(result.marketData!.marketCapChange24hInCurrency, {
          "aed": -44156625523.37695,
          "xau": -4271558.42310524,
          "xdr": -8170649612.247314,
          "xlm": 54566984649,
          "xrp": -5540005965.124756,
          "yfi": 759229,
          "zar": -192177860698.37695,
          "bits": 1170187014,
          "link": 1715762038,
          "sats": 117018701377
        });
        expect(result.marketData!.marketCapChangePercentage24hInCurrency, {
          "aed": -2.19182,
          "ars": -2.43646,
          "aud": -1.94076,
          "bch": 0.22006,
          "link": 2.37652,
          "sats": 0.00606
        });
        expect(result.marketData!.totalSupply, 21000000);
        expect(result.marketData!.maxSupply, 21000000);
        expect(result.marketData!.circulatingSupply, 19327487);
        expect(result.marketData!.sparkline7d, {
          "price": [
            27454.092345483394,
            27710.295055502036,
            27494.337717553793,
            27487.11350938197
          ]
        });
        expect(result.marketData!.lastUpdated, DateTime.parse("2023-03-25T02:43:27.743Z"));
        expect(result.communitydata, {
          "facebook_likes": null,
          "twitter_followers": 5737981,
          "reddit_average_posts_48h": 0,
          "reddit_average_comments_48h": 0,
          "reddit_subscribers": 0,
          "reddit_accounts_active_48h": 0,
          "telegram_channel_user_count": null
        });
        expect(result.developerdata, {
          "forks": 33976,
          "stars": 68739,
          "subscribers": 3923,
          "total_issues": 7355,
          "closed_issues": 6986,
          "pull_requests_merged": 10548,
          "pull_request_contributors": 822,
          "code_additions_deletions_4_weeks": {
            "additions": 45744,
            "deletions": -11465
          },
          "commit_count_4_weeks": 210,
          "last_4_weeks_commit_activity_series": [
            0,
            7
          ]
        });

        expect(result.publicInterestStats, {
          "alexa_rank": 9440,
          "bing_matches": null
        });
        expect(result.statusUpdates!.length, 0);
        expect(result.lastUpdated!, DateTime.parse("2023-03-25T02:43:27.743Z"));
        expect(result.tickers!.length, 2);
        expect(result.tickers!.elementAt(0).base, "BTC");
        expect(result.tickers!.elementAt(0).target, "USDT");
        expect(result.tickers!.elementAt(0).market, {
          "name": "Binance",
          "identifier": "binance",
          "has_trading_incentive": false
        });
        expect(result.tickers!.elementAt(0).last, 27642.71);
        expect(result.tickers!.elementAt(0).volume, 85401.59418823966);
        expect(result.tickers!.elementAt(0).convertedLast, {
          "btc": 1.000116,
          "eth": 15.682484,
          "usd": 27790
        });
        expect(result.tickers!.elementAt(0).convertedVolume, {
          "btc": 85412,
          "eth": 1339309,
          "usd": 2373320029
        });
        expect(result.tickers!.elementAt(0).trustScore, "green");
        expect(result.tickers!.elementAt(0).bidAskSpreadPercentage, 0.010036);
        expect(result.tickers!.elementAt(0).timestamp, DateTime.parse("2023-03-25T02:30:36+00:00"));
        expect(result.tickers!.elementAt(0).lastTradedAt, DateTime.parse("2023-03-25T02:30:36+00:00"));
        expect(result.tickers!.elementAt(0).lastFetchAt,DateTime.parse("2023-03-25T02:30:36+00:00"));
        expect(result.tickers!.elementAt(0).isAnomaly, false);
        expect(result.tickers!.elementAt(0).isStale, false);
        expect(result.tickers!.elementAt(0).tradeUrl, "https://www.binance.com/en/trade/BTC_USDT?ref=37754157");
        expect(result.tickers!.elementAt(0).tokenInfoUrl, null);
        expect(result.tickers!.elementAt(0).coinId, "bitcoin");
        expect(result.tickers!.elementAt(0).targetCoinId, "tether");
        
      });

      test('should still return a result for incomplete data format', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinInfoMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getCoinInfo(id: 'bitcoin');
        expect(result.id, 'bitcoin');
        expect(result.platforms, {
          "": ""
        });
        expect(result.lastUpdated, null);
      });

      test('should still return a result for error response', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''{"error": "coin not found"}'''
          )
        );
        expect(await sut!.getCoinInfo(id: 'verus-coin'), isA<CoinInfo>());
      });
    });

    group('CoinsEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: CoinInfoMockData.validResponseBody
          )
        );
        await expectLater(sut!.getCoinInfo(id: 'verus-coin'), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: CoinInfoMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getCoinInfo(id: 'verus-coin'), throwsA(isA<DataParsingException>()));

        sut = CoinsEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(sut!.getCoinInfo(id: 'verus-coin'), throwsA(isA<DataParsingException>()));
      });
    });
  });

}
