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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['prices'] = _prices;
    data['market_caps'] = _marketCaps;
    data['total_volumes'] = _totalVolumes;
    return data;
  }
}
