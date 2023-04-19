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

class ExchangeMarketMockData {
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
