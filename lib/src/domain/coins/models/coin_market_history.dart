import 'package:coingecko_client/src/models/base_model.dart';
import 'package:coingecko_client/src/models/historical_data.dart';

class CoinMarketHistory extends BaseModel {
  List<HistoricalData>? _prices;
  List<HistoricalData>? _marketCaps;
  List<HistoricalData>? _totalVolumes;

  CoinMarketHistory(
      {List<HistoricalData>? prices,
      List<HistoricalData>? marketCaps,
      List<HistoricalData>? totalVolumes}) {
    _prices = prices;
    _marketCaps = marketCaps;
    _totalVolumes = totalVolumes;
  }

  List<HistoricalData>? get prices => _prices;
  List<HistoricalData>? get marketCaps => _marketCaps;
  List<HistoricalData>? get totalVolumes => _totalVolumes;

  /// Converts the raw json data(contained in a Map or List) to a CoinMarketHistory object
  CoinMarketHistory.fromJson(Map<String, dynamic> json) {
    _prices = json['prices'] != null
        ? List<dynamic>.of(json['prices'])
            .map((e) => HistoricalData.fromJson(e))
            .toList()
        : null;
    _marketCaps = json['market_caps'] != null
        ? List<dynamic>.of(json['market_caps'])
            .map((e) => HistoricalData.fromJson(e))
            .toList()
        : null;
    _totalVolumes = json['total_volumes'] != null
        ? List<dynamic>.of(json['total_volumes'])
            .map((e) => HistoricalData.fromJson(e))
            .toList()
        : null;
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['prices'] = _prices?.map((e) => e.toJson()).toList();
    data['market_caps'] = _marketCaps?.map((e) => e.toJson()).toList();
    data['total_volumes'] = _totalVolumes?.map((e) => e.toJson()).toList();
    return data;
  }
}
