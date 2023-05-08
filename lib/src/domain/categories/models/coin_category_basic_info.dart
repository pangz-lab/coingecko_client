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

  /// Converts the raw json data(contained in a Map or List) to a CoinCategoryBasicInfo object
  CoinCategoryBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['category_id'];
    _name = json['name'];
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}
