class GlobalCryptoMockData {
  static final validResponseBody = r'''{
    "data" : {
      "active_cryptocurrencies": 10689,
      "upcoming_icos": 0,
      "ongoing_icos": 49,
      "ended_icos": 3376,
      "markets": 730,
      "total_market_cap": {
          "btc": 42878529.36821942,
          "eth": 640948223.5557362,
          "ltc": 14426069664.536545,
          "bch": 10580973266.418148,
          "sats": 4287852936821942
      },
      "total_volume": {
          "btc": 2690072.986370203,
          "eth": 40211208.902308844,
          "ltc": 905049237.3655756,
          "bch": 663819183.4674561
      },
      "market_cap_percentage": {
          "btc": 45.16322104636624,
          "eth": 18.786970593968423,
          "usdt": 6.5166124733657265,
          "bnb": 4.075733958995251,
          "usdc": 2.409475289744893,
          "xrp": 1.9118766850578561,
          "ada": 1.08634805454502,
          "steth": 0.9844427873710667,
          "doge": 0.8758498755197673,
          "matic": 0.7245310857878053
      },
      "market_cap_change_percentage_24h_usd": 1.0640913224189947,
      "updated_at": 1683350915
    }
}''';
  static final responseBodyWithIncompleteKeys = r'''{
    "data" : {
      "active_cryptocurrencies": 10689,
      "upcoming_icos": 0,
      "ongoing_icos": 49,
      "ended_icos": 3376,
      "markets": 730,
      "market_cap_change_percentage_24h_usd": 1.0640913224189947,
      "updated_at": 1683350915
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
      "defi_market_cap": "47865869842.9580810533925392854",
      "eth_market_cap": "236815713504.1697382997169007792",
      "defi_to_eth_ratio": "20.2122862265705529769901957904537177499923686587544955426674325",
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