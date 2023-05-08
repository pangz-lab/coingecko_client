import 'package:coingecko_client/src/models/historical_data.dart';

/// Wrapper class of HistoricalData class. Used specifically for 
/// exchange volume.
class ExchangeVolumeChart extends HistoricalData {
  ExchangeVolumeChart.fromJson(super.json) : super.fromJson();
}
