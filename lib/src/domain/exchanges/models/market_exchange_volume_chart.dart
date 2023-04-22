import 'package:coingecko_client/src/models/base_model.dart';

class MarketExchangeVolumeChart extends BaseModel {
  DateTime? _timestamp;
  double? _volume;

  MarketExchangeVolumeChart({DateTime? timestamp, double? volume}) {
    _timestamp = timestamp;
    _volume = volume;
  }

  DateTime? get timestamp => _timestamp;
  double? get volume => _volume;

  MarketExchangeVolumeChart.fromJson(List<dynamic> json) {
    _timestamp = toDateFromMs(json.elementAt(0));
    _volume = toDouble(json.elementAt(1));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['timestamp'] = _timestamp;
    data['volume'] = _volume;
    return data;
  }
}