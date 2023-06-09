import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/models/base_model.dart';

/// Provides a list of tickers for a specifc coin.
/// Mainly used for retrieving coin data.
class CoinTickers extends BaseModel {
  String? _name;
  List<TickerInfo>? _tickers;

  CoinTickers({String? name, List<TickerInfo>? tickers}) {
    _name = name;
    _tickers = tickers;
  }

  String? get name => _name;
  List<TickerInfo>? get tickers => _tickers;

  /// Converts the raw json data(contained in a Map or List) to a CoinTickers object
  CoinTickers.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _tickers = json['tickers'] != null
        ? List<dynamic>.of(json['tickers'])
            .map((e) => TickerInfo.fromJson(e))
            .toList()
        : null;
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = _name;
    data['tickers'] = _tickers?.map((e) => e.toJson()).toList();
    return data;
  }
}
