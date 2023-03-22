enum CoinPriceChange {
  in1Hour('1h'),
  in24Hour('24h'),
  in7Day('7d'),
  in14Day('14d'),
  in30Day('30d'),
  in200Day('200d'),
  in1Year('1y');
  const CoinPriceChange(this.value);
  final String value;
}