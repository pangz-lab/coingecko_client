import 'package:coingecko_client/src/models/base_model.dart';

/// Basic information of a coin category.
class CoinCategoryBasicInfo extends BaseModel {
  String? _id;
  String? _name;

  CoinCategoryBasicInfo({String? id, String? name}) {
    _id = id;
    _name = name;
  }

  String? get id => _id;
  String? get name => _name;

  CoinCategoryBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['category_id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}
