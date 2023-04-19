import 'package:coingecko_client/src/models/base_model.dart';

class ExchangeInfo extends BaseModel {
  String? _id;
  String? _name;
  int? _yearEstablished;
  String? _country;
  String? _description;
  String? _url;
  String? _image;
  bool? _hasTradingIncentive;
  int? _trustScore;
  int? _trustScoreRank;
  double? _tradeVolume24hBtc;
  double? _tradeVolume24hBtcNormalized;

  ExchangeInfo({
    String? id,
    String? name,
    int? yearEstablished,
    String? country,
    String? description,
    String? url,
    String? image,
    bool? hasTradingIncentive,
    int? trustScore,
    int? trustScoreRank,
    double? tradeVolume24hBtc,
    double? tradeVolume24hBtcNormalized
  }) {
    _id = id;
    _name = name;
    _yearEstablished = yearEstablished;
    _country = country;
    _description = description;
    _url = url;
    _image = image;
    _hasTradingIncentive = hasTradingIncentive;
    _trustScore = trustScore;
    _trustScoreRank = trustScoreRank;
    _tradeVolume24hBtc = tradeVolume24hBtc;
    _tradeVolume24hBtcNormalized = tradeVolume24hBtcNormalized;
  }

  String? get id => _id;
  String? get name => _name;
  int? get yearEstablished => _yearEstablished;
  String? get country => _country;
  String? get description => _description;
  String? get url => _url;
  String? get image => _image;
  bool? get hasTradingIncentive => _hasTradingIncentive;
  int? get trustScore => _trustScore;
  int? get trustScoreRank => _trustScoreRank;
  double? get tradeVolume24hBtc => _tradeVolume24hBtc;
  double? get tradeVolume24hBtcNormalized => _tradeVolume24hBtcNormalized;

  ExchangeInfo.fromJson(Map<String?, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _yearEstablished = toInt(json['year_established']);
    _country = json['country'];
    _description = json['description'];
    _url = json['url'];
    _image = json['image'];
    _hasTradingIncentive = json['has_trading_incentive'];
    _trustScore = toInt(json['trust_score']);
    _trustScoreRank = toInt(json['trust_score_rank']);
    _tradeVolume24hBtc = toDouble(json['trade_volume_24h_btc']);
    _tradeVolume24hBtcNormalized = toDouble(json['trade_volume_24h_btc_normalized']);
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    data['year_established'] = _yearEstablished;
    data['country'] = _country;
    data['description'] = _description;
    data['url'] = _url;
    data['image'] = _image;
    data['has_trading_incentive'] = _hasTradingIncentive;
    data['trust_score'] = _trustScore;
    data['trust_score_rank'] = _trustScoreRank;
    data['trade_volume_24h_btc'] = _tradeVolume24hBtc;
    data['trade_volume_24h_btc_normalized'] = _tradeVolume24hBtcNormalized;
    return data;
  }
}
