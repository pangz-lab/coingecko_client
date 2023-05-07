enum CoinPriceChange {
  in1Hour('1h'),
  in24Hours('24h'),
  in7Days('7d'),
  in14Days('14d'),
  in30Days('30d'),
  in200Days('200d'),
  in1Year('1y');

  const CoinPriceChange(this.value);
  final String value;
}
