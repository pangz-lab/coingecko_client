import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /ping
  var result = await client.ping.getResult();
  print(result);
}