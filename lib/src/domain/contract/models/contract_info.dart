import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';

/// A wrapper class of CoinInfo.
/// Used mainly for getting coin info from a contract address.
class ContractInfo extends CoinInfo {
  ContractInfo.fromJson(super.json) : super.fromJson();
}
