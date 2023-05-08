import 'package:coingecko_client/src/domain/coins/models/coin_market_history.dart';

/// A wrapper class of CoinMarketHistory.<br>
/// Used mainly for getting coin info from contract address.<br>
class ContractMarketHistory extends CoinMarketHistory {
  ContractMarketHistory.fromJson(super.json) : super.fromJson();
}
