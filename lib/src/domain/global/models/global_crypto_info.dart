import 'package:coingecko_client/src/models/base_model.dart';

/// Contains summary information of the global top 100 cryptos.
class GlobalCryptoInfo extends BaseModel {
  int? _activeCryptocurrencies;
  int? _upcomingIcos;
  int? _ongoingIcos;
  int? _endedIcos;
  int? _markets;
  Map<String, dynamic>? _totalMarketCap;
  Map<String, dynamic>? _totalVolume;
  Map<String, dynamic>? _marketCapPercentage;
  double? _marketCapChangePercentage24hUsd;
  DateTime? _updatedAt;

  GlobalCryptoInfo(
      {int? activeCryptocurrencies,
      int? upcomingIcos,
      int? ongoingIcos,
      int? endedIcos,
      int? markets,
      Map<String, dynamic>? totalMarketCap,
      Map<String, dynamic>? totalVolume,
      Map<String, dynamic>? marketCapPercentage,
      double? marketCapChangePercentage24hUsd,
      DateTime? updatedAt}) {
    _activeCryptocurrencies = activeCryptocurrencies;
    _upcomingIcos = upcomingIcos;
    _ongoingIcos = ongoingIcos;
    _endedIcos = endedIcos;
    _markets = markets;
    _totalMarketCap = totalMarketCap;
    _totalVolume = totalVolume;
    _marketCapPercentage = marketCapPercentage;
    _marketCapChangePercentage24hUsd = marketCapChangePercentage24hUsd;
    _updatedAt = updatedAt;
  }

  int? get activeCryptocurrencies => _activeCryptocurrencies;
  int? get upcomingIcos => _upcomingIcos;
  int? get ongoingIcos => _ongoingIcos;
  int? get endedIcos => _endedIcos;
  int? get markets => _markets;
  Map<String, dynamic>? get totalMarketCap => _totalMarketCap;
  Map<String, dynamic>? get totalVolume => _totalVolume;
  Map<String, dynamic>? get marketCapPercentage => _marketCapPercentage;
  double? get marketCapChangePercentage24hUsd =>
      _marketCapChangePercentage24hUsd;
  DateTime? get updatedAt => _updatedAt;

  GlobalCryptoInfo.fromJson(Map<String, dynamic> json) {
    _activeCryptocurrencies = toInt(json['active_cryptocurrencies']);
    _upcomingIcos = toInt(json['upcoming_icos']);
    _ongoingIcos = toInt(json['ongoing_icos']);
    _endedIcos = toInt(json['ended_icos']);
    _markets = toInt(json['markets']);
    _totalMarketCap = toMap<dynamic>(json['total_market_cap']);
    _totalVolume = toMap<dynamic>(json['total_volume']);
    _marketCapPercentage = toMap<dynamic>(json['market_cap_percentage']);
    _marketCapChangePercentage24hUsd =
        toDouble(json['market_cap_change_percentage_24h_usd']);
    _updatedAt = toDateFromTimestamp(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['active_cryptocurrencies'] = _activeCryptocurrencies;
    data['upcoming_icos'] = _upcomingIcos;
    data['ongoing_icos'] = _ongoingIcos;
    data['ended_icos'] = _endedIcos;
    data['markets'] = _markets;
    data['total_market_cap'] = _totalMarketCap;
    data['total_volume'] = _totalVolume;
    data['market_cap_percentage'] = _marketCapPercentage;
    data['market_cap_change_percentage_24h_usd'] =
        _marketCapChangePercentage24hUsd;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
