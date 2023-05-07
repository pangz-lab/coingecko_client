import 'package:coingecko_client/src/models/base_model.dart';

class HistoricalData extends BaseModel implements Comparable {
  DateTime? _timestamp;
  double? _value;

  HistoricalData({DateTime? timestamp, double? value}) {
    _timestamp = timestamp;
    _value = value;
  }

  DateTime? get timestamp => _timestamp;
  double? get value => _value;

  HistoricalData.fromJson(List<dynamic> json) {
    _timestamp = toDateFromMs(json.elementAt(0));
    _value = toDouble(json.elementAt(1));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['timestamp'] = _timestamp;
    data['value'] = _value;
    return data;
  }

  @override
  int compareTo(dynamic otherData) {
    var other = otherData as HistoricalData;
    return (
      other.timestamp == timestamp && other.value == value
    ) ? 0 : 1;
  }
}