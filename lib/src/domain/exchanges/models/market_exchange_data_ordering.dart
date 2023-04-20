enum MarketExchangeDataOrdering {
  trustScoreDesc('trust_score_desc'),
  trustScoreAsc('trust_score_asc'),
  volumeDesc('volume_desc');
  const MarketExchangeDataOrdering(this.value);
  final String value;
}