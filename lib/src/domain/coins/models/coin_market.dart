import 'package:coingecko_client/src/domain/coins/models/roi.dart';
import 'package:coingecko_client/src/models/base_model.dart';

/// Contains the coin market data used when getting all the coin market list
/// or just getting an information about a specific market.
class CoinMarket extends BaseModel {
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  double? _currentPrice;
  double? _marketCap;
  int? _marketCapRank;
  int? _fullyDilutedValuation;
  double? _totalVolume;
  double? _high24h;
  double? _low24h;
  double? _priceChange24h;
  double? _priceChangePercentage24h;
  double? _marketCapChange24h;
  double? _marketCapChangePercentage24h;
  double? _circulatingSupply;
  double? _totalSupply;
  double? _maxSupply;
  double? _ath;
  double? _athChangePercentage;
  DateTime? _athDate;
  double? _atl;
  double? _atlChangePercentage;
  DateTime? _atlDate;
  Roi? _roi;
  DateTime? _lastUpdated;
  Map<String, dynamic>? _sparklineIn7d;
  double? _priceChangePercentage14dInCurrency;
  double? _priceChangePercentage1hInCurrency;
  double? _priceChangePercentage1yInCurrency;
  double? _priceChangePercentage200dInCurrency;
  double? _priceChangePercentage24hInCurrency;
  double? _priceChangePercentage30dInCurrency;
  double? _priceChangePercentage7dInCurrency;

  CoinMarket({
    String? id,
    String? symbol,
    String? name,
    String? image,
    double? currentPrice,
    double? marketCap,
    int? marketCapRank,
    int? fullyDilutedValuation,
    double? totalVolume,
    double? high24h,
    double? low24h,
    double? priceChange24h,
    double? priceChangePercentage24h,
    double? marketCapChange24h,
    double? marketCapChangePercentage24h,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    double? ath,
    double? athChangePercentage,
    DateTime? athDate,
    double? atl,
    double? atlChangePercentage,
    DateTime? atlDate,
    Roi? roi,
    DateTime? lastUpdated,
    Map<String, List<dynamic>>? sparklineIn7d,
    double? priceChangePercentage14dInCurrency,
    double? priceChangePercentage1hInCurrency,
    double? priceChangePercentage1yInCurrency,
    double? priceChangePercentage200dInCurrency,
    double? priceChangePercentage24hInCurrency,
    double? priceChangePercentage30dInCurrency,
    double? priceChangePercentage7dInCurrency,
  }) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _currentPrice = currentPrice;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _roi = roi;
    _lastUpdated = lastUpdated;
    _sparklineIn7d = sparklineIn7d;
    _priceChangePercentage14dInCurrency = priceChangePercentage14dInCurrency;
    _priceChangePercentage1hInCurrency = priceChangePercentage1hInCurrency;
    _priceChangePercentage1yInCurrency = priceChangePercentage1yInCurrency;
    _priceChangePercentage200dInCurrency = priceChangePercentage200dInCurrency;
    _priceChangePercentage24hInCurrency = priceChangePercentage24hInCurrency;
    _priceChangePercentage30dInCurrency = priceChangePercentage30dInCurrency;
    _priceChangePercentage7dInCurrency = priceChangePercentage7dInCurrency;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get image => _image;
  double? get currentPrice => _currentPrice;
  double? get marketCap => _marketCap;
  int? get marketCapRank => _marketCapRank;
  int? get fullyDilutedValuation => _fullyDilutedValuation;
  double? get totalVolume => _totalVolume;
  double? get high24h => _high24h;
  double? get low24h => _low24h;
  double? get priceChange24h => _priceChange24h;
  double? get priceChangePercentage24h => _priceChangePercentage24h;
  double? get marketCapChange24h => _marketCapChange24h;
  double? get marketCapChangePercentage24h => _marketCapChangePercentage24h;
  double? get circulatingSupply => _circulatingSupply;
  double? get totalSupply => _totalSupply;
  double? get maxSupply => _maxSupply;
  double? get ath => _ath;
  double? get athChangePercentage => _athChangePercentage;
  DateTime? get athDate => _athDate;
  double? get atl => _atl;
  double? get atlChangePercentage => _atlChangePercentage;
  DateTime? get atlDate => _atlDate;
  Roi? get roi => _roi;
  DateTime? get lastUpdated => _lastUpdated;
  Map<String, dynamic>? get sparklineIn7d => _sparklineIn7d;
  double? get priceChangePercentage14dInCurrency =>
      _priceChangePercentage14dInCurrency;
  double? get priceChangePercentage1hInCurrency =>
      _priceChangePercentage1hInCurrency;
  double? get priceChangePercentage1yInCurrency =>
      _priceChangePercentage1yInCurrency;
  double? get priceChangePercentage200dInCurrency =>
      _priceChangePercentage200dInCurrency;
  double? get priceChangePercentage24hInCurrency =>
      _priceChangePercentage24hInCurrency;
  double? get priceChangePercentage30dInCurrency =>
      _priceChangePercentage30dInCurrency;
  double? get priceChangePercentage7dInCurrency =>
      _priceChangePercentage7dInCurrency;

  /// Converts the raw json data(contained in a Map or List) to a CoinMarket object
  CoinMarket.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _image = json['image'];
    _currentPrice = toDouble(json['current_price']);
    _marketCap = toDouble(json['market_cap']);
    _marketCapRank = toInt(json['market_cap_rank']);
    _fullyDilutedValuation = toInt(json['fully_diluted_valuation']);
    _totalVolume = toDouble(json['total_volume']);
    _high24h = toDouble(json['high_24h']);
    _low24h = toDouble(json['low_24h']);
    _priceChange24h = toDouble(json['price_change_24h']);
    _priceChangePercentage24h = toDouble(json['price_change_percentage_24h']);
    _marketCapChange24h = toDouble(json['market_cap_change_24h']);
    _marketCapChangePercentage24h =
        toDouble(json['market_cap_change_percentage_24h']);
    _circulatingSupply = toDouble(json['circulating_supply']);
    _totalSupply = toDouble(json['total_supply']);
    _maxSupply = toDouble(json['max_supply']);
    _ath = toDouble(json['ath']);
    _athChangePercentage = toDouble(json['ath_change_percentage']);
    _athDate = toDate(json['ath_date']);
    _atl = toDouble(json['atl']);
    _atlChangePercentage = toDouble(json['atl_change_percentage']);
    _atlDate = toDate(json['atl_date']);
    _roi = json['roi'] != null ? Roi.fromJson(json['roi']) : null;
    _lastUpdated = toDate(json['last_updated']);
    _sparklineIn7d = toMap<dynamic>(json['sparkline_in_7d']);
    _priceChangePercentage14dInCurrency =
        toDouble(json['price_change_percentage_14d_in_currency']);
    _priceChangePercentage1hInCurrency =
        toDouble(json['price_change_percentage_1h_in_currency']);
    _priceChangePercentage1yInCurrency =
        toDouble(json['price_change_percentage_1y_in_currency']);
    _priceChangePercentage200dInCurrency =
        toDouble(json['price_change_percentage_200d_in_currency']);
    _priceChangePercentage24hInCurrency =
        toDouble(json['price_change_percentage_24h_in_currency']);
    _priceChangePercentage30dInCurrency =
        toDouble(json['price_change_percentage_30d_in_currency']);
    _priceChangePercentage7dInCurrency =
        toDouble(json['price_change_percentage_7d_in_currency']);
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['image'] = _image;
    data['current_price'] = _currentPrice;
    data['market_cap'] = _marketCap;
    data['market_cap_rank'] = _marketCapRank;
    data['fully_diluted_valuation'] = _fullyDilutedValuation;
    data['total_volume'] = _totalVolume;
    data['high_24h'] = _high24h;
    data['low_24h'] = _low24h;
    data['price_change_24h'] = _priceChange24h;
    data['price_change_percentage_24h'] = _priceChangePercentage24h;
    data['market_cap_change_24h'] = _marketCapChange24h;
    data['market_cap_change_percentage_24h'] = _marketCapChangePercentage24h;
    data['circulating_supply'] = _circulatingSupply;
    data['total_supply'] = _totalSupply;
    data['max_supply'] = _maxSupply;
    data['ath'] = _ath;
    data['ath_change_percentage'] = _athChangePercentage;
    data['ath_date'] = _athDate.toString();
    data['atl'] = _atl;
    data['atl_change_percentage'] = _atlChangePercentage;
    data['atl_date'] = _atlDate.toString();
    data['roi'] = _roi;
    data['last_updated'] = _lastUpdated.toString();
    data['sparkline_in_7d'] = _sparklineIn7d;
    data['price_change_percentage_14d_in_currency'] =
        _priceChangePercentage14dInCurrency;
    data['price_change_percentage_1h_in_currency'] =
        _priceChangePercentage1hInCurrency;
    data['price_change_percentage_1y_in_currency'] =
        _priceChangePercentage1yInCurrency;
    data['price_change_percentage_200d_in_currency'] =
        _priceChangePercentage200dInCurrency;
    data['price_change_percentage_24h_in_currency'] =
        _priceChangePercentage24hInCurrency;
    data['price_change_percentage_30d_in_currency'] =
        _priceChangePercentage30dInCurrency;
    data['price_change_percentage_7d_in_currency'] =
        _priceChangePercentage7dInCurrency;
    return data;
  }
}
