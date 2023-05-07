import 'package:coingecko_client/src/models/base_model.dart';

class Derivatives extends BaseModel {
  String? _market;
  String? _symbol;
  String? _indexId;
  double? _price;
  double? _pricePercentageChange24h;
  String? _contractType;
  double? _index;
  double? _basis;
  double? _spread;
  double? _fundingRate;
  double? _openInterest;
  double? _volume24h;
  DateTime? _lastTradedAt;
  DateTime? _expiredAt;

  Derivatives(
      {String? market,
      String? symbol,
      String? indexId,
      double? price,
      double? pricePercentageChange24h,
      String? contractType,
      double? index,
      double? basis,
      double? spread,
      double? fundingRate,
      double? openInterest,
      double? volume24h,
      DateTime? lastTradedAt,
      DateTime? expiredAt}) {
    _market = market;
    _symbol = symbol;
    _indexId = indexId;
    _price = price;
    _pricePercentageChange24h = pricePercentageChange24h;
    _contractType = contractType;
    _index = index;
    _basis = basis;
    _spread = spread;
    _fundingRate = fundingRate;
    _openInterest = openInterest;
    _volume24h = volume24h;
    _lastTradedAt = lastTradedAt;
    _expiredAt = expiredAt;
  }

  String? get market => _market;
  String? get symbol => _symbol;
  String? get indexId => _indexId;
  double? get price => _price;
  double? get pricePercentageChange24h => _pricePercentageChange24h;
  String? get contractType => _contractType;
  double? get index => _index;
  double? get basis => _basis;
  double? get spread => _spread;
  double? get fundingRate => _fundingRate;
  double? get openInterest => _openInterest;
  double? get volume24h => _volume24h;
  DateTime? get lastTradedAt => _lastTradedAt;
  DateTime? get expiredAt => _expiredAt;

  Derivatives.fromJson(Map<String, dynamic> json) {
    _market = json['market'];
    _symbol = json['symbol'];
    _indexId = json['index_id'];
    _price = toDouble(json['price']);
    _pricePercentageChange24h = toDouble(json['price_percentage_change_24h']);
    _contractType = json['contract_type'];
    _index = toDouble(json['index']);
    _basis = toDouble(json['basis']);
    _spread = toDouble(json['spread']);
    _fundingRate = toDouble(json['funding_rate']);
    _openInterest = toDouble(json['open_interest']);
    _volume24h = toDouble(json['volume_24h']);
    _lastTradedAt = toDateFromTimestamp(json['last_traded_at']);
    _expiredAt = toDateFromTimestamp(json['expired_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['market'] = _market;
    data['symbol'] = _symbol;
    data['index_id'] = _indexId;
    data['price'] = _price;
    data['price_percentage_change_24h'] = _pricePercentageChange24h;
    data['contract_type'] = _contractType;
    data['index'] = _index;
    data['basis'] = _basis;
    data['spread'] = _spread;
    data['funding_rate'] = _fundingRate;
    data['open_interest'] = _openInterest;
    data['volume_24h'] = _volume24h;
    data['last_traded_at'] = _lastTradedAt;
    data['expired_at'] = _expiredAt;
    return data;
  }
}
