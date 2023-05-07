class MarketIndexListMockData {
  static final validResponseBody = r'''[
  {
    "id": "PEOPLE",
    "name": "ZB (Derivatives) PEOPLE"
  },
  {
    "id": "LUNA",
    "name": "Bibox (Futures) LUNA"
  }
]''';

  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "PEOPLE"
  },
  {
    "name": "Bibox (Futures) LUNA"
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

class MarketIndexMockData {
  static final validResponseBody = r'''{
  "name": "Bybit (Futures) HOT",
  "market": "Bybit (Futures)",
  "last": 0.001845,
  "is_multi_asset_composite": false
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "name": "Bybit (Futures) HOT",
  "last": 0.001845
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

class MarketIndexBasicInfoMockData {
  static final validResponseBody = r'''[
  {
    "id": "PEOPLE",
    "name": "ZB (Derivatives) PEOPLE"
  },
  {
    "id": "LUNA",
    "name": "Bibox (Futures) LUNA"
  }
]''';

  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "PEOPLE"
  },
  {
    "name": "Bibox (Futures) LUNA"
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
