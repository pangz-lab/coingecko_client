import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /coins/categories/list
  var basicList = await client.categories.getBasicList();
  print(basicList.first.runtimeType);
  print(basicList.length);
  
  /// sample call for - /coins/categories
  var list = await client.categories.getList(
    order: CoinCategoriesDataOrdering.marketCapAsc
  );
  print(list.first.runtimeType);
  print(list.length);
}