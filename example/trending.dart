import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();
  
  /// sample call for - /search/trending
  var result = client.trending.getResult();
  print(result);
}