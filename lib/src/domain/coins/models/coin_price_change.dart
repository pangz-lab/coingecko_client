/// Provides range of time in days in getting the data for coin price changes.
enum CoinPriceChange {
  /// Price change in 1 hour
  in1Hour('1h'),

  /// Price change in 24 hours
  in24Hours('24h'),

  /// Price change in 7 days
  in7Days('7d'),

  /// Price change in 14 days
  in14Days('14d'),

  /// Price change in 30 days
  in30Days('30d'),

  /// Price change in 200 days
  in200Days('200d'),

  /// Price change in 1 year
  in1Year('1y');

  const CoinPriceChange(this.value);
  final String value;
}
