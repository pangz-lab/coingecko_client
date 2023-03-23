class CoinListMockData {
  static final validResponseBody = '''[
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
  static final validResponseBodyWithPlatforms = '''[
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
  static final responseBodyWithIncompleteKeys = '''[
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
  static final responseBodyWithInvalidFormat = '''[
  {
    "id": "0chain",
    "symbol": "zcn",
    "name": "Zus"
  },
]''';
}

class CoinMarketMockData {
  static final validResponseBody = '''[{
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

  static final validResponseBodyWithCompleteParameter = '''[{
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

  static final responseBodyWithIncompleteKeys = '''[{
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
  static final responseBodyWithInvalidFormat = '''[{
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