class CategoriesBasicInfoListMockData {
  static final validResponseBody = r'''[
  {
    "category_id": "aave-tokens",
    "name": "Aave Tokens"
  },
  {
    "category_id": "algorand-ecosystem",
    "name": "Algorand Ecosystem"
  },
  {
    "category_id": "analytics",
    "name": "Analytics"
  },
  {
    "category_id": "aptos-ecosystem",
    "name": "Aptos Ecosystem"
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "category_id": "aave-tokens"
  },
  {
    "category_id": "algorand-ecosystem",
    "name": "Algorand Ecosystem"
  },
  {
    "category_id": "analytics",
    "name": "Analytics"
  },
  {
    "name": "Aptos Ecosystem"
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

class CategoriesInfoListMockData {
  static final validResponseBody = r'''[
  {
    "id": "farming-as-a-service-faas",
    "name": "Farming-as-a-Service (FaaS)",
    "market_cap": 7095886.059870023,
    "market_cap_change_24h": -5.4515408890635815,
    "content": "",
    "top_3_coins": [
      "https://assets.coingecko.com/coins/images/23551/small/Logo-Digits-DAO-Icon-01.jpg?1644462126",
      "https://assets.coingecko.com/coins/images/21221/small/2022-07-13_18.49.44.jpg?1657709418",
      "https://assets.coingecko.com/coins/images/25582/small/7zyskNC.png?1652767188"
    ],
    "volume_24h": 108322.37183734335,
    "updated_at": "2023-05-06T04:10:29.372Z"
  },
  {
    "id": "fan-token",
    "name": "Fan Token",
    "market_cap": 332506254.94806916,
    "market_cap_change_24h": -2.9315845722063925,
    "content": "Fan tokens let sporting organizations and other celebrities engage with their communities, where holders can access exclusive benefits.",
    "top_3_coins": [
      "https://assets.coingecko.com/coins/images/15799/small/mJgwTHzCVVCJlqo1tF0NWP57igOYSXr5k1Vqvomd.png?1621929124",
      null,
      "https://assets.coingecko.com/coins/images/11663/small/og.jpg?1592838119"
    ],
    "volume_24h": 52516565.164146915,
    "updated_at": "2023-05-06T04:10:10.438Z"
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "farming-as-a-service-faas",
    "market_cap_change_24h": -5.4515408890635815,
    "content": "",
    "volume_24h": 108322.37183734335,
    "updated_at": "2023-05-06T04:10:29.372Z"
  },
  {
    "id": "fan-token",
    "name": "Fan Token",
    "market_cap": 332506254.94806916,
    "market_cap_change_24h": -2.9315845722063925,
    "content": "Fan tokens let sporting organizations and other celebrities engage with their communities, where holders can access exclusive benefits.",
    "top_3_coins": [
      null,
      null,
      "https://assets.coingecko.com/coins/images/11663/small/og.jpg?1592838119"
    ]
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
