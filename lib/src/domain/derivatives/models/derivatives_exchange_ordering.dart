/// Use to define sorting order of derivatives exchange.
enum DerivativesExchangeOrdering {
  /// Sort by name in descending order
  nameDesc('name_desc'),

  /// Sort by name in ascending order
  nameAsc('name_asc'),

  /// Sort by open interest in btc in descending order
  openInterestBtcDesc('open_interest_btc_desc'),

  /// Sort by open interest in btc in ascending order
  openInterestBtcAsc('open_interest_btc_asc'),

  /// Sort by trade volume in btc in 24-hour period in descending order
  tradeVolume24hBtcDesc('trade_volume_24h_btc_desc'),

  /// Sort by trade volume in btc in 24-hour period in ascending order
  tradeVolume24hBtcAsc('trade_volume_24h_btc_asc');

  const DerivativesExchangeOrdering(this.value);
  final String value;
}
