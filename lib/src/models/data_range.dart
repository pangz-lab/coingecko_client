/// Use to specify data range in number of days.
enum DataRange {
  /// Data range in 1 day
  in1Day('1'),

  /// Data range in 7 days
  in1Week('7'),

  /// Data range in 14 days
  in2Weeks('14'),

  /// Data range in 30 days
  in1Month('30'),

  /// Data range in 90 days
  in3Month('90'),

  /// Data range in 180 days
  in6Month('180'),

  /// Data range in 365 days
  in1Year('365'),

  /// Data range in maximum days - the value depends on the service
  max('max');

  const DataRange(this.value);
  final String value;
}
