import 'package:coingecko_client/src/models/base_model.dart';

class CoinCategoryInfo extends BaseModel {
  String? _id;
  String? _name;
  double? _marketCap;
  double? _marketCapChange24h;
  String? _content;
  List<String?>? _top3Coins;
  double? _volume24h;
  DateTime? _updatedAt;

  CoinCategoryInfo(
      {String? id,
      String? name,
      double? marketCap,
      double? marketCapChange24h,
      String? content,
      List<String?>? top3Coins,
      double? volume24h,
      DateTime? updatedAt}) {
    _id = id;
    _name = name;
    _marketCap = marketCap;
    _marketCapChange24h = marketCapChange24h;
    _content = content;
    _top3Coins = top3Coins;
    _volume24h = volume24h;
    _updatedAt = updatedAt;
  }

  String? get id => _id;
  String? get name => _name;
  double? get marketCap => _marketCap;
  double? get marketCapChange24h => _marketCapChange24h;
  String? get content => _content;
  List<String?>? get top3Coins => _top3Coins;
  double? get volume24h => _volume24h;
  DateTime? get updatedAt => _updatedAt;

  CoinCategoryInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _marketCap = toDouble(json['market_cap']);
    _marketCapChange24h = toDouble(json['market_cap_change_24h']);
    _content = json['content'];
    _top3Coins = toList<String?>(json['top_3_coins']);
    _volume24h = toDouble(json['volume_24h']);
    _updatedAt = toDate(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    data['market_cap'] = _marketCap;
    data['market_cap_change_24h'] = _marketCapChange24h;
    data['content'] = _content;
    data['top_3_coins'] = _top3Coins;
    data['volume_24h'] = _volume24h;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
