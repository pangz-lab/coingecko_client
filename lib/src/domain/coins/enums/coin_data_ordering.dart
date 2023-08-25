/// Use to define the sorting order of coin result.
enum CoinMarketDataOrdering {
  /// Sort by market capital in descending order
  marketCapDesc('market_cap_desc'),

  /// Sort by market capital in ascending order
  marketCapAsc('market_cap_asc'),

  /// Sort by volume in descending order
  volumeDesc('volume_desc'),

  /// Sort by volume in ascending order
  volumeAsc('volume_asc'),

  /// Sort by id in descending order
  idDesc('id_desc'),

  /// Sort by id in ascending order
  idAsc('id_asc');

  const CoinMarketDataOrdering(this.value);
  final String value;
}

/// Use to define the sorting order of coin tickers result.
enum CoinTickersDataOrdering {
  /// Sort by trust score in descending order
  trustScoreDesc('trust_score_desc'),

  /// Sort by trust score in ascending order
  trustScoreAsc('trust_score_asc'),

  /// Sort by volume in descending order
  volumeDesc('volume_desc'),

  /// Sort by volume in ascending order
  volumeAsc('volume_asc');

  const CoinTickersDataOrdering(this.value);
  final String value;
}
