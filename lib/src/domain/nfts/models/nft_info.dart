import 'package:coingecko_client/src/models/base_model.dart';
import 'package:coingecko_client/src/models/image.dart';

/// Nft information. Contains all information of a specific nft.
class NftInfo extends BaseModel {
  String? _id;
  String? _contractAddress;
  String? _assetPlatformId;
  String? _name;
  String? _symbol;
  Image? _image;
  String? _description;
  String? _nativeCurrency;
  Map<String, dynamic>? _floorPrice;
  Map<String, dynamic>? _marketCap;
  Map<String, dynamic>? _volume24h;
  double? _floorPriceInUsd24hPercentageChange;
  int? _numberOfUniqueAddresses;
  double? _numberOfUniqueAddresses24hPercentageChange;
  int? _totalSupply;
  Map<String, dynamic>? _links;

  NftInfo(
      {String? id,
      String? contractAddress,
      String? assetPlatformId,
      String? name,
      String? symbol,
      Image? image,
      String? description,
      String? nativeCurrency,
      Map<String, dynamic>? floorPrice,
      Map<String, dynamic>? marketCap,
      Map<String, dynamic>? volume24h,
      double? floorPriceInUsd24hPercentageChange,
      int? numberOfUniqueAddresses,
      double? numberOfUniqueAddresses24hPercentageChange,
      int? totalSupply,
      Map<String, dynamic>? links}) {
    _id = id;
    _contractAddress = contractAddress;
    _assetPlatformId = assetPlatformId;
    _name = name;
    _symbol = symbol;
    _image = image;
    _description = description;
    _nativeCurrency = nativeCurrency;
    _floorPrice = floorPrice;
    _marketCap = marketCap;
    _volume24h = volume24h;
    _floorPriceInUsd24hPercentageChange = floorPriceInUsd24hPercentageChange;
    _numberOfUniqueAddresses = numberOfUniqueAddresses;
    _numberOfUniqueAddresses24hPercentageChange =
        numberOfUniqueAddresses24hPercentageChange;
    _totalSupply = totalSupply;
    _links = links;
  }

  String? get id => _id;
  String? get contractAddress => _contractAddress;
  String? get assetPlatformId => _assetPlatformId;
  String? get name => _name;
  String? get symbol => _symbol;
  Image? get image => _image;
  String? get description => _description;
  String? get nativeCurrency => _nativeCurrency;
  Map<String, dynamic>? get floorPrice => _floorPrice;
  Map<String, dynamic>? get marketCap => _marketCap;
  Map<String, dynamic>? get volume24h => _volume24h;
  double? get floorPriceInUsd24hPercentageChange =>
      _floorPriceInUsd24hPercentageChange;
  int? get numberOfUniqueAddresses => _numberOfUniqueAddresses;
  double? get numberOfUniqueAddresses24hPercentageChange =>
      _numberOfUniqueAddresses24hPercentageChange;
  int? get totalSupply => _totalSupply;
  Map<String, dynamic>? get links => _links;

  NftInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _contractAddress = json['contract_address'];
    _assetPlatformId = json['asset_platform_id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
    _description = json['description'];
    _nativeCurrency = json['native_currency'];
    _floorPrice = toMap<dynamic>(json['floor_price']);
    _marketCap = toMap<dynamic>(json['market_cap']);
    _volume24h = toMap<dynamic>(json['volume_24h']);
    _floorPriceInUsd24hPercentageChange =
        toDouble(json['floor_price_in_usd_24h_percentage_change']);
    _numberOfUniqueAddresses = toInt(json['number_of_unique_addresses']);
    _numberOfUniqueAddresses24hPercentageChange =
        toDouble(json['number_of_unique_addresses_24h_percentage_change']);
    _totalSupply = toInt(json['total_supply']);
    _links = toMap<dynamic>(json['links']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['contract_address'] = _contractAddress;
    data['asset_platform_id'] = _assetPlatformId;
    data['name'] = _name;
    data['symbol'] = _symbol;
    data['image'] = _image;
    data['description'] = _description;
    data['native_currency'] = _nativeCurrency;
    data['floor_price'] = _floorPrice;
    data['market_cap'] = _marketCap;
    data['volume_24h'] = _volume24h;
    data['floor_price_in_usd_24h_percentage_change'] =
        _floorPriceInUsd24hPercentageChange;
    data['number_of_unique_addresses'] = _numberOfUniqueAddresses;
    data['number_of_unique_addresses_24h_percentage_change'] =
        _numberOfUniqueAddresses24hPercentageChange;
    data['total_supply'] = _totalSupply;
    data['links'] = _links;
    return data;
  }
}
