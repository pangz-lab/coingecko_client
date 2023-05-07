class TerndingMockData {
  static final validResponseBody = r'''{
  "coins": [
    {
      "item": {
        "id": "chaingpt",
        "coin_id": 29306,
        "name": "ChainGPT",
        "symbol": "CGPT",
        "market_cap_rank": 858,
        "thumb": "https://assets.coingecko.com/coins/images/29306/thumb/200x200.png?1677992972",
        "small": "https://assets.coingecko.com/coins/images/29306/small/200x200.png?1677992972",
        "large": "https://assets.coingecko.com/coins/images/29306/large/200x200.png?1677992972",
        "slug": "chaingpt",
        "price_btc": 0.000005920902940245426,
        "score": 0
      }
    },
    {
      "item": {
        "id": "pepe",
        "coin_id": 29850,
        "name": "Pepe",
        "symbol": "PEPE",
        "market_cap_rank": 43,
        "thumb": "https://assets.coingecko.com/coins/images/29850/thumb/pepe-token.jpeg?1682922725",
        "small": "https://assets.coingecko.com/coins/images/29850/small/pepe-token.jpeg?1682922725",
        "large": "https://assets.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1682922725",
        "slug": "pepe",
        "price_btc": 1.0164505793922885e-10,
        "score": 1
      }
    }
  ]
}''';
  static final responseBodyWithIncompleteKeys = r'''{
  "coins": [
    {
      "item": {
        "market_cap_rank": 858,
        "thumb": "https://assets.coingecko.com/coins/images/29306/thumb/200x200.png?1677992972",
        "small": "https://assets.coingecko.com/coins/images/29306/small/200x200.png?1677992972",
        "large": "https://assets.coingecko.com/coins/images/29306/large/200x200.png?1677992972",
        "slug": "chaingpt",
        "price_btc": 0.000005920902940245426,
        "score": 0
      }
    },
    {
      "item": {
        "id": "pepe",
        "coin_id": 29850,
        "name": "Pepe",
        "symbol": "PEPE",
        "market_cap_rank": 43,
        "score": 1
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