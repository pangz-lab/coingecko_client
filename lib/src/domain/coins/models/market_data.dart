import 'package:coingecko_client/src/domain/coins/models/roi.dart';
import 'package:coingecko_client/src/models/base_model.dart';

/// Market data definition. Use in providing the list of market
/// data when obtaining coin information
class MarketData extends BaseModel {
  Map<String, dynamic>? _currentPrice;
  Map<String, dynamic>? _totalValueLocked;
  double? _mcapToTvlRatio;
  double? _fdvToTvlRatio;
  Roi? _roi;
  Map<String, dynamic>? _ath;
  Map<String, dynamic>? _athChangePercentage;
  Map<String, dynamic>? _athDate;
  Map<String, dynamic>? _atl;
  Map<String, dynamic>? _atlChangePercentage;
  Map<String, dynamic>? _atlDate;
  Map<String, dynamic>? _marketCap;
  int? _marketCapRank;
  Map<String, dynamic>? _fullyDilutedValuation;
  Map<String, dynamic>? _totalVolume;
  Map<String, dynamic>? _high24h;
  Map<String, dynamic>? _low24h;
  double? _priceChange24h;
  double? _priceChangePercentage24h;
  double? _priceChangePercentage7d;
  double? _priceChangePercentage14d;
  double? _priceChangePercentage30d;
  double? _priceChangePercentage60d;
  double? _priceChangePercentage200d;
  double? _priceChangePercentage1y;
  double? _marketCapChange24h;
  double? _marketCapChangePercentage24h;
  Map<String, dynamic>? _priceChange24hInCurrency;
  Map<String, dynamic>? _priceChangePercentage1hInCurrency;
  Map<String, dynamic>? _priceChangePercentage24hInCurrency;
  Map<String, dynamic>? _priceChangePercentage7dInCurrency;
  Map<String, dynamic>? _priceChangePercentage14dInCurrency;
  Map<String, dynamic>? _priceChangePercentage30dInCurrency;
  Map<String, dynamic>? _priceChangePercentage60dInCurrency;
  Map<String, dynamic>? _priceChangePercentage200dInCurrency;
  Map<String, dynamic>? _priceChangePercentage1yInCurrency;
  Map<String, dynamic>? _marketCapChange24hInCurrency;
  Map<String, dynamic>? _marketCapChangePercentage24hInCurrency;
  int? _totalSupply;
  int? _maxSupply;
  int? _circulatingSupply;
  Map<String, dynamic>? _sparkline7d;
  DateTime? _lastUpdated;

  MarketData(
      {Map<String, dynamic>? currentPrice,
      Map<String, dynamic>? totalValueLocked,
      double? mcapToTvlRatio,
      double? fdvToTvlRatio,
      Roi? roi,
      Map<String, dynamic>? ath,
      Map<String, dynamic>? athChangePercentage,
      Map<String, dynamic>? athDate,
      Map<String, dynamic>? atl,
      Map<String, dynamic>? atlChangePercentage,
      Map<String, dynamic>? atlDate,
      Map<String, dynamic>? marketCap,
      int? marketCapRank,
      Map<String, dynamic>? fullyDilutedValuation,
      Map<String, dynamic>? totalVolume,
      Map<String, dynamic>? high24h,
      Map<String, dynamic>? low24h,
      double? priceChange24h,
      double? priceChangePercentage24h,
      double? priceChangePercentage7d,
      double? priceChangePercentage14d,
      double? priceChangePercentage30d,
      double? priceChangePercentage60d,
      double? priceChangePercentage200d,
      double? priceChangePercentage1y,
      double? marketCapChange24h,
      double? marketCapChangePercentage24h,
      Map<String, dynamic>? priceChange24hInCurrency,
      Map<String, dynamic>? priceChangePercentage1hInCurrency,
      Map<String, dynamic>? priceChangePercentage24hInCurrency,
      Map<String, dynamic>? priceChangePercentage7dInCurrency,
      Map<String, dynamic>? priceChangePercentage14dInCurrency,
      Map<String, dynamic>? priceChangePercentage30dInCurrency,
      Map<String, dynamic>? priceChangePercentage60dInCurrency,
      Map<String, dynamic>? priceChangePercentage200dInCurrency,
      Map<String, dynamic>? priceChangePercentage1yInCurrency,
      Map<String, dynamic>? marketCapChange24hInCurrency,
      Map<String, dynamic>? marketCapChangePercentage24hInCurrency,
      int? totalSupply,
      int? maxSupply,
      int? circulatingSupply,
      Map<String, dynamic>? sparkline7d,
      DateTime? lastUpdated}) {
    _currentPrice = currentPrice;
    _totalValueLocked = totalValueLocked;
    _mcapToTvlRatio = mcapToTvlRatio;
    _fdvToTvlRatio = fdvToTvlRatio;
    _roi = roi;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _priceChangePercentage7d = priceChangePercentage7d;
    _priceChangePercentage14d = priceChangePercentage14d;
    _priceChangePercentage30d = priceChangePercentage30d;
    _priceChangePercentage60d = priceChangePercentage60d;
    _priceChangePercentage200d = priceChangePercentage200d;
    _priceChangePercentage1y = priceChangePercentage1y;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _priceChange24hInCurrency = priceChange24hInCurrency;
    _priceChangePercentage1hInCurrency = priceChangePercentage1hInCurrency;
    _priceChangePercentage24hInCurrency = priceChangePercentage24hInCurrency;
    _priceChangePercentage7dInCurrency = priceChangePercentage7dInCurrency;
    _priceChangePercentage14dInCurrency = priceChangePercentage14dInCurrency;
    _priceChangePercentage30dInCurrency = priceChangePercentage30dInCurrency;
    _priceChangePercentage60dInCurrency = priceChangePercentage60dInCurrency;
    _priceChangePercentage200dInCurrency = priceChangePercentage200dInCurrency;
    _priceChangePercentage1yInCurrency = priceChangePercentage1yInCurrency;
    _marketCapChange24hInCurrency = marketCapChange24hInCurrency;
    _marketCapChangePercentage24hInCurrency =
        marketCapChangePercentage24hInCurrency;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _circulatingSupply = circulatingSupply;
    _sparkline7d = sparkline7d;
    _lastUpdated = lastUpdated;
  }

  Map<String, dynamic>? get currentPrice => _currentPrice;
  Map<String, dynamic>? get totalValueLocked => _totalValueLocked;
  double? get mcapToTvlRatio => _mcapToTvlRatio;
  double? get fdvToTvlRatio => _fdvToTvlRatio;
  Roi? get roi => _roi;
  Map<String, dynamic>? get ath => _ath;
  Map<String, dynamic>? get athChangePercentage => _athChangePercentage;
  Map<String, dynamic>? get athDate => _athDate;
  Map<String, dynamic>? get atl => _atl;
  Map<String, dynamic>? get atlChangePercentage => _atlChangePercentage;
  Map<String, dynamic>? get atlDate => _atlDate;
  Map<String, dynamic>? get marketCap => _marketCap;
  int? get marketCapRank => _marketCapRank;
  Map<String, dynamic>? get fullyDilutedValuation => _fullyDilutedValuation;
  Map<String, dynamic>? get totalVolume => _totalVolume;
  Map<String, dynamic>? get high24h => _high24h;
  Map<String, dynamic>? get low24h => _low24h;
  double? get priceChange24h => _priceChange24h;
  double? get priceChangePercentage24h => _priceChangePercentage24h;
  double? get priceChangePercentage7d => _priceChangePercentage7d;
  double? get priceChangePercentage14d => _priceChangePercentage14d;
  double? get priceChangePercentage30d => _priceChangePercentage30d;
  double? get priceChangePercentage60d => _priceChangePercentage60d;
  double? get priceChangePercentage200d => _priceChangePercentage200d;
  double? get priceChangePercentage1y => _priceChangePercentage1y;
  double? get marketCapChange24h => _marketCapChange24h;
  double? get marketCapChangePercentage24h => _marketCapChangePercentage24h;
  Map<String, dynamic>? get priceChange24hInCurrency =>
      _priceChange24hInCurrency;
  Map<String, dynamic>? get priceChangePercentage1hInCurrency =>
      _priceChangePercentage1hInCurrency;
  Map<String, dynamic>? get priceChangePercentage24hInCurrency =>
      _priceChangePercentage24hInCurrency;
  Map<String, dynamic>? get priceChangePercentage7dInCurrency =>
      _priceChangePercentage7dInCurrency;
  Map<String, dynamic>? get priceChangePercentage14dInCurrency =>
      _priceChangePercentage14dInCurrency;
  Map<String, dynamic>? get priceChangePercentage30dInCurrency =>
      _priceChangePercentage30dInCurrency;
  Map<String, dynamic>? get priceChangePercentage60dInCurrency =>
      _priceChangePercentage60dInCurrency;
  Map<String, dynamic>? get priceChangePercentage200dInCurrency =>
      _priceChangePercentage200dInCurrency;
  Map<String, dynamic>? get priceChangePercentage1yInCurrency =>
      _priceChangePercentage1yInCurrency;
  Map<String, dynamic>? get marketCapChange24hInCurrency =>
      _marketCapChange24hInCurrency;
  Map<String, dynamic>? get marketCapChangePercentage24hInCurrency =>
      _marketCapChangePercentage24hInCurrency;
  int? get totalSupply => _totalSupply;
  int? get maxSupply => _maxSupply;
  int? get circulatingSupply => _circulatingSupply;
  Map<String, dynamic>? get sparkline7d => _sparkline7d;
  DateTime? get lastUpdated => _lastUpdated;

  /// Converts the raw json data(contained in a Map or List) to a MarketData object
  MarketData.fromJson(Map<String, dynamic> json) {
    _currentPrice = toMap<dynamic>(json['current_price']);
    _totalValueLocked = toMap<dynamic>(json['total_value_locked']);
    _mcapToTvlRatio = toDouble(json['mcap_to_tvl_ratio']);
    _fdvToTvlRatio = toDouble(json['fdv_to_tvl_ratio']);
    _roi = json['roi'] != null ? Roi.fromJson(json['roi']) : null;
    _ath = toMap<dynamic>(json['ath']);
    _athChangePercentage = toMap<dynamic>(json['ath_change_percentage']);
    _athDate = toMap<dynamic>(json['ath_date']);
    _atl = toMap<dynamic>(json['atl']);
    _atlChangePercentage = toMap<dynamic>(json['atl_change_percentage']);
    _atlDate = toMap<dynamic>(json['atl_date']);
    _marketCap = toMap<dynamic>(json['market_cap']);
    _marketCapRank = toInt(json['market_cap_rank']);
    _fullyDilutedValuation = toMap<dynamic>(json['fully_diluted_valuation']);
    _totalVolume = toMap<dynamic>(json['total_volume']);
    _high24h = toMap<dynamic>(json['high_24h']);
    _low24h = toMap<dynamic>(json['low_24h']);
    _priceChange24h = toDouble(json['price_change_24h']);
    _priceChangePercentage24h = toDouble(json['price_change_percentage_24h']);
    _priceChangePercentage7d = toDouble(json['price_change_percentage_7d']);
    _priceChangePercentage14d = toDouble(json['price_change_percentage_14d']);
    _priceChangePercentage30d = toDouble(json['price_change_percentage_30d']);
    _priceChangePercentage60d = toDouble(json['price_change_percentage_60d']);
    _priceChangePercentage200d = toDouble(json['price_change_percentage_200d']);
    _priceChangePercentage1y = toDouble(json['price_change_percentage_1y']);
    _marketCapChange24h = toDouble(json['market_cap_change_24h']);
    _marketCapChangePercentage24h =
        toDouble(json['market_cap_change_percentage_24h']);
    _priceChange24hInCurrency =
        toMap<dynamic>(json['price_change_24h_in_currency']);
    _priceChangePercentage1hInCurrency =
        toMap<dynamic>(json['price_change_percentage_1h_in_currency']);
    _priceChangePercentage24hInCurrency =
        toMap<dynamic>(json['price_change_percentage_24h_in_currency']);
    _priceChangePercentage7dInCurrency =
        toMap<dynamic>(json['price_change_percentage_7d_in_currency']);
    _priceChangePercentage14dInCurrency =
        toMap<dynamic>(json['price_change_percentage_14d_in_currency']);
    _priceChangePercentage30dInCurrency =
        toMap<dynamic>(json['price_change_percentage_30d_in_currency']);
    _priceChangePercentage60dInCurrency =
        toMap<dynamic>(json['price_change_percentage_60d_in_currency']);
    _priceChangePercentage200dInCurrency =
        toMap<dynamic>(json['price_change_percentage_200d_in_currency']);
    _priceChangePercentage1yInCurrency =
        toMap<dynamic>(json['price_change_percentage_1y_in_currency']);
    _marketCapChange24hInCurrency =
        toMap<dynamic>(json['market_cap_change_24h_in_currency']);
    _marketCapChangePercentage24hInCurrency =
        toMap<dynamic>(json['market_cap_change_percentage_24h_in_currency']);
    _totalSupply = toInt(json['total_supply']);
    _maxSupply = toInt(json['max_supply']);
    _circulatingSupply = toInt(json['circulating_supply']);
    _sparkline7d = toMap<dynamic>(json['sparkline_7d']);
    _lastUpdated = toDate(json['last_updated']);
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['current_price'] = _currentPrice;
    data['total_value_locked'] = _totalValueLocked;
    data['mcap_to_tvl_ratio'] = _mcapToTvlRatio;
    data['fdv_to_tvl_ratio'] = _fdvToTvlRatio;
    data['roi'] = _roi?.toJson();
    data['ath'] = _ath;
    data['ath_change_percentage'] = _athChangePercentage;
    data['ath_date'] = _athDate;
    data['atl'] = _atl;
    data['atl_change_percentage'] = _atlChangePercentage;
    data['atl_date'] = _atlDate;
    data['market_cap'] = _marketCap;
    data['market_cap_rank'] = _marketCapRank;
    data['fully_diluted_valuation'] = _fullyDilutedValuation;
    data['total_volume'] = _totalVolume;
    data['high_24h'] = _high24h;
    data['low_24h'] = _low24h;
    data['price_change_24h'] = _priceChange24h;
    data['price_change_percentage_24h'] = _priceChangePercentage24h;
    data['price_change_percentage_7d'] = _priceChangePercentage7d;
    data['price_change_percentage_14d'] = _priceChangePercentage14d;
    data['price_change_percentage_30d'] = _priceChangePercentage30d;
    data['price_change_percentage_60d'] = _priceChangePercentage60d;
    data['price_change_percentage_200d'] = _priceChangePercentage200d;
    data['price_change_percentage_1y'] = _priceChangePercentage1y;
    data['market_cap_change_24h'] = _marketCapChange24h;
    data['market_cap_change_percentage_24h'] = _marketCapChangePercentage24h;
    data['price_change_24h_in_currency'] = _priceChange24hInCurrency;
    data['price_change_percentage_1h_in_currency'] =
        _priceChangePercentage1hInCurrency;
    data['price_change_percentage_24h_in_currency'] =
        _priceChangePercentage24hInCurrency;
    data['price_change_percentage_7d_in_currency'] =
        _priceChangePercentage7dInCurrency;
    data['price_change_percentage_14d_in_currency'] =
        _priceChangePercentage14dInCurrency;
    data['price_change_percentage_30d_in_currency'] =
        _priceChangePercentage30dInCurrency;
    data['price_change_percentage_60d_in_currency'] =
        _priceChangePercentage60dInCurrency;
    data['price_change_percentage_200d_in_currency'] =
        _priceChangePercentage200dInCurrency;
    data['price_change_percentage_1y_in_currency'] =
        _priceChangePercentage1yInCurrency;
    data['market_cap_change_24h_in_currency'] = _marketCapChange24hInCurrency;
    data['market_cap_change_percentage_24h_in_currency'] =
        _marketCapChangePercentage24hInCurrency;
    data['total_supply'] = _totalSupply;
    data['max_supply'] = _maxSupply;
    data['circulating_supply'] = _circulatingSupply;
    data['sparkline_7d'] = _sparkline7d;
    data['last_updated'] = _lastUpdated.toString();
    return data;
  }
}
