/// Use to define sorting order exchange data.
enum ExchangeDataOrdering {
  /// Sort by trust score in descending order
  trustScoreDesc('trust_score_desc'),

  /// Sort by trust score in ascending order
  trustScoreAsc('trust_score_asc'),

  /// Sort by volume in descending order
  volumeDesc('volume_desc'),

  /// Sort by volume in ascending order
  volumeAsc('volume_asc');

  const ExchangeDataOrdering(this.value);
  final String value;
}
