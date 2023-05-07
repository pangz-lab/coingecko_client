enum NftsDataOrdering {
  h24VolumeNativeAsc('h24_volume_native_asc'),
  h24VolumeNativeDesc('h24_volume_native_desc'),
  floorPriceNativeAsc('floor_price_native_asc'),
  floorPriceNativeDesc('floor_price_native_desc'),
  marketCapNativeAsc('market_cap_native_asc'),
  marketCapNativeDesc('market_cap_native_desc'),
  marketCapUsdAsc('market_cap_usd_asc'),
  marketCapUsdDesc('market_cap_usd_desc');

  const NftsDataOrdering(this.value);
  final String value;
}
