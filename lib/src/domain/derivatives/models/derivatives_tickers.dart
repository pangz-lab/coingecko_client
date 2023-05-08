/// Mainly use to filter derivatives tickers.
enum DerivativesTickers {
  all('all'),
  unexpired('unexpired');

  const DerivativesTickers(this.value);
  final String value;
}
