import 'package:coingecko_client/src/models/base_model.dart';

/// Basic roi information. Used mainly for coin information.
class Roi extends BaseModel {
  double? _times;
  String? _currency;
  double? _percentage;

  Roi({double? times, String? currency, double? percentage}) {
    _times = times;
    _currency = currency;
    _percentage = percentage;
  }

  double? get times => _times;
  String? get currency => _currency;
  double? get percentage => _percentage;

  /// Converts the raw json data(contained in a Map or List) to an Roi object
  Roi.fromJson(Map<String, dynamic> json) {
    _times = toDouble(json['times']);
    _currency = json['currency'];
    _percentage = toDouble(json['percentage']);
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['times'] = _times;
    data['currency'] = _currency;
    data['percentage'] = _percentage;
    return data;
  }
}
