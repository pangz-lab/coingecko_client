import 'package:coingecko_client/src/models/base_model.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_ticker_info.dart';

/// Derivatives exchange main information.
class DerivativesExchange extends BaseModel {
  String? _name;
  String? _id;
  double? _openInterestBtc;
  double? _tradeVolume24hBtc;
  int? _numberOfPerpetualPairs;
  int? _numberOfFuturesPairs;
  String? _image;
  int? _yearEstablished;
  String? _country;
  String? _description;
  String? _url;
  List<DerivativesTickerInfo>? _tickers;

  DerivativesExchange(
      {String? name,
      String? id,
      double? openInterestBtc,
      double? tradeVolume24hBtc,
      int? numberOfPerpetualPairs,
      int? numberOfFuturesPairs,
      String? image,
      int? yearEstablished,
      String? country,
      String? description,
      String? url,
      List<DerivativesTickerInfo>? tickers}) {
    _name = name;
    _id = id;
    _openInterestBtc = openInterestBtc;
    _tradeVolume24hBtc = tradeVolume24hBtc;
    _numberOfPerpetualPairs = numberOfPerpetualPairs;
    _numberOfFuturesPairs = numberOfFuturesPairs;
    _image = image;
    _yearEstablished = yearEstablished;
    _country = country;
    _description = description;
    _url = url;
    _tickers = tickers;
  }

  String? get name => _name;
  String? get id => _id;
  double? get openInterestBtc => _openInterestBtc;
  double? get tradeVolume24hBtc => _tradeVolume24hBtc;
  int? get numberOfPerpetualPairs => _numberOfPerpetualPairs;
  int? get numberOfFuturesPairs => _numberOfFuturesPairs;
  String? get image => _image;
  int? get yearEstablished => _yearEstablished;
  String? get country => _country;
  String? get description => _description;
  String? get url => _url;
  List<DerivativesTickerInfo>? get tickers => _tickers;

  /// Converts the raw json data(contained in a Map or List) to a DerivativesExchange object
  DerivativesExchange.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _id = json['id'];
    _openInterestBtc = toDouble(json['open_interest_btc']);
    _tradeVolume24hBtc = toDouble(json['trade_volume_24h_btc']);
    _numberOfPerpetualPairs = toInt(json['number_of_perpetual_pairs']);
    _numberOfFuturesPairs = toInt(json['number_of_futures_pairs']);
    _image = json['image'];
    _yearEstablished = toInt(json['year_established']);
    _country = json['country'];
    _description = json['description'];
    _url = json['url'];
    _tickers = json['tickers'] != null
        ? List<dynamic>.of(json['tickers'])
            .map((e) => DerivativesTickerInfo.fromJson(e))
            .toList()
        : null;
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = _name;
    data['id'] = _id;
    data['open_interest_btc'] = _openInterestBtc;
    data['trade_volume_24h_btc'] = _tradeVolume24hBtc;
    data['number_of_perpetual_pairs'] = _numberOfPerpetualPairs;
    data['number_of_futures_pairs'] = _numberOfFuturesPairs;
    data['image'] = _image;
    data['year_established'] = _yearEstablished;
    data['country'] = _country;
    data['description'] = _description;
    data['url'] = _url;
    data['tickers'] = _tickers;
    return data;
  }
}
