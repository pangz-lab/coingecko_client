class PingMockData {
  static final validResponseBody = r'''{
  "gecko_says": "(V3) To the Moon!"
}''';

  static final responseBodyWithIncompleteKeys = r'''{
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