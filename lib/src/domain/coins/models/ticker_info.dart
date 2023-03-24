import 'package:coingecko_client/src/models/base_model.dart';

class TickerInfo extends BaseModel {
  String? _base;
  String? _target;
  Map<String, dynamic>? _market;
  double? _last;
  double? _volume;
  Map<String, dynamic>? _convertedLast;
  Map<String, dynamic>? _convertedVolume;
  double? _trustScore;
  double? _bidAskSpreadPercentage;
  DateTime? _timestamp;
  DateTime? _lastTradedAt;
  DateTime? _lastFetchAt;
  bool? _isAnomaly;
  bool? _isStale;
  String? _tradeUrl;
  String? _tokenInfoUrl;
  String? _coinId;
  String? _targetCoinId;

  TickerInfo({
    String? base,
    String? target,
    Map<String, dynamic>? market,
    double? last,
    double? volume,
    Map<String, dynamic>? convertedLast,
    Map<String, dynamic>? convertedVolume,
    double? trustScore,
    double? bidAskSpreadPercentage,
    DateTime? timestamp,
    DateTime? lastTradedAt,
    DateTime? lastFetchAt,
    bool? isAnomaly,
    bool? isStale,
    String? tradeUrl,
    String? tokenInfoUrl,
    String? coinId,
    String? targetCoinId
  }) {
    _base = base;
    _target = target;
    _market = market;
    _last = last;
    _volume = volume;
    _convertedLast = convertedLast;
    _convertedVolume = convertedVolume;
    _trustScore = trustScore;
    _bidAskSpreadPercentage = bidAskSpreadPercentage;
    _timestamp = timestamp;
    _lastTradedAt = lastTradedAt;
    _lastFetchAt = lastFetchAt;
    _isAnomaly = isAnomaly;
    _isStale = isStale;
    _tradeUrl = tradeUrl;
    _tokenInfoUrl = tokenInfoUrl;
    _coinId = coinId;
    _targetCoinId = targetCoinId;
  }

  String? get base => _base;
  String? get target => _target;
  Map<String, dynamic>? get market => _market;
  double? get last => _last;
  double? get volume => _volume;
  Map<String, dynamic>? get convertedLast => _convertedLast;
  Map<String, dynamic>? get convertedVolume => _convertedVolume;
  double? get trustScore => _trustScore;
  double? get bidAskSpreadPercentage => _bidAskSpreadPercentage;
  DateTime? get timestamp => _timestamp;
  DateTime? get lastTradedAt => _lastTradedAt;
  DateTime? get lastFetchAt => _lastFetchAt;
  bool? get isAnomaly => _isAnomaly;
  bool? get isStale => _isStale;
  String? get tradeUrl => _tradeUrl;
  String? get tokenInfoUrl => _tokenInfoUrl;
  String? get coinId => _coinId;
  String? get targetCoinId => _targetCoinId;

  TickerInfo.fromJson(Map<String, dynamic> json) {
    _base = json['base'];
    _target = json['target'];
    _market = toMap<dynamic>(json['market']);
    _last = toDouble(json['last']);
    _volume = toDouble(json['volume']);
    _convertedLast = toMap<dynamic>(json['converted_last']);
    _convertedVolume = toMap<dynamic>(json['converted_volume']);
    _trustScore = toDouble(json['trust_score']);
    _bidAskSpreadPercentage = toDouble(json['bid_ask_spread_percentage']);
    _timestamp = toDate(json['timestamp']);
    _lastTradedAt = toDate(json['last_traded_at']);
    _lastFetchAt = toDate(json['last_fetch_at']);
    _isAnomaly = json['is_anomaly'];
    _isStale = json['is_stale'];
    _tradeUrl = json['trade_url'];
    _tokenInfoUrl = json['token_info_url'];
    _coinId = json['coin_id'];
    _targetCoinId = json['target_coin_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['base'] = _base;
    data['target'] = _target;
    data['market'] = _market;
    data['last'] = _last;
    data['volume'] = _volume;
    data['converted_last'] = _convertedLast;
    data['converted_volume'] = _convertedVolume;
    data['trust_score'] = _trustScore;
    data['bid_ask_spread_percentage'] = _bidAskSpreadPercentage;
    data['timestamp'] = _timestamp;
    data['last_traded_at'] = _lastTradedAt;
    data['last_fetch_at'] = _lastFetchAt;
    data['is_anomaly'] = _isAnomaly;
    data['is_stale'] = _isStale;
    data['trade_url'] = _tradeUrl;
    data['token_info_url'] = _tokenInfoUrl;
    data['coin_id'] = _coinId;
    data['target_coin_id'] = _targetCoinId;
    return data;
  }
}
