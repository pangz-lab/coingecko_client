import 'package:coingecko_client/src/models/base_model.dart';

class DerivativesTickerInfo extends BaseModel {
  String? _symbol;
  String? _base;
  String? _target;
  String? _tradeUrl;
  String? _contractType;
  double? _last;
  double? _h24PercentageChange;
  double? _index;
  double? _indexBasisPercentage;
  double? _bidAskSpread;
  double? _fundingRate;
  double? _openInterestUsd;
  double? _h24Volume;
  Map<String, dynamic>? _convertedVolume;
  Map<String, dynamic>? _convertedLast;
  DateTime? _lastTraded;
  DateTime? _expiredAt;

  DerivativesTickerInfo({
    String? symbol,
    String? base,
    String? target,
    String? tradeUrl,
    String? contractType,
    double? last,
    double? h24PercentageChange,
    double? index,
    double? indexBasisPercentage,
    double? bidAskSpread,
    double? fundingRate,
    double? openInterestUsd,
    double? h24Volume,
    Map<String, dynamic>? convertedVolume,
    Map<String, dynamic>? convertedLast,
    DateTime? lastTraded,
    DateTime? expiredAt
  }) {

    _symbol = symbol;
    _base = base;
    _target = target;
    _tradeUrl = tradeUrl;
    _contractType = contractType;
    _last = last;
    _h24PercentageChange = h24PercentageChange;
    _index = index;
    _indexBasisPercentage = indexBasisPercentage;
    _bidAskSpread = bidAskSpread;
    _fundingRate = fundingRate;
    _openInterestUsd = openInterestUsd;
    _h24Volume = h24Volume;
    _convertedVolume = convertedVolume;
    _convertedLast = convertedLast;
    _lastTraded = lastTraded;
    _expiredAt = expiredAt;
  }

  String? get symbol => _symbol;
  String? get base => _base;
  String? get target => _target;
  String? get tradeUrl => _tradeUrl;
  String? get contractType => _contractType;
  double? get last => _last;
  double? get h24PercentageChange => _h24PercentageChange;
  double? get index => _index;
  double? get indexBasisPercentage => _indexBasisPercentage;
  double? get bidAskSpread => _bidAskSpread;
  double? get fundingRate => _fundingRate;
  double? get openInterestUsd => _openInterestUsd;
  double? get h24Volume => _h24Volume;
  Map<String, dynamic>? get convertedVolume => _convertedVolume;
  Map<String, dynamic>? get convertedLast => _convertedLast;
  DateTime? get lastTraded => _lastTraded;
  DateTime? get expiredAt => _expiredAt;

  DerivativesTickerInfo.fromJson(Map<String, dynamic> json) {
    _symbol = json['symbol'];
    _base = json['base'];
    _target = json['target'];
    _tradeUrl = json['trade_url'];
    _contractType = json['contract_type'];
    _last = toDouble(json['last']);
    _h24PercentageChange = toDouble(json['h24_percentage_change']);
    _index = toDouble(json['index']);
    _indexBasisPercentage = toDouble(json['index_basis_percentage']);
    _bidAskSpread = toDouble(json['bid_ask_spread']);
    _fundingRate = toDouble(json['funding_rate']);
    _openInterestUsd = toDouble(json['open_interest_usd']);
    _h24Volume = toDouble(json['h24_volume']);
    _convertedVolume = toMap<dynamic>(json['converted_volume']);
    _convertedLast = toMap<dynamic>(json['converted_last']);
    _lastTraded = toDateFromTimestamp(json['last_traded']);
    _expiredAt = toDateFromTimestamp(json['expired_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['symbol'] = _symbol;
    data['base'] = _base;
    data['target'] = _target;
    data['trade_url'] = _tradeUrl;
    data['contract_type'] = _contractType;
    data['last'] = _last;
    data['h24_percentage_change'] = _h24PercentageChange;
    data['index'] = _index;
    data['index_basis_percentage'] = _indexBasisPercentage;
    data['bid_ask_spread'] = _bidAskSpread;
    data['funding_rate'] = _fundingRate;
    data['open_interest_usd'] = _openInterestUsd;
    data['h24_volume'] = _h24Volume;
    data['converted_volume'] = _convertedVolume;
    data['converted_last'] = _convertedLast;
    data['last_traded'] = _lastTraded;
    data['expired_at'] = _expiredAt;
    return data;
  }
}
