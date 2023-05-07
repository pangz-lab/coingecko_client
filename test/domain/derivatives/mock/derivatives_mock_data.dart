class DerivativesMockData {
  static final validResponseBody = r'''[
  {
    "market": "Deepcoin (Derivatives)",
    "symbol": "ETHUSDT",
    "index_id": "ETH",
    "price": "1904.49",
    "price_percentage_change_24h": 2.3557366649822056,
    "contract_type": "perpetual",
    "index": 1904.1,
    "basis": 0.007353095653270027,
    "spread": 0.01,
    "funding_rate": -0.022454,
    "open_interest": 7498085818.64,
    "volume_24h": 5125742894.90316,
    "last_traded_at": 1683175446,
    "expired_at": null
  },
  {
    "market": "Binance (Futures)",
    "symbol": "BTCUSDT",
    "index_id": "BTC",
    "price": "29097.52",
    "price_percentage_change_24h": 2.26582385284977,
    "contract_type": "perpetual",
    "index": 29094.8,
    "basis": 0.020282650770568844,
    "spread": 0.01,
    "funding_rate": 0.01,
    "open_interest": 2879409940.61,
    "volume_24h": 19448237664.16787,
    "last_traded_at": 1683175319,
    "expired_at": null
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "basis": 0.007353095653270027,
    "spread": 0.01,
    "funding_rate": -0.022454,
    "open_interest": 7498085818.64,
    "volume_24h": null,
    "last_traded_at": 1683175446,
    "expired_at": null
  },
  {
    "market": "Binance (Futures)",
    "symbol": "BTCUSDT",
    "index_id": "BTC",
    "price": "29097.52",
    "price_percentage_change_24h": 2.26582385284977,
    "contract_type": null,
    "index": 29094.8
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

class DerivativesExchangeListMockData {
  static final validResponseBody = r'''[
  {
    "name": "Gate.io (Futures)",
    "id": "gate_futures",
    "open_interest_btc": 63186.12,
    "trade_volume_24h_btc": "60365.87",
    "number_of_perpetual_pairs": 355,
    "number_of_futures_pairs": 0,
    "image": "https://assets.coingecko.com/markets/images/403/small/gate_io_logo.jpg?1654182143",
    "year_established": null,
    "country": "Hong Kong",
    "description": "Gate was established in 2013, and it is the top 10 exchanges in the world in terms of authentic trading volume. It is also the first choice of over 8 million registered customers, covering 130+ countries worldwide, as we are providing the most comprehensive digital asset solutions.",
    "url": "https://www.gate.io/futures_trade/BTC_USD"
  },
  {
    "name": "BingX (Futures)",
    "id": "bingx_futures",
    "open_interest_btc": 55689.35,
    "trade_volume_24h_btc": "231637.53",
    "number_of_perpetual_pairs": 203,
    "number_of_futures_pairs": 0,
    "image": "https://assets.coingecko.com/markets/images/917/small/ezgif.com-gif-maker.jpg?1658483171",
    "year_established": null,
    "country": null,
    "description": "Founded in 2018, BingX is a crypto social trading exchange that offers spot, derivatives and copy trading services to more than 100 countries worldwide.\r\n\r\nBingX prides itself as the people's exchange by unlocking the fast-growing cryptocurrency market for everyone, connecting users with experts traders and a platform to invest in a simple, engaging and transparent way.",
    "url": "https://bingx.com/"
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "number_of_futures_pairs": 0,
    "image": "https://assets.coingecko.com/markets/images/403/small/gate_io_logo.jpg?1654182143",
    "year_established": null,
    "country": "Hong Kong",
    "description": "Gate was established in 2013, and it is the top 10 exchanges in the world in terms of authentic trading volume. It is also the first choice of over 8 million registered customers, covering 130+ countries worldwide, as we are providing the most comprehensive digital asset solutions.",
    "url": "https://www.gate.io/futures_trade/BTC_USD"
  },
  {
    "name": "BingX (Futures)",
    "id": "bingx_futures",
    "open_interest_btc": 55689.35,
    "trade_volume_24h_btc": "231637.53",
    "number_of_perpetual_pairs": 203
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

class DerivativesExchangeMockData {
  static final validResponseBody = r'''
  {
    "name": "Bybit (Futures)",
    "open_interest_btc": 152905.09,
    "trade_volume_24h_btc": "381427.73",
    "number_of_perpetual_pairs": 244,
    "number_of_futures_pairs": 32,
    "image": "https://assets.coingecko.com/markets/images/460/small/photo_2021-08-12_18-27-50.jpg?1628764200",
    "year_established": 2018,
    "country": null,
    "description": "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.",
    "url": "https://www.bybit.com",
    "tickers": [
      {
        "symbol": "10000NFTUSDT",
        "base": "10000NFT",
        "target": "USDT",
        "trade_url": "https://www.bybit.com/app/exchange/10000NFTUSDT",
        "contract_type": "perpetual",
        "last": 0.004,
        "h24_percentage_change": -0.268,
        "index": 0.003724,
        "index_basis_percentage": 0.242,
        "bid_ask_spread": 0.00134408602150544,
        "funding_rate": -0.089,
        "open_interest_usd": 319412.735,
        "h24_volume": 18621420,
        "converted_volume": {
          "btc": "2.381598411684822141052551",
          "eth": "36.38266400893652113746409",
          "usd": "69236.9969033612388211814"
        },
        "converted_last": {
          "btc": "0.00000012788450119020366854678263",
          "eth": "0.00000195363702626174136349321498161146577439",
          "usd": "0.003717813536258691189050514548519798361857"
        },
        "last_traded": 1683171968,
        "expired_at": null
      }
    ]
  }
''';

  static final responseBodyWithIncompleteKeys = r'''
  {
    "number_of_futures_pairs": 32,
    "image": "https://assets.coingecko.com/markets/images/460/small/photo_2021-08-12_18-27-50.jpg?1628764200",
    "year_established": 2018,
    "country": null,
    "description": "Bybit is a cryptocurrency exchange that offers a professional platform featuring an ultra-fast matching engine, excellent customer service and multilingual community support for crypto traders of all levels. Established in March 2018, Bybit currently serves more than 10 million users and institutions offering access to over 100 assets and contracts across Spot, Futures and Options, launchpad projects, earn products, an NFT Marketplace and more. Bybit is a proud partner of Formula One racing team, Oracle Red Bull Racing, esports teams NAVI, Astralis, Alliance, Virtus.pro, Made in Brazil (MIBR), City Esports, and Oracle Red Bull Racing Esports, and association football (soccer) teams Borussia Dortmund and Avispa Fukuoka.",
    "url": "https://www.bybit.com",
    "tickers": [
      {
        "symbol": "10000NFTUSDT",
        "base": "10000NFT",
        "target": "USDT",
        "trade_url": "https://www.bybit.com/app/exchange/10000NFTUSDT",
        "contract_type": "perpetual",
        "last": 0.004,
        "h24_percentage_change": -0.268,
        "index": 0.003724,
        "converted_last": {
          "btc": "0.00000012788450119020366854678263",
          "usd": "0.003717813536258691189050514548519798361857"
        },
        "last_traded": 1683171968,
        "expired_at": null
      }
    ]
  }
''';
  //With comman at the last part
  static final responseBodyWithInvalidFormat = r'''[
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
]''';
}

class DerivativesExchangeBasicInfoListMockData {
  static final validResponseBody = r'''[
  {
    "id": "binance_futures",
    "name": "Binance (Futures)"
  },
  {
    "id": "deepcoin_derivatives",
    "name": "Deepcoin (Derivatives)"
  },
  {
    "id": "bybit",
    "name": "Bybit (Futures)"
  },
  {
    "id": "ftx",
    "name": "FTX (Derivatives)"
  }
]
''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "name": "Binance (Futures)"
  },
  {
    "id": "ftx"
  }
]
''';

  //With comman at the last part
  static final responseBodyWithInvalidFormat = r'''[
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
]''';
}
