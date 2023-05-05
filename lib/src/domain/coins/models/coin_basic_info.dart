import 'package:coingecko_client/src/models/base_model.dart';

class CoinBasicInfo extends BaseModel {
  String? _id;
  String? _symbol;
  String? _name;
  Map<String, dynamic>? _platforms;

  CoinBasicInfo({String? id, String? symbol, String? name, Map<String, dynamic>? platforms}) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _platforms = platforms;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  Map<String, dynamic>? get platforms => _platforms;

  CoinBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _platforms = toMap<dynamic>(json['platforms']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['platforms'] = _platforms;
    return data;
  }
}
