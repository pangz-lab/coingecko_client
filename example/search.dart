import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /search
  var result = await client.search.getResult(query: 'bybit');
  print(result);
  print(result.keys);
  print(result.values);
}