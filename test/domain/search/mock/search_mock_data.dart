class SearchMockData {
  static final validResponseBody = r'''{
  "coins": [],
  "exchanges": [
    {
      "id": "bybit_spot",
      "name": "Bybit",
      "market_type": "spot",
      "thumb": "https://assets.coingecko.com/markets/images/698/thumb/bybit_spot.png",
      "large": "https://assets.coingecko.com/markets/images/698/large/bybit_spot.png"
    },
    {
      "id": "bybit",
      "name": "Bybit (Futures)",
      "market_type": "futures",
      "thumb": "https://assets.coingecko.com/markets/images/460/thumb/photo_2021-08-12_18-27-50.jpg",
      "large": "https://assets.coingecko.com/markets/images/460/large/photo_2021-08-12_18-27-50.jpg"
    }
  ],
  "icos": [],
  "categories": [
    {
      "id": 145,
      "name": "Move To Earn"
    },
    {
      "id": 119,
      "name": "Play To Earn"
    }
  ],
  "nfts": []
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "coins": [],
  "exchanges": [
    {
      "id": "bybit_spot",
      "name": "Bybit",
      "market_type": "spot",
      "thumb": "https://assets.coingecko.com/markets/images/698/thumb/bybit_spot.png",
      "large": "https://assets.coingecko.com/markets/images/698/large/bybit_spot.png"
    },
    {
      "id": "bybit",
      "name": "Bybit (Futures)",
      "market_type": "futures",
      "thumb": "https://assets.coingecko.com/markets/images/460/thumb/photo_2021-08-12_18-27-50.jpg",
      "large": "https://assets.coingecko.com/markets/images/460/large/photo_2021-08-12_18-27-50.jpg"
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

class GlobalDefiMockData {
  static final validResponseBody = r'''{
    "data" : {
      "defi_market_cap": "47865869842.9580810533925392854",
      "eth_market_cap": "236815713504.1697382997169007792",
      "defi_to_eth_ratio": "20.2122862265705529769901957904537177499923686587544955426674325",
      "trading_volume_24h": "2211981874.802457304149984909366",
      "defi_dominance": "3.7973157237481210812554212782141867546879483948402413255296209",
      "top_coin_name": "Lido Staked Ether",
      "top_coin_defi_dominance": 25.924971412066956
    }
}''';
  static final responseBodyWithIncompleteKeys = r'''{
    "data" : {
      "trading_volume_24h": "2211981874.802457304149984909366",
      "defi_dominance": "3.7973157237481210812554212782141867546879483948402413255296209",
      "top_coin_name": "Lido Staked Ether",
      "top_coin_defi_dominance": 25.924971412066956
    }
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
