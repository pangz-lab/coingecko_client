enum DataRange {
  in1Day('1'),
  in1Week('7'),
  in2Weeks('14'),
  in1Month('30'),
  in3Month('90'),
  in6Month('180'),
  in1Year('365'),
  max('max');
  const DataRange(this.value);
  final String value;
}