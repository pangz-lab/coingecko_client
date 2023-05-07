import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /asset_platforms
  var result = await client.assetPlatforms.getList();
  print(result.first.runtimeType);
  print(result.first.id);
  print(result.first.name);
  print(result.first.shortName);
}