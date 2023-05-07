class ExchangeRatesMockData {
  static final validResponseBody = r'''{
  "rates": {
    "btc": {
      "name": "Bitcoin",
      "unit": "BTC",
      "value": 1,
      "type": "crypto"
    },
    "eth": {
      "name": "Ether",
      "unit": "ETH",
      "value": 14.957,
      "type": "crypto"
    },
    "xrp": {
      "name": "XRP",
      "unit": "XRP",
      "value": 63171.034,
      "type": "crypto"
    }
  }
}''';
  static final responseBodyWithIncompleteKeys = r'''{
  "rates": {
    "btc": {
      "value": 1,
      "type": "crypto"
    },
    "eth": {
      "name": "Ether",
      "unit": "ETH",
      "value": 14.957,
      "type": "crypto"
    },
    "xrp": {
      "name": "XRP",
      "unit": "XRP"
    }
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
