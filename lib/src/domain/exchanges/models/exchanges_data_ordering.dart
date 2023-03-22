enum ExchangesDataOrdering {
  trustScoreDesc('trust_score_desc'),
  trustScoreAsc('trust_score_asc'),
  volumeDesc('volume_desc');
  const ExchangesDataOrdering(this.value);
  final String value;
}