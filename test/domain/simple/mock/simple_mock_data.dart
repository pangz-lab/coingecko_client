class SimpleCoinPriceMockData {
  static final validResponseBody = r'''{
  "bitcoin": {
    "jpy": 3881924.3037475827,
    "jpy_market_cap": 74963848431157.84,
    "jpy_24h_vol": 2319295474939.273,
    "jpy_24h_change": 0.8304785217679028,
    "usd": 28527.72397490793,
    "usd_market_cap": 551045734456.4741,
    "usd_24h_vol": 17044181171.035738,
    "usd_24h_change": 1.9342642953468947,
    "php": 1578805.0923411534,
    "php_market_cap": 30492667312929.062,
    "php_24h_vol": 943273289214.5586,
    "php_24h_change": 1.9533072546775028,
    "last_updated_at": 1683095289
  },
  "ethereum": {
    "jpy": 253266.49596619446,
    "jpy_market_cap": 30452003613515.43,
    "jpy_24h_vol": 1078781576575.3495,
    "jpy_24h_change": 0.7622958697717335,
    "usd": 1861.2203957817135,
    "usd_market_cap": 223847188318.92593,
    "usd_24h_vol": 7927816370.877563,
    "usd_24h_change": 1.8719702623822114,
    "php": 103005.21140116191,
    "php_market_cap": 12386808236663.23,
    "php_24h_vol": 438747825395.96045,
    "php_24h_change": 1.9259971148083728,
    "last_updated_at": 1683095288
  },
  "verus-coin": {
    "jpy": 96.560977993782572222,
    "jpy_market_cap": 6921209327.503516,
    "jpy_24h_vol": 1853137.1389235803,
    "jpy_24h_change": 0.29050380250023083,
    "usd": 0.7096132514213257,
    "usd_market_cap": 50876561.92976307,
    "usd_24h_vol": 13618.448133011312,
    "usd_24h_change": 1.3949824463318015,
    "php": 39.27200837761078,
    "php_market_cap": 2815305481.821921,
    "php_24h_vol": 753683.5143628567,
    "php_24h_change": 1.4487563327044903,
    "last_updated_at": 1683095287
  }
}''';
  static final responseBodyWithIncompleteKeys = r'''{
  "bitcoin": {
    "jpy_market_cap": 74963848431157.84,
    "jpy_24h_vol": 2319295474939.273,
    "jpy_24h_change": 0.8304785217679028,
    "usd": 28527.72397490793,
    "usd_market_cap": 551045734456.4741,
    "usd_24h_vol": 17044181171.035738,
    "usd_24h_change": 1.9342642953468947,
    "php": 1578805.0923411534,
    "php_market_cap": 30492667312929.062,
    "php_24h_vol": 943273289214.5586,
    "php_24h_change": 1.9533072546775028,
    "last_updated_at": 1683095289
  },
  "ethereum": {},
  "verus-coin": {}
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

class SimpleTokenPriceMockData {
  static final validResponseBody = r'''{
  "0x2098fABE9C82eb5280AF4841a5000f373E99a498": {
    "btc": 3881924.3037475827,
    "btc_market_cap": 74963848431157.84,
    "btc_24h_vol": 2319295474939.273,
    "btc_24h_change": 0.8304785217679028
  }
}''';
  static final responseBodyWithIncompleteKeys = r'''{
  "0x2098fABE9C82eb5280AF4841a5000f373E99a498": {
    "btc": 3881924.3037475827,
    "btc_24h_vol": 2319295474939.273,
    "btc_24h_change": 0.8304785217679028
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

class SimpleSupportedVsCurrencyMockData {
  static final validResponseBody = r'''[
  "vrsc",
  "btc",
  "sgd",
  "thb",
  "try",
  "twd",
  "xag",
  "xau",
  "bits",
  "sats"
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
