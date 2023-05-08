import 'package:coingecko_client/src/models/base_model.dart';

/// Market index information. Use in getting the list of indexes
/// or a specific market index.
class MarketIndex extends BaseModel {
  String? _name;
  String? _id;
  String? _market;
  double? _last;
  bool? _isMultiAssetComposite;

  MarketIndex(
      {String? name,
      String? id,
      String? market,
      double? last,
      bool? isMultiAssetComposite}) {
    _name = name;
    _id = id;
    _market = market;
    _last = last;
    _isMultiAssetComposite = isMultiAssetComposite;
  }

  String? get name => _name;
  String? get id => _id;
  String? get market => _market;
  double? get last => _last;
  bool? get isMultiAssetComposite => _isMultiAssetComposite;

  MarketIndex.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _id = json['id'];
    _market = json['market'];
    _last = toDouble(json['last']);
    _isMultiAssetComposite = json['is_multi_asset_composite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = _name;
    data['id'] = _id;
    data['market'] = _market;
    data['last'] = _last;
    data['is_multi_asset_composite'] = _isMultiAssetComposite;
    return data;
  }
}
