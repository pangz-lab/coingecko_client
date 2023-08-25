/// Used to filter data by duration time.
enum CoinDuration {
  /// Data duration in 1 hour
  in1Hour('1h'),

  /// Data duration in 24 hours
  in24Hours('24h'),

  /// Data duration in 7 days
  in7Days('7d'),

  /// Data duration in 14 days
  in14Days('14d'),

  /// Data duration in 30 days
  in30Days('30d'),

  /// Data duration in 200 days
  in200Days('60d'),

  /// Data duration in 1 year
  in1Year('1y');

  const CoinDuration(this.value);
  final String value;
}
