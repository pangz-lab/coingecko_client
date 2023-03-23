class AssetPlatformsMockData {
    static final validResponseBody = '''[
  {
    "id": "factom",
    "chain_identifier": null,
    "name": "Factom",
    "shortname": ""
  },
  {
    "id": "openledger",
    "chain_identifier": 12,
    "name": "OpenLedger",
    "shortname": ""
  }
]''';
  static final responseBodyWithIncompleteKeys = '''[
  {
    "id": "factom",
    "name": "Factom"
  },
  {
    "chain_identifier": 12,
    "shortname": "sn"
  }
]''';
  //With comman at the last part
  static final responseBodyWithInvalidFormat = '''[
  {
    "id": "factom",
    "name": "Factom",
  },
]''';
}