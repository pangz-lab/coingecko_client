/// Use to define sorting order of nft result.
enum NftsDataOrdering {
  /// Sort by 24-volume in descending order
  h24VolumeNativeDesc('h24_volume_native_desc'),

  /// Sort by 24-volume in ascending order
  h24VolumeNativeAsc('h24_volume_native_asc'),

  /// Sort by floor pirce in descending order
  floorPriceNativeDesc('floor_price_native_desc'),

  /// Sort by floor pirce in ascending order
  floorPriceNativeAsc('floor_price_native_asc'),

  /// Sort by market cap in descending order
  marketCapNativeDesc('market_cap_native_desc'),

  /// Sort by market cap in ascending order
  marketCapNativeAsc('market_cap_native_asc'),

  /// Sort by market cap in usd descending order
  marketCapUsdDesc('market_cap_usd_desc'),

  /// Sort by market cap in usd ascending order
  marketCapUsdAsc('market_cap_usd_asc');

  const NftsDataOrdering(this.value);
  final String value;
}
