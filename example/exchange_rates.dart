import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /exchange_rates
  var list = await client.exchangeRates.getList();
  print(list.length);
  print(list.first);
  print(list.first.name);
  print(list.first.type);
}