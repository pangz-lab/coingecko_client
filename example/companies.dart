import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /companies/public_treasury/{coin_id}
  var list = await client.companies.getList(
    coinId: 'ethereum'
  );
  print(list);
  print(list.companies?.length);
}