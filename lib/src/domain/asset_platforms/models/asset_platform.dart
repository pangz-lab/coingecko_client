import 'package:coingecko_client/src/models/base_model.dart';

class AssetPlatform extends BaseModel {
  String? _id;
  int? _chainIdentifier;
  String? _name;
  String? _shortName;

  AssetPlatform({
    String? id,
    int? chainIdentifier,
    String? name,
    String? shortName,
  }) {
    _id = id;
    _chainIdentifier = chainIdentifier;
    _name = name;
    _shortName = shortName;
  }

  String? get id => _id;
  int? get chainIdentifier => _chainIdentifier;
  String? get name => _name;
  String? get shortName => _shortName;
  
  AssetPlatform.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chainIdentifier = toInt(json['chain_identifier']);
    _name = json['name'];
    _shortName = json['shortname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['chain_identifier'] = chainIdentifier;
    data['name'] = name;
    data['shortname'] = shortName;
    return data;
  }
}
