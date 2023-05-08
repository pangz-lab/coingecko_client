import 'package:coingecko_client/src/models/base_model.dart';

// Contains summary information of the global top 100 defis.
class GlobalDefiInfo extends BaseModel {
  double? _defiMarketCap;
  double? _ethMarketCap;
  double? _defiToEthRatio;
  double? _tradingVolume24h;
  double? _defiDominance;
  String? _topCoinName;
  double? _topCoinDefiDominance;

  GlobalDefiInfo(
      {double? defiMarketCap,
      double? ethMarketCap,
      double? defiToEthRatio,
      double? tradingVolume24h,
      double? defiDominance,
      String? topCoinName,
      double? topCoinDefiDominance}) {
    _defiMarketCap = defiMarketCap;
    _ethMarketCap = ethMarketCap;
    _defiToEthRatio = defiToEthRatio;
    _tradingVolume24h = tradingVolume24h;
    _defiDominance = defiDominance;
    _topCoinName = topCoinName;
    _topCoinDefiDominance = topCoinDefiDominance;
  }

  double? get defiMarketCap => _defiMarketCap;
  double? get ethMarketCap => _ethMarketCap;
  double? get defiToEthRatio => _defiToEthRatio;
  double? get tradingVolume24h => _tradingVolume24h;
  double? get defiDominance => _defiDominance;
  String? get topCoinName => _topCoinName;
  double? get topCoinDefiDominance => _topCoinDefiDominance;

  GlobalDefiInfo.fromJson(Map<String, dynamic> json) {
    _defiMarketCap = toDouble(json['defi_market_cap']);
    _ethMarketCap = toDouble(json['eth_market_cap']);
    _defiToEthRatio = toDouble(json['defi_to_eth_ratio']);
    _tradingVolume24h = toDouble(json['trading_volume_24h']);
    _defiDominance = toDouble(json['defi_dominance']);
    _topCoinName = json['top_coin_name'];
    _topCoinDefiDominance = toDouble(json['top_coin_defi_dominance']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['defi_market_cap'] = _defiMarketCap;
    data['eth_market_cap'] = _ethMarketCap;
    data['defi_to_eth_ratio'] = _defiToEthRatio;
    data['trading_volume_24h'] = _tradingVolume24h;
    data['defi_dominance'] = _defiDominance;
    data['top_coin_name'] = _topCoinName;
    data['top_coin_defi_dominance'] = _topCoinDefiDominance;
    return data;
  }
}
