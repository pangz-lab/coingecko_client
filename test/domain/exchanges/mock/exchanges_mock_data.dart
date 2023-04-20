class ExchangesMockData {
  static final validResponseBody = r'''[
  {
    "id": "bybit_spot",
    "name": "Bybit",
    "year_established": 2018,
    "country": "British Virgin Islands",
    "description": "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.",
    "url": "https://www.bybit.com",
    "image": "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794",
    "has_trading_incentive": false,
    "trust_score": 10,
    "trust_score_rank": 4,
    "trade_volume_24h_btc": 32427.38111948771,
    "trade_volume_24h_btc_normalized": 32427.38111948771
  },
  {
    "id": "kraken",
    "name": "Kraken",
    "year_established": 2011,
    "country": "United States",
    "description": "",
    "url": "https://r.kraken.com/c/2223866/687155/10583",
    "image": "https://assets.coingecko.com/markets/images/29/small/kraken.jpg?1584251255",
    "has_trading_incentive": false,
    "trust_score": 10,
    "trust_score_rank": 5,
    "trade_volume_24h_btc": 29715.706789324708,
    "trade_volume_24h_btc_normalized": 29715.706789324708
  },
  {
    "id": "huobi",
    "name": "Huobi",
    "year_established": 2013,
    "country": "Seychelles",
    "description": "",
    "url": "https://www.huobi.com",
    "image": "https://assets.coingecko.com/markets/images/25/small/logo_V_colour_black.png?1669177364",
    "has_trading_incentive": false,
    "trust_score": 10,
    "trust_score_rank": 6,
    "trade_volume_24h_btc": 22319.02115070307,
    "trade_volume_24h_btc_normalized": 22319.02115070307
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "bybit_spot",
    "name": "Bybit",
    "country": "British Virgin Islands",
    "description": "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.",
    "url": "https://www.bybit.com",
    "image": "https://assets.coingecko.com/markets/images/698/small/bybit_spot.png?1629971794",
    "trust_score": 10,
    "trade_volume_24h_btc": 32427.38111948771
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

class MarketExchangeMockData {
  static final validResponseBody = r'''[
  {
    "id": "1bch",
    "name": "1BCH"
  },
  {
    "id": "3xcalibur",
    "name": "3xcalibur"
  },
  {
    "id": "aave",
    "name": "Aave"
  },
  {
    "id": "abcc",
    "name": "ABCC"
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "1bch"
  },
  {
    "name": "ABCC"
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


class MarketExchangeInfoMockData {
  static final validResponseBody = r'''{
  "name": "Binance",
  "year_established": 2017,
  "country": "Cayman Islands",
  "description": "Binance Weekly Report: Record BNB Burn at $68M\r\n\r\nRead here ➡️ https://ter.li/Binance-Report-October-23",
  "url": "https://www.binance.com/",
  "image": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
  "facebook_url": "https://www.test.com/",
  "reddit_url": "https://www.test.com/",
  "telegram_url": "https://www.test.com/",
  "slack_url": "https://www.test.com/",
  "other_url_1": "https://www.test.com/",
  "other_url_2": "https://www.test.com/",
  "twitter_handle": "binance",
  "has_trading_incentive": false,
  "centralized": true,
  "public_notice": "notice test",
  "alert_notice": "notice test",
  "trust_score": 10,
  "trust_score_rank": 4,
  "trade_volume_24h_btc": 511298.14836440206,
  "trade_volume_24h_btc_normalized": 511298.14836440206,
  "tickers": [
    {
      "base": "BUSD",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false
      },
      "last": 0.9996,
      "volume": 495186394.1897759,
      "converted_last": {
        "btc": 0.00003417,
        "eth": 0.00050611,
        "usd": 1
      },
      "converted_volume": {
        "btc": 16921,
        "eth": 250619,
        "usd": 495366172
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010003,
      "timestamp": "2023-04-19T11:06:47+00:00",
      "last_traded_at": "2023-04-19T11:06:47+00:00",
      "last_fetch_at": "2023-04-19T11:06:47+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BUSD_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "binance-usd",
      "target_coin_id": "tether"
    },
    {
      "base": "BTC",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false
      },
      "last": 29268.28,
      "volume": 83637.58064628167,
      "converted_last": {
        "btc": 1.000409,
        "eth": 14.798078,
        "usd": 29275
      },
      "converted_volume": {
        "btc": 83672,
        "eth": 1237675,
        "usd": 2448521568
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010034,
      "timestamp": "2023-04-19T11:02:48+00:00",
      "last_traded_at": "2023-04-19T11:02:48+00:00",
      "last_fetch_at": "2023-04-19T11:02:48+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "tether"
    }
  ],
  "status_updates": [
    {
      "description": "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens",
      "category": "general",
      "created_at": "2020-12-14T11:18:49.085Z",
      "user": "Darc",
      "user_title": "Marketing",
      "pin": false,
      "project": {
        "type": "Market",
        "id": "binance",
        "name": "Binance",
        "image": {
          "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
          "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
          "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
        }
      }
    },
    {
      "description": "Binance Black Friday - $100,000 in Bitcoin Up For Grabs!\r\n\r\nComplete tasks on Binance to get a guaranteed Bitcoin payout and to enter a lucky draw.\r\n\r\nGet started ➡️ https://ter.li/Binance-Black-Friday",
      "category": "general",
      "created_at": "2020-11-24T09:37:17.816Z",
      "user": "Darc",
      "user_title": "Marketing",
      "pin": false,
      "project": {
        "type": "Market",
        "id": "binance",
        "name": "Binance",
        "image": {
          "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
          "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
          "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
        }
      }
    }
  ]
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "name": "Binance",
  "year_established": 2017,
  "country": "Cayman Islands",
  "description": "Binance Weekly Report: Record BNB Burn at $68M\r\n\r\nRead here ➡️ https://ter.li/Binance-Report-October-23",
  "url": "https://www.binance.com/",
  "image": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
  "other_url_1": "https://www.test.com/",
  "other_url_2": "https://www.test.com/",
  "twitter_handle": "binance",
  "has_trading_incentive": false,
  "public_notice": "notice test",
  "trust_score": 10,
  "trust_score_rank": 4,
  "trade_volume_24h_btc": null,
  "trade_volume_24h_btc_normalized": 511298.14836440206,
  "tickers": [
    {
      "base": "BUSD",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance"
      },
      "last": 0.9996,
      "converted_last": {
        "btc": 0.00003417,
        "eth": 0.00050611,
        "usd": 1
      },
      "converted_volume": {
        "btc": 16921,
        "eth": 250619,
        "usd": 495366172
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010003,
      "timestamp": "2023-04-19T11:06:47+00:00",
      "last_traded_at": "2023-04-19T11:06:47+00:00",
      "last_fetch_at": "2023-04-19T11:06:47+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BUSD_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "binance-usd",
      "target_coin_id": "tether"
    },
    {
      "base": "BTC",
      "target": "USDT",
      "market": {
        "name": "Binance",
        "identifier": "binance",
        "has_trading_incentive": false
      },
      "last": 29268.28,
      "volume": 83637.58064628167,
      "converted_last": {
        "btc": 1.000409,
        "eth": 14.798078,
        "usd": 29275
      },
      "converted_volume": {
        "btc": 83672,
        "eth": 1237675,
        "usd": 2448521568
      },
      "trust_score": "green",
      "bid_ask_spread_percentage": 0.010034,
      "timestamp": "2023-04-19T11:02:48+00:00",
      "last_traded_at": "2023-04-19T11:02:48+00:00",
      "last_fetch_at": "2023-04-19T11:02:48+00:00",
      "is_anomaly": false,
      "is_stale": false,
      "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      "token_info_url": null,
      "coin_id": "bitcoin",
      "target_coin_id": "tether"
    }
  ],
  "status_updates": [
    {
      "description": "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens",
      "category": "general",
      "user": "Darc",
      "user_title": "Marketing",
      "pin": false,
      "project": {
        "type": "Market",
        "image": {
          "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
          "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
        }
      }
    },
    {
      "description": "Binance Black Friday - $100,000 in Bitcoin Up For Grabs!\r\n\r\nComplete tasks on Binance to get a guaranteed Bitcoin payout and to enter a lucky draw.\r\n\r\nGet started ➡️ https://ter.li/Binance-Black-Friday",
      "category": "general",
      "created_at": "2020-11-24T09:37:17.816Z",
      "user": "Darc",
      "user_title": "Marketing",
      "pin": false,
      "project": {
        "type": "Market",
        "id": "binance",
        "name": "Binance",
        "image": {
          "thumb": "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250",
          "small": "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
          "large": "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
        }
      }
    }
  ]
}''';
  //With comman at the last part
  static final responseBodyWithInvalidFormat = r'''[
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
]''';
}
