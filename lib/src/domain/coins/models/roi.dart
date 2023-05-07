import 'package:coingecko_client/src/models/base_model.dart';

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

  Roi.fromJson(Map<String, dynamic> json) {
    _times = toDouble(json['times']);
    _currency = json['currency'];
    _percentage = toDouble(json['percentage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['times'] = _times;
    data['currency'] = _currency;
    data['percentage'] = _percentage;
    return data;
  }
}
