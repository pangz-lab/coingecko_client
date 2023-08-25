/// Use to filter derivatives tickers.
enum DerivativesTickers {
  /// Get all
  all('all'),

  /// Filter unexpired
  unexpired('unexpired');

  const DerivativesTickers(this.value);
  final String value;
}
