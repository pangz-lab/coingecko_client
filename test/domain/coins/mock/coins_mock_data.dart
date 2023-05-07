class CoinListMockData {
  static final validResponseBody = r'''[
  {
    "id": "01coin",
    "symbol": "zoc",
    "name": "01coin"
  },
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
  {
    "id": "0vix-protocol",
    "symbol": "vix",
    "name": "0VIX Protocol"
  }
]''';
  static final validResponseBodyWithPlatforms = r'''[
  {
    "id": "01coin",
    "symbol": "zoc",
    "name": "01coin",
    "platforms": {
      "ethereum": "0xb9ef770b6a5e12e45983c5d80545258aa38f3b78",
      "polygon-pos": "0x8bb30e0e67b11b978a5040144c410e1ccddcba30"
    }
  },
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus",
    "platforms": {
      "ethereum": "0xe41d2489571d322189246dafa5ebde1f4699f498",
      "energi": "0x591c19dc0821704bedaa5bbc6a66fee277d9437e",
      "harmony-shard-0": "0x8143e2a1085939caa9cef6665c2ff32f7bc08435",
      "avalanche": "0x596fa47043f99a4e0f122243b841e55375cde0d2"
    }
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "01coin",
    "name": "01coin",
    "platforms": {
      "ethereum": "0xb9ef770b6a5e12e45983c5d80545258aa38f3b78",
      "polygon-pos": "0x8bb30e0e67b11b978a5040144c410e1ccddcba30"
    }
  },
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  }
]''';
  //With comman at the last part
  static final responseBodyWithInvalidFormat = r'''[
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
]''';
}

class CoinMarketMockData {
  static final validResponseBody = r'''[{
    "id": "vechain",
    "symbol": "vet",
    "name": "VeChain",
    "image": "https://assets.coingecko.com/coins/images/1167/large/VeChain-Logo-768x725.png?1547035194",
    "current_price": 3.02,
    "market_cap": 218513465202,
    "market_cap_rank": 38,
    "fully_diluted_valuation": 261309869861,
    "total_volume": 13631729213,
    "high_24h": 3.15,
    "low_24h": 2.9,
    "price_change_24h": -0.11247230191365132,
    "price_change_percentage_24h": -3.59128,
    "market_cap_change_24h": -9155770360.097015,
    "market_cap_change_percentage_24h": -4.02152,
    "circulating_supply": 72511146418,
    "total_supply": 85985041177,
    "max_supply": 86712634466,
    "ath": 30.55,
    "ath_change_percentage": -90.11764,
    "ath_date": "2021-04-19T01:08:21.675Z",
    "atl": 0.201403,
    "atl_change_percentage": 1399.17337,
    "atl_date": "2020-03-13T02:29:59.652Z",
    "roi": {
      "times": 3.6135702295092447,
      "currency": "eth",
      "percentage": 361.3570229509245
    },
    "last_updated": "2023-03-23T03:40:36.668Z"
  }]''';

  static final validResponseBodyWithCompleteParameter = r'''[{
    "id": "aave-amm-bptbalweth",
    "symbol": "aammbptbalweth",
    "name": "Aave AMM BptBALWETH",
    "image": "https://assets.coingecko.com/coins/images/17261/large/aAmmBptBALWETH.png?1626959531",
    "current_price": 34006,
    "market_cap": 0,
    "market_cap_rank": null,
    "fully_diluted_valuation": null,
    "total_volume": null,
    "high_24h": 35471,
    "low_24h": 33335,
    "price_change_24h": -1153.9176068902307,
    "price_change_percentage_24h": -3.28193,
    "market_cap_change_24h": 0,
    "market_cap_change_percentage_24h": 0,
    "circulating_supply": 0,
    "total_supply": 52.6134911192542,
    "max_supply": null,
    "ath": 124370,
    "ath_change_percentage": -72.65746,
    "ath_date": "2021-09-04T13:07:05.461Z",
    "atl": 18940.5,
    "atl_change_percentage": 79.54002,
    "atl_date": "2022-06-18T21:00:56.647Z",
    "last_updated": "2023-03-23T09:08:01.270Z",
    "sparkline_in_7d": {
      "price": [
        249.37679377676122,
        249.28503490939102,
        249.0714321528849,
        249.24412926857016
      ]
    },
    "roi": {
      "times": 3.6135702295092447,
      "currency": "eth",
      "percentage": 361.3570229509245
    },
    "price_change_percentage_14d_in_currency": 1.1486264036796594,
    "price_change_percentage_1h_in_currency": -0.16307046821360777,
    "price_change_percentage_1y_in_currency": -46.416895306779104,
    "price_change_percentage_200d_in_currency": -16.957767393408776,
    "price_change_percentage_24h_in_currency": -2.9201300645222434,
    "price_change_percentage_30d_in_currency": -17.765285429740334,
    "price_change_percentage_7d_in_currency": 1.4191558625633633
}]''';

  static final responseBodyWithIncompleteKeys = r'''[{
    "current_price": 34006,
    "market_cap": 23.3,
    "market_cap_rank": 23,
    "fully_diluted_valuation": null,
    "total_volume": 233.3,
    "high_24h": 35471,
    "low_24h": 33335,
    "price_change_24h": -1153.9176068902307,
    "max_supply": null,
    "ath": null,
    "ath_change_percentage": null,
    "ath_date": null,
    "atl": 18940.5,
    "atl_change_percentage": 79.54002,
    "atl_date": "2022-06-18T21:00:56.647Z",
    "sparkline_in_7d": {},
    "roi": {}
}]''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''[{
    "current_price": 34006,
    "market_cap": 23.3,
    "market_cap_rank": 23,
    "fully_diluted_valuation": null,
    "total_volume": 233.3,
    "high_24h": 35471,
    "low_24h": 33335,
    "price_change_24h": -1153.9176068902307,
    "max_supply": null,
    "ath": null,
    "ath_change_percentage": null,
    "ath_date": null,
    "atl": 18940.5,
    "atl_change_percentage": 79.54002,
    "atl_date": "2022-06-18T21:00:56.647Z",
    "sparkline_in_7d": {},
    "roi": {},
},]''';
}

class CoinInfoMockData {
  static final validResponseBody = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "asset_platform_id": null,
  "platforms": {
    "": ""
  },
  "detail_platforms": {
    "": {
      "decimal_place": null,
      "contract_address": ""
    }
  },
  "block_time_in_minutes": 10,
  "hashing_algorithm": "SHA-256",
  "categories": [
    "Cryptocurrency",
    "Layer 1 (L1)"
  ],
  "public_notice": null,
  "additional_notices": [],
  "description": {
    "en": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>."
  },
  "links": {
    "homepage": [
      "http://www.bitcoin.org",
      "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      ""
    ],
    "blockchain_site": [
      "https://blockchair.com/bitcoin/",
      "https://btc.com/",
      "https://btc.tokenview.io/",
      "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      ""
    ],
    "official_forum_url": [
      "https://bitcointalk.org/",
      "",
      ""
    ],
    "chat_url": [
      ""
    ],
    "announcement_url": [
      "",
      ""
    ],
    "twitter_screen_name": "bitcoin",
    "facebook_username": "bitcoins",
    "bitcointalk_thread_identifier": null,
    "telegram_channel_identifier": "",
    "subreddit_url": "https://www.reddit.com/r/Bitcoin/",
    "repos_url": {
      "github": [
        "https://github.com/bitcoin/bitcoin",
        "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
        "https://github.com/bitcoin/bips"
      ],
      "bitbucket": []
    }
  },
  "image": {
    "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
    "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
    "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
  },
  "country_origin": "",
  "genesis_date": "2009-01-03",
  "sentiment_votes_up_percentage": 82.84,
  "sentiment_votes_down_percentage": 17.16,
  "market_cap_rank": 1,
  "coingecko_rank": 1,
  "coingecko_score": 83.151,
  "developer_score": 99.241,
  "community_score": 83.341,
  "liquidity_score": 100.011,
  "public_interest_score": 0.073,
  "public_interest_stats": {
    "alexa_rank": 9440,
    "bing_matches": null
  },
  "status_updates": [],
  "last_updated": "2023-03-24T13:55:13.610Z"
}''';

  static final validResponseBodyWithCompleteParameter = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "asset_platform_id": null,
  "platforms": {
    "": ""
  },
  "detail_platforms": {
    "": {
      "decimal_place": null,
      "contract_address": ""
    }
  },
  "block_time_in_minutes": 10,
  "hashing_algorithm": "SHA-256",
  "categories": [
    "Cryptocurrency",
    "Layer 1 (L1)"
  ],
  "public_notice": null,
  "additional_notices": [],
  "localization": {
    "en": "Bitcoin",
    "de": "Bitcoin",
    "es": "Bitcoin",
    "fr": "Bitcoin",
    "it": "Bitcoin",
    "pl": "Bitcoin",
    "ro": "Bitcoin",
    "hu": "Bitcoin",
    "nl": "Bitcoin",
    "pt": "Bitcoin",
    "sv": "Bitcoin",
    "vi": "Bitcoin",
    "tr": "Bitcoin",
    "ru": "Биткоин",
    "ja": "ビットコイン",
    "zh": "比特币",
    "zh-tw": "比特幣",
    "ko": "비트코인",
    "ar": "بيتكوين",
    "th": "บิตคอยน์",
    "id": "Bitcoin",
    "cs": "Bitcoin",
    "da": "Bitcoin",
    "el": "Bitcoin",
    "hi": "Bitcoin",
    "no": "Bitcoin",
    "sk": "Bitcoin",
    "uk": "Bitcoin",
    "he": "Bitcoin",
    "fi": "Bitcoin",
    "bg": "Bitcoin",
    "hr": "Bitcoin",
    "lt": "Bitcoin",
    "sl": "Bitcoin"
  },
  "description": {
    "en": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "de": "",
    "es": "",
    "fr": "",
    "it": "",
    "pl": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "ro": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "hu": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "nl": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "pt": "",
    "sv": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "vi": "",
    "tr": "",
    "ru": "",
    "ja": "",
    "zh": "",
    "zh-tw": "",
    "ko": "비트코인은 2009년 나카모토 사토시가 만든 디지털 통화로, 통화를 발행하고 관리하는 중앙 장치가 존재하지 않는 구조를 가지고 있다. 대신, 비트코인의 거래는 P2P 기반 분산 데이터베이스에 의해 이루어지며, 공개 키 암호 방식 기반으로 거래를 수행한다. 비트코인은 공개성을 가지고 있다. 비트코인은 지갑 파일의 형태로 저장되며, 이 지갑에는 각각의 고유 주소가 부여되며, 그 주소를 기반으로 비트코인의 거래가 이루어진다. 비트코인은 1998년 웨이따이가 사이버펑크 메일링 리스트에 올린 암호통화란 구상을 최초로 구현한 것 중의 하나이다.\r\n\r\n비트코인은 최초로 구현된 가상화폐입니다. 발행 및 유통을 관리하는 중앙권력이나 중간상인 없이, P2P 네트워크 기술을 이용하여 네트워크에 참여하는 사용자들이 주체적으로 화폐를 발행하고 이체내용을 공동으로 관리합니다. 이를 가능하게 한 블록체인 기술을 처음으로 코인에 도입한 것이 바로 비트코인입니다.\r\n\r\n비트코인을 사용하는 개인과 사업자의 수는 꾸준히 증가하고 있으며, 여기에는 식당, 아파트, 법률사무소, 온라인 서비스를 비롯한 소매상들이 포함됩니다. 비트코인은 새로운 사회 현상이지만 아주 빠르게 성장하고 있습니다. 이를 바탕으로 가치 증대는 물론, 매일 수백만 달러의 비트코인이 교환되고 있습니다. \r\n\r\n비트코인은 가상화폐 시장에서 현재 유통시가총액과 코인의 가치가 가장 크고, 거래량 또한 안정적입니다. 이더리움이 빠르게 추격하고 있지만 아직은 가장 견고한 가상화폐라고 볼 수 있습니다. \r\n\r\n코인 특징\r\n1. 중앙주체 없이 사용자들에 의해 거래내용이 관리될 수 있는 비트코인의 운영 시스템은 블록체인 기술에서 기인합니다. 블록체인은 쉽게 말해 다 같이 장부를 공유하고, 항상 서로의 컴퓨터에 있는 장부 파일을 비교함으로써 같은 내용만 인정하는 방식으로 운영됩니다. 따라서 전통적인 금융기관에서 장부에 대한 접근을 튼튼하게 방어하던 것과는 정반대의 작업을 통해 보안을 달성합니다. 장부를 해킹하려면 51%의 장부를 동시에 조작해야 하는데, 이는 사실상 불가능합니다. 왜냐하면, 이를 실행하기 위해서는 컴퓨팅 파워가 어마어마하게 소요되고, 이것이 가능한 슈퍼컴퓨터는 세상에 존재하지 않기 때문입니다. 또한, 장부의 자료들은 줄글로 기록되는 것이 아니라 암호화 해시 함수형태로 블록에 저장되고, 이 블록들은 서로 연결되어 있어서 더 강력한 보안을 제공합니다. \r\n\r\n2. 비트코인은 블록발행보상을 채굴자에게 지급하는 방식으로 신규 코인을 발행합니다. 블록발행보상은 매 21만 블록(약 4년)을 기준으로 발행량이 절반으로 줄어듭니다. 처음에는 50비트코인씩 발행이 되었고, 4년마다 계속 반으로 감소하고 있습니다. 코인의 총량이 2,100만 개에 도달하면 신규 발행은 종료되고, 이후에는 거래 수수료만을 통해 시스템이 지탱될 것입니다. \r\n\r\n핵심 가치\r\n(키워드: 통화로 사용될 수 있는 보편성 및 편의성)\r\n\r\n1. 다양한 알트코인들의 등장에 앞서 비트코인은 가상화폐 시장에서 독보적이었기 때문에, 현재 가장 보편적인 결제수단으로 사용됩니다. 실생활에서 이를 활용할 수 있는 가맹점이 알트코인들보다 압도적으로 많을 뿐만 아니라, 이 또한 증가하고 있습니다. 일례로 일본 업체들이 비트코인 결제 시스템을 도입하면서 곧 비트코인을 오프라인 점포 26만 곳에서 이용할 수 있게 될 것입니다. \r\n\r\n2. 여러 나라에서 비트코인을 정식 결제 수단으로 인정하면서, 실물화폐와 가상화폐를 거래할 때 더는 부가가치세가 부과되지 않게 된다고 합니다. 실제로 일본과 호주에서는 이미 비트코인을 합법적 결제 수단으로 인정하면서 제도권 안으로 들여오고 있고, 미국에서는 비트코인 ETF 승인 노력도 진행되고 있습니다. 각국에 비트코인을 기반으로 한 ATM 기계도 설치되었다고 합니다. ",
    "ar": "",
    "th": "",
    "id": "",
    "cs": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "da": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "el": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "hi": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "no": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "sk": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "uk": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "he": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "fi": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "bg": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "hr": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "lt": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>.",
    "sl": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>."
  },
  "links": {
    "homepage": [
      "http://www.bitcoin.org",
      "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      ""
    ],
    "blockchain_site": [
      "https://blockchair.com/bitcoin/",
      "https://btc.com/",
      "https://btc.tokenview.io/",
      "",
      "",
      "",
      "",
      "",
      "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      ""
    ],
    "official_forum_url": [
      "https://bitcointalk.org/",
      "",
      ""
    ],
    "chat_url": [
      "",
      "",
      ""
    ],
    "announcement_url": [
      "",
      ""
    ],
    "twitter_screen_name": "bitcoin",
    "facebook_username": "bitcoins",
    "bitcointalk_thread_identifier": null,
    "telegram_channel_identifier": "",
    "subreddit_url": "https://www.reddit.com/r/Bitcoin/",
    "repos_url": {
      "github": [
        "https://github.com/bitcoin/bitcoin",
        "https://github.com/bitcoin/bips"
      ],
      "bitbucket": []
    }
  },
  "image": {
    "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
    "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
    "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
  },
  "country_origin": "",
  "genesis_date": "2009-01-03",
  "sentiment_votes_up_percentage": 79.42,
  "sentiment_votes_down_percentage": 20.58,
  "market_cap_rank": 1,
  "coingecko_rank": 1,
  "coingecko_score": 83.151,
  "developer_score": 99.241,
  "community_score": 83.341,
  "liquidity_score": 100.011,
  "public_interest_score": 0.073,
  "market_data": {
    "current_price": {
      "aed": 101948,
      "link": 3820,
      "sats": 99954976
    },
    "total_value_locked": null,
    "mcap_to_tvl_ratio": null,
    "fdv_to_tvl_ratio": null,
    "roi": null,
    "ath": {
      "aed": 253608,
      "ars": 6913791,
      "aud": 93482,
      "link": 74906,
      "sats": 105823579
    },
    "ath_change_percentage": {
      "aed": -59.80036,
      "ars": -17.58205,
      "link": -94.89451,
      "sats": -5.53046
    },
    "ath_date": {
      "aed": "2021-11-10T14:24:11.849Z",
      "ars": "2021-11-10T14:24:11.849Z",
      "aud": "2021-11-10T14:24:11.849Z",
      "sats": "2021-05-19T16:00:11.072Z"
    },
    "atl": {
      "aed": 632.31,
      "ars": 1478.98,
      "aud": 72.61,
      "bch": 3.513889,
      "link": 598.477,
      "sats": 95099268
    },
    "atl_change_percentage": {
      "aed": 16023.26026,
      "ars": 385180.1279,
      "sats": 5.12284
    },
    "atl_date": {
      "aed": "2015-01-14T00:00:00.000Z",
      "ars": "2015-01-14T00:00:00.000Z",
      "aud": "2013-07-05T00:00:00.000Z",
      "sats": "2021-05-19T13:14:13.071Z"
    },
    "market_cap": {
      "aed": 1970450379979,
      "ars": 110133107915714,
      "yfi": 63724224,
      "zar": 9749354182286,
      "bits": 19321723174292,
      "link": 73912121864,
      "sats": 1932172317429155
    },
    "market_cap_rank": 1,
    "fully_diluted_valuation": {
      "aed": -0.2140964212242,
      "ars": 1.3527194715,
      "aud": 876405985438,
      "sats": null
    },
    "total_volume": {
      "aed": 77994537033,
      "ars": 4359298184417,
      "sats": 76469824499968
    },
    "high_24h": {
      "aed": null,
      "ars": 5853.397,
      "zar": 0,
      "bits": -10.07623,
      "link": 3848,
      "sats": 100762326
    },
    "low_24h": {
      "aed": 99926,
      "ars": null,
      "bits": 99.6387,
      "link": 0,
      "sats": -99.638749
    },
    "price_change_24h": -595.8179206881,
    "price_change_percentage_24h": -2.10118,
    "price_change_percentage_7d": 1.06962,
    "price_change_percentage_14d": 37.46052,
    "price_change_percentage_30d": 14.96873,
    "price_change_percentage_60d": null,
    "price_change_percentage_200d": 4030547,
    "price_change_percentage_1y": -36.81627,
    "market_cap_change_24h": -12023865909.323,
    "market_cap_change_percentage_24h": -2.19182,
    "price_change_24h_in_currency": {
      "aed": -2188.090669203142,
      "ars": -136378.84121314343,
      "aud": -782.5840326772086,
      "zar": -9418.30084696709,
      "bits": -123.82997696346138,
      "link": 77.405,
      "sats": -12382.997696354985
    },
    "price_change_percentage_1h_in_currency": {
      "aed": 0.55875,
      "ars": 0.55875,
      "link": 0.09927,
      "sats": 0.04844
    },
    "price_change_percentage_24h_in_currency": {
      "aed": -2.10118,
      "ars": -2.33746,
      "link": 2.06835,
      "sats": -0.01239
    },
    "price_change_percentage_7d_in_currency": {
      "aed": 1.06219,
      "ars": 3.00866,
      "zar": -0.48955,
      "bits": -0.10797,
      "link": 0.63096,
      "sats": -0.10797
    },
    "price_change_percentage_14d_in_currency": {
      "aed": 37.45172,
      "ars": 40.50144,
      "btc": 0,
      "link": 17.87076,
      "sats": -0.01568
    },
    "price_change_percentage_30d_in_currency": {
      "aed": 14.95167,
      "dose": 12,
      "bits": -0.03675,
      "link": 21.91687,
      "sats": -0.03675
    },
    "price_change_percentage_60d_in_currency": {
      "aed": 20.75754,
      "zar": 27.69664,
      "bits": -0.0305,
      "link": 16.99998,
      "sats": -0.0305
    },
    "price_change_percentage_200d_in_currency": {
      "aed": 40.2793,
      "ars": 105.47193,
      "btc": 0,
      "bits": -0.06327,
      "link": 42.25333,
      "sats": -0.06327
    },
    "price_change_percentage_1y_in_currency": {
      "aed": -36.82805,
      "ars": 17.22559,
      "bits": -0.04898,
      "link": 40.41278,
      "sats": -0.04898
    },
    "market_cap_change_24h_in_currency": {
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
    },
    "market_cap_change_percentage_24h_in_currency": {
      "aed": -2.19182,
      "ars": -2.43646,
      "aud": -1.94076,
      "bch": 0.22006,
      "link": 2.37652,
      "sats": 0.00606
    },
    "total_supply": 21000000,
    "max_supply": 21000000,
    "circulating_supply": 19327487,
    "sparkline_7d": {
      "price": [
        27454.092345483394,
        27710.295055502036,
        27494.337717553793,
        27487.11350938197
      ]
    },
    "last_updated": "2023-03-25T02:43:27.743Z"
  },
  "community_data": {
    "facebook_likes": null,
    "twitter_followers": 5737981,
    "reddit_average_posts_48h": 0,
    "reddit_average_comments_48h": 0,
    "reddit_subscribers": 0,
    "reddit_accounts_active_48h": 0,
    "telegram_channel_user_count": null
  },
  "developer_data": {
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
  },
  "public_interest_stats": {
    "alexa_rank": 9440,
    "bing_matches": null
  },
  "status_updates": [],
  "last_updated": "2023-03-25T02:43:27.743Z",
  "tickers": [
    {
      "base": "BTC",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false
      },
      "last": 27642.71,
      "volume": 85401.59418823966,
      "converted_last": {
        "btc": 1.000116,
        "eth": 15.682484,
        "usd": 27790
      },
      "converted_volume": {
        "btc": 85412,
        "eth": 1339309,
        "usd": 2373320029
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010036,
      "timestamp": "2023-03-25T02:30:36+00:00",
      "last_traded_at": "2023-03-25T02:30:36+00:00",
      "last_fetch_at": "2023-03-25T02:30:36+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "tether"
    },
    {
      "base": "BTC",
      "target": "USDT",
      "market": {
        "name": "Biconomy",
        "identifier": "biconomy",
        "has_trading_incentive": false
      },
      "last": 27611.37,
      "volume": 8605.89219,
      "converted_last": {
        "btc": 0.99974691,
        "eth": 15.684823,
        "usd": 27762
      },
      "converted_volume": {
        "btc": 8604,
        "eth": 134982,
        "usd": 238916227
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010109,
      "timestamp": "2023-03-25T02:39:48+00:00",
      "last_traded_at": "2023-03-25T02:39:48+00:00",
      "last_fetch_at": "2023-03-25T02:39:48+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.biconomy.com/exchange?coin=BTC_USDT",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "tether"
    }
  ]
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "asset_platform_id": null,
  "platforms": {
    "": ""
  }
}''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "asset_platform_id": null,
  "platforms": {
    "": ""
  },
},''';
}

class CoinTickersMockData {
  static final validResponseBody = r'''{
  "name": "Bitcoin",
  "tickers": [
    {
      "base": "BTC",
      "target": "EUR",
      "market": {
        "name": "Bittrex",
        "identifier": "bittrex",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/10/small/BG-color-250x250_icon.png?1596167574"
      },
      "last": 26075.866,
      "volume": 5.86785553,
      "converted_last": {
        "btc": 0.99646975,
        "eth": 15.559817,
        "usd": 28307
      },
      "converted_volume": {
        "btc": 5.847141,
        "eth": 91.303,
        "usd": 166099
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.200478,
      "timestamp": "2023-03-29T10:27:01+00:00",
      "last_traded_at": "2023-03-29T10:27:01+00:00",
      "last_fetch_at": "2023-03-29T10:27:01+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://bittrex.com/Market/Index?MarketName=EUR-BTC",
      "token_info_url": null,
      "coin_id": "bitcoin"
    }
  ]
}''';

  static final validResponseBodyWithCompleteParameter = r'''{
  "name": "Bitcoin",
  "tickers": [
    {
      "base": "BTC",
      "target": "EUR",
      "market": {
        "name": "Bittrex",
        "identifier": "bittrex",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/10/small/BG-color-250x250_icon.png?1596167574"
      },
      "last": 26075.866,
      "volume": 5.86785553,
      "converted_last": {
        "btc": 0.99646975,
        "eth": 15.559817,
        "usd": 28307
      },
      "converted_volume": {
        "btc": 5.847141,
        "eth": 91.303,
        "usd": 166099
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.200478,
      "timestamp": "2023-03-29T10:27:01+00:00",
      "last_traded_at": "2023-03-29T10:27:01+00:00",
      "last_fetch_at": "2023-03-29T10:27:01+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://bittrex.com/Market/Index?MarketName=EUR-BTC",
      "token_info_url": null,
      "coin_id": "bitcoin"
    },
    {
      "base": "NEO",
      "target": "BTC",
      "market": {
        "name": "Crypto.com Exchange",
        "identifier": "crypto_com",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/589/small/h2oMjPp6_400x400.jpg?1669699705"
      },
      "last": 0.00045636,
      "volume": 3704.5501,
      "converted_last": {
        "btc": 1,
        "eth": 15.601969,
        "usd": 28343
      },
      "converted_volume": {
        "btc": 1.690608,
        "eth": 26.37682,
        "usd": 47917
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.273057,
      "timestamp": "2023-03-29T10:20:59+00:00",
      "last_traded_at": "2023-03-29T10:20:59+00:00",
      "last_fetch_at": "2023-03-29T10:25:42+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://crypto.com/exchange/trade/spot/NEO_BTC",
      "token_info_url": null,
      "coin_id": "neo",
      "target_coin_id": "bitcoin"
    },
    {
      "base": "FET",
      "target": "BTC",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false,
        "logo": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250"
      },
      "last": 0.00001299,
      "volume": 2378554.7590454197,
      "converted_last": {
        "btc": 1,
        "eth": 15.612598,
        "usd": 28357
      },
      "converted_volume": {
        "btc": 30.897426,
        "eth": 482.389,
        "usd": 876146
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.152788,
      "timestamp": "2023-03-29T10:08:42+00:00",
      "last_traded_at": "2023-03-29T10:08:42+00:00",
      "last_fetch_at": "2023-03-29T10:08:42+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/FET_BTC?ref=37754157",
      "token_info_url": null,
      "coin_id": "fetch-ai",
      "target_coin_id": "bitcoin"
    }
  ]
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "name": "Bitcoin"
}''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''{
  "name": "bitcoin",
},''';
}

class CoinHistoryMockData {
  static final validResponseBody = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "localization": {
    "en": "Bitcoin",
    "ru": "Биткоин",
    "ja": "ビットコイン",
    "zh": "比特币",
    "zh-tw": "比特幣",
    "ko": "비트코인",
    "ar": "بيتكوين",
    "th": "บิตคอยน์",
    "id": "Bitcoin",
    "cs": "Bitcoin",
    "da": "Bitcoin",
    "el": "Bitcoin",
    "hi": "Bitcoin",
    "no": "Bitcoin",
    "sk": "Bitcoin",
    "uk": "Bitcoin",
    "he": "Bitcoin",
    "fi": "Bitcoin",
    "bg": "Bitcoin",
    "hr": "Bitcoin",
    "lt": "Bitcoin",
    "sl": "Bitcoin"
  },
  "image": {
    "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
    "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579"
  }
}''';

  static final validResponseBodyWithCompleteParameter = r'''{
  "id": "bitcoin",
  "symbol": "btc",
  "name": "Bitcoin",
  "localization": {
    "en": "Bitcoin",
    "de": "Bitcoin",
    "es": "Bitcoin",
    "fr": "Bitcoin",
    "it": "Bitcoin",
    "pl": "Bitcoin",
    "ro": "Bitcoin",
    "hu": "Bitcoin",
    "nl": "Bitcoin",
    "pt": "Bitcoin",
    "sv": "Bitcoin",
    "vi": "Bitcoin",
    "tr": "Bitcoin",
    "ru": "Биткоин",
    "ja": "ビットコイン",
    "zh": "比特币",
    "zh-tw": "比特幣",
    "ko": "비트코인",
    "ar": "بيتكوين",
    "th": "บิตคอยน์",
    "id": "Bitcoin",
    "cs": "Bitcoin",
    "da": "Bitcoin",
    "el": "Bitcoin",
    "hi": "Bitcoin",
    "no": "Bitcoin",
    "sk": "Bitcoin",
    "uk": "Bitcoin",
    "he": "Bitcoin",
    "fi": "Bitcoin",
    "bg": "Bitcoin",
    "hr": "Bitcoin",
    "lt": "Bitcoin",
    "sl": "Bitcoin"
  },
  "image": {
    "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
    "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579"
  },
  "market_data": {
    "current_price": {
      "aed": 61128.22985695089,
      "ars": 2943801.482766091,
      "link": 2972.256266475138,
      "sats": 100004012.08331282
    },
    "market_cap": {
      "aed": 1176325458767.2192,
      "link": 57165497740.20414,
      "sats": 1924808957959762.5
    },
    "total_volume": {
      "aed": 57600151375.60185,
      "ars": 2773896960927.079,
      "aud": 23188099293.539948,
      "sats": 94232177958468.03
    }
  },
  "community_data": {
    "facebook_likes": null,
    "twitter_followers": 5684671,
    "reddit_average_posts_48h": 5.8,
    "reddit_average_comments_48h": 302.8,
    "reddit_subscribers": 4767785,
    "reddit_accounts_active_48h": "10351.2727272727"
  },
  "developer_data": {
    "forks": null,
    "stars": null,
    "subscribers": null,
    "total_issues": null,
    "closed_issues": null,
    "pull_requests_merged": null,
    "pull_request_contributors": null,
    "code_additions_deletions_4_weeks": {
      "additions": null,
      "deletions": null
    },
    "commit_count_4_weeks": null
  },
  "public_interest_stats": {
    "alexa_rank": null,
    "bing_matches": null
  }
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "name": "Bitcoin"
}''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''{
  "name": "bitcoin",
},''';
}

class CoinMarketChartMockData {
  static final validResponseBody = r'''{
  "prices": [
    [
      1680134400000,
      3764825.6157043367
    ],
    [
      1680175636000,
      3792357.969195695
    ]
  ],
  "market_caps": [
    [
      1680134400000,
      72766031840740.89
    ],
    [
      1680175636000,
      73372376001887.88
    ]
  ],
  "total_volumes": [
    [
      1680134400000,
      2797280292466.4453
    ],
    [
      1680175636000,
      2785972479143.1724
    ]
  ]
}''';

  static final validResponseBodyWithCompleteParameter = r'''{
  "prices": [
    [
      1680134400000,
      3764825.6157043367
    ],
    [
      1680175636000,
      3792357.969195695
    ],
    [
      null,
      3792357.969195695
    ]
  ],
  "market_caps": [
    [
      1680134400000,
      72766031840740.89
    ],
    [
      1680175636000,
      73372376001887.88
    ],
    [
      1680175636000,
      null
    ]
  ],
  "total_volumes": [
    [
      1680134400000,
      2797280292466.4453
    ],
    [
      1680175636000,
      2785972479143.1724
    ],
    [
      null,
      null
    ]
  ]
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "prices": [
    [
      1680134400000,
      3764825.6157043367
    ],
    [
      1680175636000,
      3792357.969195695
    ]
  ],
  "market_caps": [
    [
      1680134400000,
      72766031840740.89
    ],
    [
      1680175636000,
      73372376001887.88
    ]
  ]
}''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''{
  "name": "bitcoin",
},''';
}

class CoinOhlcMockData {
  static final validResponseBody = r'''[
  [
    1681441200000,
    4075375.26,
    4075375.26,
    4056990.83,
    4056990.83
  ],
  [
    1681443000000,
    4054963.62,
    4060335.15,
    4054963.62,
    4060335.15
  ],
  [
    1681444800000,
    4070224.05,
    4071955.88,
    4066105.52,
    4071955.88
  ]
]''';

//   static final validResponseBodyWithCompleteParameter = r'''{
//   "prices": [
//     [
//       1680134400000,
//       3764825.6157043367
//     ],
//     [
//       1680175636000,
//       3792357.969195695
//     ],
//     [
//       null,
//       3792357.969195695
//     ]
//   ],
//   "market_caps": [
//     [
//       1680134400000,
//       72766031840740.89
//     ],
//     [
//       1680175636000,
//       73372376001887.88
//     ],
//     [
//       1680175636000,
//       null
//     ]
//   ],
//   "total_volumes": [
//     [
//       1680134400000,
//       2797280292466.4453
//     ],
//     [
//       1680175636000,
//       2785972479143.1724
//     ],
//     [
//       null,
//       null
//     ]
//   ]
// }''';

  static final responseBodyWithIncompleteKeys = r'''[
  [
    0,
    0,
    0,
    0,
    0
  ],
  [
    1681444800000
  ],
  [
    1681444800000,
    2333
  ]
]''';
  //Invalid json format - with comma at the end
  static final responseBodyWithInvalidFormat = r'''{
  "name": "bitcoin",
},''';
}
