import 'package:coingecko_client/coingecko_client.dart';

/// Contains the ranking information.
class CoinRankingInfo extends BaseModel {
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  int? _marketCapRank;
  double? _value;
  double? _valueFor24hVolume;
  double? _valueFor1hChange;

  CoinRankingInfo(
      {String? id,
      String? symbol,
      String? name,
      String? image,
      int? marketCapRank,
      double? value,
      double? valueFor24hVolume,
      double? valueFor1hChange}) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _marketCapRank = marketCapRank;
    _value = value;
    _valueFor24hVolume = valueFor24hVolume;
    _valueFor1hChange = valueFor1hChange;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get image => _image;
  int? get marketCapRank => _marketCapRank;
  double? get value => _value;
  double? get valueFor24hVolume => _valueFor24hVolume;
  double? get valueFor1hChange => _valueFor1hChange;

  /// Converts the raw json data(contained in a Map or List) to a CoinRankingInfo object
  CoinRankingInfo.fromJson(Map<String, dynamic> json, Currencies vsCurrency) {
    final currency = vsCurrency.code;
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _image = json['image'];
    _marketCapRank = json['market_cap_rank'];
    _value = json[currency];
    _valueFor24hVolume = json['${currency}_24h_vol'];
    _valueFor1hChange = json['${currency}_1h_change'];
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson(Currencies vsCurrency) {
    final Map<String, dynamic> data = {};
    final currency = vsCurrency.code;
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['image'] = _image;
    data['market_cap_rank'] = _marketCapRank;
    data[currency] = _value;
    data['${currency}_24h_vol'] = _valueFor24hVolume;
    data['${currency}_1h_change'] = _valueFor1hChange;
    return data;
  }
}
