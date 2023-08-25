import 'package:coingecko_client/coingecko_client.dart';

///Coins top ranking results
class CoinRankingResult extends BaseModel {
  List<CoinRankingInfo>? _topGainers;
  List<CoinRankingInfo>? _topLosers;
  CoinRankingResult(
      {List<CoinRankingInfo>? topGainers, List<CoinRankingInfo>? topLosers}) {
    _topGainers = topGainers;
    _topLosers = topLosers;
  }

  List<CoinRankingInfo>? get topGainers => _topGainers;
  List<CoinRankingInfo>? get topLosers => _topLosers;

  /// Converts the raw json data(contained in a Map) to a CoinRankingResult object
  CoinRankingResult.fromJson(Map<String, dynamic> json, Currencies vsCurrency) {
    _topGainers = List<dynamic>.of(json['top_gainers'])
        .map((value) => CoinRankingInfo.fromJson(value, vsCurrency))
        .toList();
    _topLosers = List<dynamic>.of(json['top_losers'])
        .map((value) => CoinRankingInfo.fromJson(value, vsCurrency))
        .toList();
  }
}
