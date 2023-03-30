import 'package:coingecko_client/src/models/base_model.dart';

class CoinMarketChart extends BaseModel {
  List<dynamic>? _prices;
  List<dynamic>? _marketCaps;
  List<dynamic>? _totalVolumes;

  CoinMarketChart({
    List<dynamic>? prices,
    List<dynamic>? marketCaps,
    List<dynamic>? totalVolumes
  }) {
    _prices = prices;
    _marketCaps = marketCaps;
    _totalVolumes = totalVolumes;
  }
  
  List<dynamic>? get prices => _prices;
  List<dynamic>? get marketCaps => _marketCaps;
  List<dynamic>? get totalVolumes => _totalVolumes;

  CoinMarketChart.fromJson(Map<String, dynamic> json) {
    _prices = json['prices'] != null 
      ? List<dynamic>.of(json['prices']).map((e) => List<dynamic>.from(e)).toList() 
      : null;
    _marketCaps = json['market_caps'] != null 
      ? List<dynamic>.of(json['market_caps']).map((e) => List<dynamic>.from(e)).toList() 
      : null;
    _totalVolumes = json['total_volumes'] != null 
      ? List<dynamic>.of(json['total_volumes']).map((e) => List<dynamic>.from(e)).toList() 
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
