import 'package:coingecko_client/src/models/base_model.dart';

/// Contains the coin's basic information.
class CoinBasicInfo extends BaseModel {
  String? _id;
  String? _symbol;
  String? _name;
  Map<String, dynamic>? _platforms;
  DateTime? _activatedAt;

  CoinBasicInfo(
      {String? id,
      String? symbol,
      String? name,
      Map<String, dynamic>? platforms,
      DateTime? activatedAt}) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _platforms = platforms;
    _activatedAt = activatedAt;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  Map<String, dynamic>? get platforms => _platforms;
  DateTime? get activatedAt => _activatedAt;

  /// Converts the raw json data(contained in a Map or List) to a CoinBasicInfo object
  CoinBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _platforms = toMap<dynamic>(json['platforms']);
    _activatedAt = toDateFromTimestamp(json['activated_at']);
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['platforms'] = _platforms;
    data['activated_at'] = _activatedAt;
    return data;
  }
}
