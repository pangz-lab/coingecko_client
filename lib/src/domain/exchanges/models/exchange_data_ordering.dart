enum ExchangeDataOrdering {
  trustScoreDesc('trust_score_desc'),
  trustScoreAsc('trust_score_asc'),
  volumeDesc('volume_desc');
  const ExchangeDataOrdering(this.value);
  final String value;
}