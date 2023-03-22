enum CoinMarketDataOrdering {
  marketCapDesc('market_cap_desc'),
  geckoDesc('gecko_desc'),
  geckoAsc('gecko_asc'),
  marketCapAsc('market_cap_asc'),
  volumeAsc('volume_asc'),
  volumeDesc('volume_desc'),
  idAsc('id_asc'),
  idDesc('id_desc');
  const CoinMarketDataOrdering(this.value);
  final String value;
}

enum CoinTickersDataOrdering {
  trustScoreDesc('trust_score_desc'),
  trustScoreAsc('trust_score_asc'),
  volumeDesc('volume_desc');
  const CoinTickersDataOrdering(this.value);
  final String value;
}