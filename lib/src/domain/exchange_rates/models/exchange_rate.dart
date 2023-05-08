import 'package:coingecko_client/src/models/base_model.dart';

/// Exchange rate data. Used when collecting rates of a specific coin.
class ExchangeRate extends BaseModel {
  String? _name;
  String? _unit;
  double? _value;
  String? _type;

  ExchangeRate({String? name, String? unit, double? value, String? type}) {
    _name = name;
    _unit = unit;
    _value = value;
    _type = type;
  }

  String? get name => _name;
  String? get unit => _unit;
  double? get value => _value;
  String? get type => _type;

  ExchangeRate.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _unit = json['unit'];
    _value = toDouble(json['value']);
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = _name;
    data['unit'] = _unit;
    data['value'] = _value;
    data['type'] = _type;
    return data;
  }
}
