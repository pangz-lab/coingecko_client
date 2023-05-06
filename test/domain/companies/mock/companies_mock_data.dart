class CompaniesMockData {
  static final validResponseBody = r'''{
  "total_holdings": 80026.1,
  "total_value_usd": 152884386.10418233,
  "market_cap_dominance": 0.07,
  "companies": [
    {
      "name": "Coinbase",
      "symbol": "NASDAQ: COIN",
      "country": "US",
      "total_holdings": 48880,
      "total_entry_value_usd": 165400000,
      "total_current_value_usd": 93382085,
      "percentage_of_total_supply": 0.041
    },
    {
      "name": "Meitu",
      "symbol": "HKG:1357",
      "country": "HK",
      "total_holdings": 31000,
      "total_entry_value_usd": 50500000,
      "total_current_value_usd": 59223377,
      "percentage_of_total_supply": 0.026
    },
    {
      "name": "Mogo Inc.",
      "symbol": "NASDAQ:MOGO",
      "country": "CA",
      "total_holdings": 146,
      "total_entry_value_usd": 405880,
      "total_current_value_usd": 278923,
      "percentage_of_total_supply": 0
    }
  ]
}''';
  static final responseBodyWithIncompleteKeys = r'''{
  "total_holdings": 80026.1,
  "total_value_usd": 152884386.10418233,
  "market_cap_dominance": 0.07,
  "companies": [
    {
      "name": "Coinbase",
      "symbol": "NASDAQ: COIN",
      "country": "US",
      "total_holdings": 48880
    },
    {
      "name": "Meitu",
      "symbol": "HKG:1357",
      "country": "HK",
      "total_holdings": 31000,
      "total_entry_value_usd": 50500000,
      "total_current_value_usd": 59223377,
      "percentage_of_total_supply": 0.026
    },
    {
      "total_holdings": 146,
      "total_entry_value_usd": 405880,
      "total_current_value_usd": 278923,
      "percentage_of_total_supply": 0
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
