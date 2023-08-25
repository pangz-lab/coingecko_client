/// Used to return the top N result.
enum CoinRanking {
  /// Top 300
  top300('300'),

  /// Top 500
  top500('500'),

  /// Top 1000
  top1000('1000'),

  /// All
  all('all');

  const CoinRanking(this.value);
  final String value;
}
