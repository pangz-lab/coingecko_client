import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/market_exchange_status.dart';
import 'package:coingecko_client/src/models/base_model.dart';

class MarketExchangeInfo extends BaseModel {
  String? _id;
  String? _name;
  int? _yearEstablished;
  String? _country;
  String? _description;
  String? _url;
  String? _image;
  String? _facebookUrl;
  String? _redditUrl;
  String? _telegramUrl;
  String? _slackUrl;
  String? _otherUrl1;
  String? _otherUrl2;
  String? _twitterHandle;
  bool? _hasTradingIncentive;
  bool? _centralized;
  String? _publicNotice;
  String? _alertNotice;
  int? _trustScore;
  int? _trustScoreRank;
  double? _tradeVolume24hBtc;
  double? _tradeVolume24hBtcNormalized;
  List<TickerInfo>? _tickers;
  List<MarketExchangeStatus>? _statusUpdates;

  MarketExchangeInfo({
    String? id,
    String? name,
    int? yearEstablished,
    String? country,
    String? description,
    String? url,
    String? image,
    String? facebookUrl,
    String? redditUrl,
    String? telegramUrl,
    String? slackUrl,
    String? otherUrl1,
    String? otherUrl2,
    String? twitterHandle,
    bool? hasTradingIncentive,
    bool? centralized,
    String? publicNotice,
    String? alertNotice,
    int? trustScore,
    int? trustScoreRank,
    double? tradeVolume24hBtc,
    double? tradeVolume24hBtcNormalized,
    List<TickerInfo>? tickers,
    List<MarketExchangeStatus>? statusUpdates,
  }) {
    _id = id;
    _name = name;
    _yearEstablished = yearEstablished;
    _country = country;
    _description = description;
    _url = url;
    _image = image;
    _facebookUrl = facebookUrl;
    _redditUrl = redditUrl;
    _telegramUrl = telegramUrl;
    _slackUrl = slackUrl;
    _otherUrl1 = otherUrl1;
    _otherUrl2 = otherUrl2;
    _twitterHandle = twitterHandle;
    _hasTradingIncentive = hasTradingIncentive;
    _centralized = centralized;
    _publicNotice = publicNotice;
    _alertNotice = alertNotice;
    _trustScore = trustScore;
    _trustScoreRank = trustScoreRank;
    _tradeVolume24hBtc = tradeVolume24hBtc;
    _tradeVolume24hBtcNormalized = tradeVolume24hBtcNormalized;
    _tickers = tickers;
    _statusUpdates = statusUpdates;
  }

  String? get id => _id;
  String? get name => _name;
  int? get yearEstablished => _yearEstablished;
  String? get country => _country;
  String? get description => _description;
  String? get url => _url;
  String? get image => _image;
  String? get facebookUrl => _facebookUrl;
  String? get redditUrl => _redditUrl;
  String? get telegramUrl => _telegramUrl;
  String? get slackUrl => _slackUrl;
  String? get otherUrl1 => _otherUrl1;
  String? get otherUrl2 => _otherUrl2;
  String? get twitterHandle => _twitterHandle;
  bool? get hasTradingIncentive => _hasTradingIncentive;
  bool? get centralized => _centralized;
  String? get publicNotice => _publicNotice;
  String? get alertNotice => _alertNotice;
  int? get trustScore => _trustScore;
  int? get trustScoreRank => _trustScoreRank;
  double? get tradeVolume24hBtc => _tradeVolume24hBtc;
  double? get tradeVolume24hBtcNormalized => _tradeVolume24hBtcNormalized;
  List<TickerInfo>? get tickers => _tickers;
  List<MarketExchangeStatus>? get statusUpdates => _statusUpdates;

  MarketExchangeInfo.fromJson(Map<String?, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _yearEstablished = toInt(json['year_established']);
    _country = json['country'];
    _description = json['description'];
    _url = json['url'];
    _image = json['image'];
    _facebookUrl = json['facebook_url'];
    _redditUrl = json['reddit_url'];
    _telegramUrl = json['telegram_url'];
    _slackUrl = json['slack_url'];
    _otherUrl1 = json['other_url_1'];
    _otherUrl2 = json['other_url_2'];
    _twitterHandle = json['twitter_handle'];
    _hasTradingIncentive = json['has_trading_incentive'];
    _centralized = json['centralized'];
    _publicNotice = json['public_notice'];
    _alertNotice = json['alert_notice'];
    _trustScore = toInt(json['trust_score']);
    _trustScoreRank = toInt(json['trust_score_rank']);
    _tradeVolume24hBtc = toDouble(json['trade_volume_24h_btc']);
    _tradeVolume24hBtcNormalized = toDouble(json['trade_volume_24h_btc_normalized']);
    _tickers = json['tickers'] != null ? List.from(json['tickers']).map((v) => TickerInfo.fromJson(v)).toList() : null;
    _statusUpdates = json['status_updates'] != null ? List.from(json['status_updates']).map((v) => MarketExchangeStatus.fromJson(v)).toList() : null;
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
    data['facebook_url'] = _facebookUrl;
    data['reddit_url'] = _redditUrl;
    data['telegram_url'] = _telegramUrl;
    data['slack_url'] = _slackUrl;
    data['other_url_1'] = _otherUrl1;
    data['other_url_2'] = _otherUrl2;
    data['twitter_handle'] = _twitterHandle;
    data['has_trading_incentive'] = _hasTradingIncentive;
    data['centralized'] = _centralized;
    data['public_notice'] = _publicNotice;
    data['alert_notice'] = _alertNotice;
    data['trust_score'] = _trustScore;
    data['trust_score_rank'] = _trustScoreRank;
    data['trade_volume_24h_btc'] = _tradeVolume24hBtc;
    data['trade_volume_24h_btc_normalized'] = _tradeVolume24hBtcNormalized;
    data['tickers'] = _tickers?.map((e) => e.toJson()).toList();
    data['status_updates'] = _statusUpdates?.map((e) => e.toJson()).toList();
    return data;
  }
}
