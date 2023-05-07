class NftBasicInfoListMockData {
  static final validResponseBody = r'''[
  {
    "id": "squiggly",
    "contract_address": "0x36F379400DE6c6BCDF4408B282F8b685c56adc60",
    "name": "Squiggly",
    "asset_platform_id": "ethereum",
    "symbol": "~~"
  },
  {
    "id": "autoglyphs",
    "contract_address": "0xd4e4078ca3495de5b1d4db434bebc5a986197782",
    "name": "Autoglyphs",
    "asset_platform_id": "ethereum",
    "symbol": "☵"
  }
]''';
  static final responseBodyWithIncompleteKeys = r'''[
  {
    "id": "squiggly",
    "contract_address": "0x36F379400DE6c6BCDF4408B282F8b685c56adc60",
    "name": "Squiggly"
  },
  {
    "id": "autoglyphs",
    "asset_platform_id": "ethereum",
    "symbol": "☵"
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

class NftInfoMockData {
  static final validResponseBody = r'''{
  "id": "meebits",
  "contract_address": "0x7Bd29408f11D2bFC23c34f18275bBf23bB716Bc7",
  "asset_platform_id": "ethereum",
  "name": "Meebits",
  "symbol": "⚇",
  "image": {
    "small": "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788"
  },
  "description": "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.",
  "native_currency": "ethereum",
  "floor_price": {
    "native_currency": 2.48,
    "usd": 4710.04
  },
  "market_cap": {
    "native_currency": 49576,
    "usd": 94196187
  },
  "volume_24h": {
    "native_currency": 185.93,
    "usd": 353271
  },
  "floor_price_in_usd_24h_percentage_change": 2.47633,
  "number_of_unique_addresses": 6558,
  "number_of_unique_addresses_24h_percentage_change": -0.07618,
  "total_supply": 19999,
  "links": {
    "homepage": "https://meebits.larvalabs.com/",
    "twitter": "https://twitter.com/larvalabs",
    "discord": ""
  }
}''';

  static final responseBodyWithIncompleteKeys = r'''{
  "id": "meebits",
  "name": "Meebits",
  "symbol": "⚇",
  "image": {
    "small": "https://assets.coingecko.com/nft_contracts/images/28/small/meebits.png?1644852788"
  },
  "description": "The Meebits are 20,000 unique 3D voxel characters, created by a custom generative algorithm, then registered on the Ethereum blockchain.",
  "native_currency": "ethereum",
  "floor_price": {
    "native_currency": 2.48
  },
  "market_cap": {
    "native_currency": 49576
  },
  "volume_24h": {
    "native_currency": 185.93
  },
  "number_of_unique_addresses_24h_percentage_change": -0.07618,
  "total_supply": 19999,
  "links": {
    "homepage": "https://meebits.larvalabs.com/",
    "twitter": "https://twitter.com/larvalabs"
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
