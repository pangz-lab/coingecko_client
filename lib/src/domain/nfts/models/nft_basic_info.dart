import 'package:coingecko_client/src/models/base_model.dart';

/// Nfts basic information. Use to obtain basic info of all the NFT ids
/// and other nft related information.
class NftBasicInfo extends BaseModel {
  String? _id;
  String? _contractAddress;
  String? _name;
  String? _assetPlatformId;
  String? _symbol;

  NftBasicInfo(
      {String? id,
      String? contractAddress,
      String? name,
      String? assetPlatformId,
      String? symbol}) {
    _id = id;
    _contractAddress = contractAddress;
    _name = name;
    _assetPlatformId = assetPlatformId;
    _symbol = symbol;
  }

  String? get id => _id;
  String? get contractAddress => _contractAddress;
  String? get name => _name;
  String? get assetPlatformId => _assetPlatformId;
  String? get symbol => _symbol;

  NftBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _contractAddress = json['contract_address'];
    _name = json['name'];
    _assetPlatformId = json['asset_platform_id'];
    _symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['contract_address'] = _contractAddress;
    data['name'] = _name;
    data['asset_platform_id'] = _assetPlatformId;
    data['symbol'] = _symbol;
    return data;
  }
}
