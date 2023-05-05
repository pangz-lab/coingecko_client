import 'package:coingecko_client/src/domain/contract/contract_endpoint.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/models/historical_data.dart';
import 'package:test/test.dart';

import '../../services/http_request_service_mock.dart';
import 'mock/contract_mock_data.dart';

void main() {
  ContractEndpoint? sut;
  final String apiVersionPath = "/api/v3";

  group('getInfo method in', () {
    var basePath = "/coins/ethereum/contract/0x1f9840a85d5af5bf1d1762f925bdaddc4201f984";
    group('ContractEndpoint test endpoint path creation', () {
      var sut = ContractEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: ContractInfoMockData.validResponseBody
        )
      );

      test('with parameters', () async {
        await sut.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath"
        );
      });
    });

    group('ContractEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractInfoMockData.validResponseBody
          )
        );

        var result = await sut!.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        );

        expect(result.id, 'uniswap');
        expect(result.symbol, 'uni');
        expect(result.name, 'Uniswap');
        expect(result.assetPlatformId, "ethereum");
        expect(result.platforms, {
          "ethereum": "0x1f9840a85d5af5bf1d1762f925bdaddc4201f984",
          "near-protocol": "1f9840a85d5af5bf1d1762f925bdaddc4201f984.factory.bridge.near",
          "xdai": "0x4537e328bf7e4efa29d05caea260d7fe26af9d74",
          "binance-smart-chain": "0xbf5140a22578168fd562dccf235e5d43a02ce9b1",
          "polygon-pos": "0xb33eaad8d922b1083446dc23f610c2567fb5180f",
          "huobi-token": "0x22c54ce8321a4015740ee1109d9cbc25815c46e6",
          "avalanche": "0x8ebaf22b6f053dffeaf46f4dd9efa95d89ba8580",
          "harmony-shard-0": "0x90d81749da8867962c760414c1c25ec926e889b6",
          "optimistic-ethereum": "0x6fd9d7ad17242c41f7131d257212c54a0e816691",
          "arbitrum-one": "0xfa7f8980b0f1e64a2062791cc3b0871572f1f7f0",
          "sora": "0x009be848df92a400da2f217256c88d1a9b1a0304f9b3e90991a67418e1d3b08c",
          "energi": "0x665b3a802979ec24e076c80025bff33c18eb6007"
        });
        expect(result.detailPlatforms, {
          "ethereum": {
            "decimal_place": 18,
            "contract_address": "0x1f9840a85d5af5bf1d1762f925bdaddc4201f984"
          },
          "near-protocol": {
            "decimal_place": 18,
            "contract_address": "1f9840a85d5af5bf1d1762f925bdaddc4201f984.factory.bridge.near"
          },
          "xdai": {
            "decimal_place": 18,
            "contract_address": "0x4537e328bf7e4efa29d05caea260d7fe26af9d74"
          }
        });
        expect(result.blockTimeInMinutes, 0);
        expect(result.hashingAlgorithm, null);
        expect(result.categories, [
          "Decentralized Exchange (DEX)",
          "BNB Chain Ecosystem",
          "Automated Market Maker (AMM)",
          "Yield Farming",
          "Decentralized Finance (DeFi)"
        ]);
        expect(result.publicNotice, null);
        expect(result.additionalNotices, []);
        expect(result.localization!['ru'], "Биткоин");
        expect(result.localization!['ja'], "ビットコイン");
        expect(result.localization!['zh'], "比特币");
        expect(result.localization!['zh-tw'], "比特幣");
        expect(result.localization!['ko'], "비트코인");
        expect(result.localization!['ar'], "بيتكوين");
        expect(result.localization!['th'], "บิตคอยน์");
        expect(result.description!['en'], "UNI is the governance token for Uniswap, an Automated Market Marker DEX on the Ethereum blockchain. The UNI token allows token holders to participate in the governance of the protocol. Key decisions such as usage of the treasury or future upgrades can be decided through a governance vote.");
        
        expect(result.links!.homepage!.elementAt(0), "https://uniswap.org/");
        expect(result.links!.blockchainSite!.elementAt(2), "https://blockscout.com/poa/xdai/tokens/0x4537e328Bf7e4eFA29D05CAeA260D7fE26af9D74/token-transfers");
        expect(result.links!.officialForumUrl!.elementAt(1), "test");
        expect(result.links!.chatUrl!.elementAt(0), "https://discord.gg/FCfyBSbCU5");
        expect(result.links!.announcementUrl!.elementAt(1), "https://uniswap.org/blog/");
        expect(result.links!.twitterScreenName, "Uniswap");
        expect(result.links!.facebookUsername, "Uniswap");
        expect(result.links!.bitcointalkThreadIdentifier, null);
        expect(result.links!.telegramChannelIdentifier, "");
        expect(result.links!.subredditUrl, "https://www.reddit.com/r/Uniswap");
        expect(List<String>.from(result.links!.reposUrl!['github']!), []);
        expect(List<String>.from(result.links!.reposUrl!['bitbucket']!), []);
        expect(result.image!.thumb, "https://assets.coingecko.com/coins/images/12504/thumb/uniswap-uni.png?1600306604");
        expect(result.image!.small, "https://assets.coingecko.com/coins/images/12504/small/uniswap-uni.png?1600306604");
        expect(result.image!.large, "https://assets.coingecko.com/coins/images/12504/large/uniswap-uni.png?1600306604");
        
        expect(result.countryOrigin, "");
        expect(result.genesisDate, null);
        expect(result.contractAddress,"0x1f9840a85d5af5bf1d1762f925bdaddc4201f984");
        expect(result.sentimentVotesUpPercentage, 77.78);
        expect(result.sentimentVotesDownPercentage, 22.22);
        expect(result.watchlistPortfolioUsers, 206823);
        expect(result.marketCapRank, 20);
        expect(result.coingeckoRank, 180);
        expect(result.coingeckoScore, 38.475);
        expect(result.developerScore, 0);
        expect(result.communityScore, 45.73);
        expect(result.liquidityScore, 58.657);
        expect(result.publicInterestScore, 0.21);
        expect(result.marketData!.currentPrice, {
          "aed": 19.5,
          "ars": 1198.63,
          "aud": 7.89,
          "bch": 0.04482259,
          "bdt": 567.33
        });
        expect(result.marketData!.totalValueLocked, {
          "btc": 236155,
          "usd": 4534644444
        });
        expect(result.marketData!.mcapToTvlRatio, 0.88);
        expect(result.marketData!.fdvToTvlRatio, 1.17);
        expect(result.marketData!.roi, null);
        expect(result.marketData!.ath, {
          "aed": 164.98,
          "ars": 4220.98,
          "aud": 58.23,
          "bch": 0.06950615,
          "bdt": 3820.99,
          "bhd": 17,
          "bmd": 44.92
        });
        expect(result.marketData!.athChangePercentage, {
          "aed": -88.18142,
          "ars": -71.61401,
          "aud": -86.46532,
          "bch": -35.47014,
          "bdt": -85.15678
        });
        expect(result.marketData!.athDate, {
          "aed": "2021-05-03T05:25:04.822Z",
          "ars": "2021-05-03T05:25:04.822Z",
          "aud": "2021-05-03T05:25:04.822Z",
          "bch": "2022-07-16T16:16:28.820Z",
          "bdt": "2021-05-03T05:25:04.822Z",
          "bhd": "2021-05-03T05:25:04.822Z",
          "bmd": "2021-05-03T05:25:04.822Z"
        });
        expect(result.marketData!.atl, {
          "aed": 3.78,
          "ars": 77.44,
          "aud": 1.41,
          "bch": 0.00433785
        });
        expect(result.marketData!.atlChangePercentage, {
          "aed": 415.29126,
          "ars": 1447.27602,
          "aud": 457.05,
          "bch": 933.97374
        });
        expect(result.marketData!.atlDate, {
          "aed": "2020-09-17T01:20:38.214Z",
          "ars": "2020-09-17T01:20:38.214Z",
          "aud": "2020-09-17T01:20:38.214Z",
          "bch": "2020-09-17T01:20:38.214Z"
        });
        expect(result.marketData!.marketCap, {
          "aed": 14714806228,
          "ars": 904240489544,
          "aud": 5949046622,
          "bch": 33823211
        });
        expect(result.marketData!.marketCapRank, 20);
        expect(result.marketData!.fullyDilutedValuation, {
          "aed": 19521699317,
          "ars": 1199629181193,
          "aud": 7892424649
        });
        expect(result.marketData!.totalVolume, {
          "aed": 222865338,
          "ars": 13696302123,
          "aud": 90102131,
          "bch": 512169,
          "bdt": 6482670659
        });
        expect(result.marketData!.high24h, {
          "aed": 19.73,
          "ars": 1209.94,
          "aud": 8.05,
          "bch": 0.04523859,
          "bdt": 570.04
        });
        expect(result.marketData!.low24h, {
          "aed": 19.16,
          "ars": 1177.18,
          "aud": 7.79,
          "bch": 0.04449001,
          "bdt": 555.32,
          "bhd": 1.97
        });
        expect(result.marketData!.priceChange24h, -0.02441078966284);
        expect(result.marketData!.priceChangePercentage24h, -0.45752);
        expect(result.marketData!.priceChangePercentage7d, -4.4945);
        expect(result.marketData!.priceChangePercentage14d, -8.13586);
        expect(result.marketData!.priceChangePercentage30d, -13.74075);
        expect(result.marketData!.priceChangePercentage60d, -16.38288);
        expect(result.marketData!.priceChangePercentage200d, -12.98975);
        expect(result.marketData!.priceChangePercentage1y, -33.34219);
        expect(result.marketData!.marketCapChange24h, -17737405.30449);
        expect(result.marketData!.marketCapChangePercentage24h, -0.44072);
        expect(result.marketData!.priceChange24hInCurrency, {
          "aed": -0.08964618395782864,
          "ars": -2.81967344676832,
          "aud": -0.08763898234947565,
          "bch": 0.00005719,
          "bdt": 1.27
        });
        expect(result.marketData!.priceChangePercentage1hInCurrency, {
          "aed": 0.06261,
          "ars": 0.07029,
          "aud": 0.06848,
          "bch": -0.06498,
          "bdt": 0.06261
        });
        expect(result.marketData!.priceChangePercentage24hInCurrency, {
          "aed": -0.45752,
          "ars": -0.23469,
          "aud": -1.0992,
          "bch": 0.12776,
          "bdt": 0.22455
        });
        expect(result.marketData!.priceChangePercentage7dInCurrency, {
          "aed": -4.4945,
          "ars": -2.91132,
          "aud": -5.97157,
          "bch": -5.56159,
          "bdt": -3.88581
        });
        expect(result.marketData!.priceChangePercentage14dInCurrency, {
          "aed": -8.13123,
          "ars": -4.88915,
          "aud": -8.01126,
          "bch": -4.62239,
          "bdt": -7.5576
        });
        expect(result.marketData!.priceChangePercentage30dInCurrency, {
          "aed": -13.74463,
          "ars": -7.63884,
          "aud": -13.43214,
          "bch": -7.51343,
          "bdt": -12.79822
        });
        expect(result.marketData!.priceChangePercentage60dInCurrency, {
          "aed": -16.39488,
          "ars": -4.87603,
          "aud": -16.11054,
          "bch": -12.46389,
          "bdt": -16.54352
        });
        expect(result.marketData!.priceChangePercentage200dInCurrency, {
          "aed": -13.00456,
          "ars": 29.55696,
          "aud": -19.63548,
          "bch": -19.01904,
          "bdt": -9.00659
        });
        expect(result.marketData!.priceChangePercentage1yInCurrency, {
          "aed": -33.35489,
          "ars": 29.66637,
          "aud": -28.17663,
          "bch": 68.70359,
          "bdt": -17.9062
        });
        expect(result.marketData!.marketCapChange24hInCurrency, {
          "aed": -64736387.13036537,
          "ars": -2060236846.0405273,
          "aud": -64427823.38070583,
          "bch": 57323,
          "bdt": 1031016083
        });
        expect(result.marketData!.marketCapChangePercentage24hInCurrency, {
          "aed": -0.43801,
          "ars": -0.22732,
          "aud": -1.07139,
          "bch": 0.16977,
          "bdt": 0.24146
        });
        expect(result.marketData!.totalSupply, 1000000000);
        expect(result.marketData!.maxSupply, 1000000000);
        expect(result.marketData!.circulatingSupply, 753766667);
        expect(result.marketData!.sparkline7d, null);
        expect(result.marketData!.lastUpdated, DateTime.parse("2023-05-05T04:56:28.825Z"));
        expect(result.communitydata, {
          "facebook_likes": null,
          "twitter_followers": 1020856,
          "reddit_average_posts_48h": 0,
          "reddit_average_comments_48h": 0,
          "reddit_subscribers": 0,
          "reddit_accounts_active_48h": 0,
          "telegram_channel_user_count": null
        });
        expect(result.developerdata, {
          "forks": 0,
          "stars": 0,
          "subscribers": 0,
          "total_issues": 0,
          "closed_issues": 0,
          "pull_requests_merged": 0,
          "pull_request_contributors": 0,
          "code_additions_deletions_4_weeks": {
            "additions": null,
            "deletions": null
          },
          "commit_count_4_weeks": 0,
          "last_4_weeks_commit_activity_series": []
        });

        expect(result.publicInterestStats, {
          "alexa_rank": 3614,
          "bing_matches": null
        });
        expect(result.statusUpdates, []);
        expect(result.lastUpdated!, DateTime.parse("2023-05-05T04:56:28.825Z"));
        expect(result.tickers!.length, 2);
        expect(result.tickers!.elementAt(0).base, "UNI");
        expect(result.tickers!.elementAt(0).target, "USDT");
        expect(result.tickers!.elementAt(0).market, {
          "name": "Gate.io",
          "identifier": "gate",
          "has_trading_incentive": false
        });
        expect(result.tickers!.elementAt(0).last, 5.3208);
        expect(result.tickers!.elementAt(0).volume, 71789.465284104);
        expect(result.tickers!.elementAt(0).convertedLast, {
          "btc": 0.00018183,
          "eth": 0.0028022,
          "usd": 5.32
        });
        expect(result.tickers!.elementAt(0).convertedVolume, {
          "btc": 12.989212,
          "eth": 200.173,
          "usd": 380256
        });
        var firstTicker = result.tickers!.elementAt(0);
        expect(firstTicker.trustScore, "green");
        expect(firstTicker.bidAskSpreadPercentage, 0.063911);
        expect(firstTicker.timestamp, DateTime.parse("2023-05-05T04:52:02+00:00"));
        expect(firstTicker.lastTradedAt, DateTime.parse("2023-05-05T04:52:02+00:00"));
        expect(firstTicker.lastFetchAt, DateTime.parse("2023-05-05T04:52:02+00:00"));
        expect(firstTicker.isAnomaly, false);
        expect(firstTicker.isStale, false);
        expect(firstTicker.tradeUrl, "https://gate.io/trade/UNI_USDT");
        expect(firstTicker.tokenInfoUrl, null);
        expect(firstTicker.coinId, "uniswap");
        expect(firstTicker.targetCoinId, "tether");
      });

      test('should still return a result for incomplete data format', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractInfoMockData.responseBodyWithIncompleteKeys
          )
        );

        var result = await sut!.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        );

        expect(result.id, 'uniswap');
        expect(result.symbol, 'uni');
        expect(result.name, 'Uniswap');
        expect(result.assetPlatformId, "ethereum");
        expect(result.platforms, {
          "ethereum": "0x1f9840a85d5af5bf1d1762f925bdaddc4201f984",
          "near-protocol": "1f9840a85d5af5bf1d1762f925bdaddc4201f984.factory.bridge.near",
          "xdai": "0x4537e328bf7e4efa29d05caea260d7fe26af9d74",
          "binance-smart-chain": "0xbf5140a22578168fd562dccf235e5d43a02ce9b1",
          "polygon-pos": "0xb33eaad8d922b1083446dc23f610c2567fb5180f",
          "huobi-token": "0x22c54ce8321a4015740ee1109d9cbc25815c46e6",
          "avalanche": "0x8ebaf22b6f053dffeaf46f4dd9efa95d89ba8580",
          "harmony-shard-0": "0x90d81749da8867962c760414c1c25ec926e889b6",
          "optimistic-ethereum": "0x6fd9d7ad17242c41f7131d257212c54a0e816691",
          "arbitrum-one": "0xfa7f8980b0f1e64a2062791cc3b0871572f1f7f0",
          "sora": "0x009be848df92a400da2f217256c88d1a9b1a0304f9b3e90991a67418e1d3b08c",
          "energi": "0x665b3a802979ec24e076c80025bff33c18eb6007"
        });
        expect(result.detailPlatforms, {
          "ethereum": {
            "decimal_place": 18,
            "contract_address": "0x1f9840a85d5af5bf1d1762f925bdaddc4201f984"
          },
          "near-protocol": {
            "decimal_place": 18,
            "contract_address": "1f9840a85d5af5bf1d1762f925bdaddc4201f984.factory.bridge.near"
          },
          "xdai": {
            "decimal_place": 18,
            "contract_address": "0x4537e328bf7e4efa29d05caea260d7fe26af9d74"
          }
        });
        expect(result.blockTimeInMinutes, 0);
        expect(result.hashingAlgorithm, null);
        expect(result.categories, null);
        expect(result.publicNotice, null);
        expect(result.localization, null);
        expect(result.description, null);
        expect(result.links, null);
        expect(result.image, null);
        expect(result.countryOrigin, null);
        expect(result.marketData, null);
      });
    });

    group('ContractEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: ContractInfoMockData.validResponseBody
          )
        );
        await expectLater(sut!.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(sut!.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        ),throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractInfoMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(sut!.getInfo(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
        ), throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getInfo(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'
          ),
          throwsA(isA<DataParsingException>())
        );
      });
    });
  });

  group('getMarketHistory method in', () {
    var basePath = "/coins/ethereum/contract/0x1f9840a85d5af5bf1d1762f925bdaddc4201f984/market_chart/";
    group('ContractEndpoint test endpoint path creation', () {
      var sut = ContractEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: ContractMarketHistoryMockData.validResponseBody
        )
      );

      test('with all parameters', () async {
        await sut.getMarketHistory(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.jpy,
          days : DataRange.in2Weeks,
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?vs_currency=jpy&days=14"
        );
      });
    });

    group('ContractEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.validResponseBody
          )
        );
        var result = await sut!.getMarketHistory(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.jpy,
          days : DataRange.in2Weeks,
        );
        var prices = result.prices;
        var marketCaps = result.marketCaps;
        var totalVolumes = result.totalVolumes;
        expect(prices!.length, 2);
        expect(marketCaps!.length, 2);
        expect(totalVolumes!.length, 2);
        expect(result.prices!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          3764825.6157043367
        ])), 0);
        expect(result.prices!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          3792357.969195695
        ])), 0);
        expect(result.marketCaps!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          72766031840740.89
        ])), 0);
        expect(result.marketCaps!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          73372376001887.88
        ])), 0);
        expect(result.totalVolumes!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          2797280292466.4453
        ])), 0);
        expect(result.totalVolumes!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          2785972479143.1724
        ])), 0);
      });

      test('should still return a result for incomplete data format', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getMarketHistory(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.jpy,
          days : DataRange.in2Weeks,
        );

        expect(result.prices!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          3764825.6157043367
        ])),0);
        expect(result.prices!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          3792357.969195695
        ])),0);
        expect(result.prices!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          null,
          3792357.969195695
        ])),0);
        expect(result.marketCaps!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          72766031840740.89
          ])),0);
        expect(result.marketCaps!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          73372376001887.88
        ])),0);
        expect(result.marketCaps!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          null
        ])),0);
        expect(result.totalVolumes!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          2797280292466.4453
        ])),0);
        expect(result.totalVolumes!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          2785972479143.1724
        ])),0);
        expect(result.totalVolumes!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          null,
          null
        ])),0);
        
      });
    });

    group('ContractEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: ContractMarketHistoryMockData.validResponseBody
          )
        );
        await expectLater(
          sut!.getMarketHistory(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.jpy,
            days : DataRange.in2Weeks,
          ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(
          sut!.getMarketHistory(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.jpy,
            days : DataRange.in2Weeks,
          ), throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(
          sut!.getMarketHistory(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.jpy,
            days : DataRange.in2Weeks,
          ), throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getMarketHistory(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.jpy,
            days : DataRange.in2Weeks,
          ), throwsA(isA<DataParsingException>()));
      });
    });
  });

  group('getMarketHistoryWithDateRange method in', () {
    var basePath = "/coins/ethereum/contract/0x1f9840a85d5af5bf1d1762f925bdaddc4201f984/market_chart/range";
    group('ContractEndpoint test endpoint path creation', () {
      var sut = ContractEndpoint(
        HttpRequestServiceMock(
          statusCode : 200,
          body: ContractMarketHistoryMockData.validResponseBody
        )
      );

      test('with all parameters', () async {
        await sut.getMarketHistoryWithDateRange(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.php,
          from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
          to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
        );
        expect(
          sut.endpointPath,
          "$apiVersionPath$basePath?vs_currency=php&from=1683175446&to=1683262856"
        );
      });
    });

    group('ContractEndpoint test endpoint response', () {
      test('with data in getting the correct response type', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.validResponseBody
          )
        );
        var result = await sut!.getMarketHistoryWithDateRange(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.php,
          from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
          to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
        );
        var prices = result.prices;
        var marketCaps = result.marketCaps;
        var totalVolumes = result.totalVolumes;
        expect(prices!.length, 2);
        expect(marketCaps!.length, 2);
        expect(totalVolumes!.length, 2);
        expect(result.prices!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          3764825.6157043367
        ])), 0);
        expect(result.prices!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          3792357.969195695
        ])), 0);
        expect(result.marketCaps!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          72766031840740.89
        ])), 0);
        expect(result.marketCaps!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          73372376001887.88
        ])), 0);
        expect(result.totalVolumes!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          2797280292466.4453
        ])), 0);
        expect(result.totalVolumes!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          2785972479143.1724
        ])), 0);
      });

      test('should still return a result for incomplete data format', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.responseBodyWithIncompleteKeys
          )
        );
        var result = await sut!.getMarketHistoryWithDateRange(
          id: 'ethereum',
          contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
          vsCurrency: Currencies.php,
          from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
          to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
        );

        expect(result.prices!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          3764825.6157043367
        ])),0);
        expect(result.prices!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          3792357.969195695
        ])),0);
        expect(result.prices!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          null,
          3792357.969195695
        ])),0);
        expect(result.marketCaps!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          72766031840740.89
          ])),0);
        expect(result.marketCaps!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          73372376001887.88
        ])),0);
        expect(result.marketCaps!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          null
        ])),0);
        expect(result.totalVolumes!.elementAt(0).compareTo(
        HistoricalData.fromJson([
          1680134400000,
          2797280292466.4453
        ])),0);
        expect(result.totalVolumes!.elementAt(1).compareTo(
        HistoricalData.fromJson([
          1680175636000,
          2785972479143.1724
        ])),0);
        expect(result.totalVolumes!.elementAt(2).compareTo(
        HistoricalData.fromJson([
          null,
          null
        ])),0);
        
      });
    });

    group('ContractEndpoint test for error handling', () {
      test('should throw an exception for failed request', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 500,
            body: ContractMarketHistoryMockData.validResponseBody
          )
        );
        await expectLater(
          sut!.getMarketHistoryWithDateRange(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.php,
            from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
            to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
          ), throwsA(isA<NetworkRequestException>()));
      });

      test('should return a FormatException when result is error or when parsing failed', () async {
        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: '''[{
    "error": "coin not found"
  }]'''
          )
        );
        await expectLater(
          sut!.getMarketHistoryWithDateRange(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.php,
            from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
            to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
          ), throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ContractMarketHistoryMockData.responseBodyWithInvalidFormat
          )
        );
        await expectLater(
          sut!.getMarketHistoryWithDateRange(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.php,
            from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
            to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
          ), throwsA(isA<DataParsingException>()));

        sut = ContractEndpoint(
          HttpRequestServiceMock(
            statusCode : 200,
            body: ""
          )
        );
        await expectLater(
          sut!.getMarketHistoryWithDateRange(
            id: 'ethereum',
            contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
            vsCurrency: Currencies.php,
            from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
            to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
          ), throwsA(isA<DataParsingException>()));
      });
    });
  });
  
}
