import 'package:coingecko_client/src/models/base_model.dart';

/// Provides data for the coin's open, high, low and close for a specific period.
class CoinOhlc extends BaseModel {
  DateTime? _time;
  double? _open;
  double? _high;
  double? _low;
  double? _close;

  CoinOhlc(
      {DateTime? time,
      double? open,
      double? high,
      double? low,
      double? close}) {
    _time = time;
    _open = open;
    _high = high;
    _low = low;
    _close = close;
  }

  DateTime? get time => _time;
  double? get open => _open;
  double? get high => _high;
  double? get low => _low;
  double? get close => _close;

  CoinOhlc.fromJson(List<dynamic> json) {
    var map = json.toList().asMap();
    _time = map.containsKey(0) ? toDateFromMs(json.elementAt(0)) : null;
    _open = map.containsKey(1) ? toDouble(json.elementAt(1)) : null;
    _high = map.containsKey(2) ? toDouble(json.elementAt(2)) : null;
    _low = map.containsKey(3) ? toDouble(json.elementAt(3)) : null;
    _close = map.containsKey(4) ? toDouble(json.elementAt(4)) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = _time;
    data['open'] = _open;
    data['high'] = _high;
    data['low'] = _low;
    data['close'] = _close;
    return data;
  }
}
