import 'package:coingecko_client/src/models/base_model.dart';

class GlobalDefiInfo extends BaseModel {
  String? _defiMarketCap;
  String? _ethMarketCap;
  String? _defiToEthRatio;
  String? _tradingVolume24h;
  String? _defiDominance;
  String? _topCoinName;
  double? _topCoinDefiDominance;

  GlobalDefiInfo({
    String? defiMarketCap,
    String? ethMarketCap,
    String? defiToEthRatio,
    String? tradingVolume24h,
    String? defiDominance,
    String? topCoinName,
    double? topCoinDefiDominance
  }) {

    _defiMarketCap = defiMarketCap;
    _ethMarketCap = ethMarketCap;
    _defiToEthRatio = defiToEthRatio;
    _tradingVolume24h = tradingVolume24h;
    _defiDominance = defiDominance;
    _topCoinName = topCoinName;
    _topCoinDefiDominance = topCoinDefiDominance;
  }

  String? get defiMarketCap => _defiMarketCap;
  String? get ethMarketCap => _ethMarketCap;
  String? get defiToEthRatio => _defiToEthRatio;
  String? get tradingVolume24h => _tradingVolume24h;
  String? get defiDominance => _defiDominance;
  String? get topCoinName => _topCoinName;
  double? get topCoinDefiDominance => _topCoinDefiDominance;

  GlobalDefiInfo.fromJson(Map<String, dynamic> json) {
    _defiMarketCap = json['defi_market_cap'];
    _ethMarketCap = json['eth_market_cap'];
    _defiToEthRatio = json['defi_to_eth_ratio'];
    _tradingVolume24h = json['trading_volume_24h'];
    _defiDominance = json['defi_dominance'];
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
