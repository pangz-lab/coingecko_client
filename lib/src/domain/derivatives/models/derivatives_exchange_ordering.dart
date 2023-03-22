enum DerivativesExchangeOrdering {
  nameAsc('name_asc'),
  nameDesc('name_desc'),
  openInterestBtcAsc('open_interest_btc_asc'),
  openInterestBtcDesc('open_interest_btc_desc'),
  tradeVolume24hBtcAsc('trade_volume_24h_btc_asc'),
  tradeVolume24hBtcDesc('trade_volume_24h_btc_desc');
  const DerivativesExchangeOrdering(this.value);
  final String value;
}