import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /global
  var cryptoInfo = await client.global.getCryptoInfo();
  print(cryptoInfo);
  print(cryptoInfo.activeCryptocurrencies);
  print(cryptoInfo.endedIcos);
  /// sample call for - /global/decentralized_finance_defi
  var defiInfo = await client.global.getDefiInfo();
  print(defiInfo);
  print(defiInfo.ethMarketCap);
  print(defiInfo.defiToEthRatio);

}