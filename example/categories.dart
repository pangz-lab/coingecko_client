import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    var client = CoinGeckoClient();

    /// sample call for - /coins/categories/list
    var basicList = await client.categories.getBasicList();
    print(basicList.first.runtimeType);
    print(basicList.length);

    /// sample call for - /coins/categories
    var list = await client.categories
        .getList(order: CoinCategoriesDataOrdering.marketCapAsc);
    print(list.first.runtimeType);
    print(list.length);
  } on NetworkRequestException catch (e, _) {
    print(e.message);
  } on FormatException catch (e, _) {
    print(e.message);
  } on TypeError catch (e, _) {
    print(e.stackTrace);
  } catch (_) {
    /// Do something here or just rethrow
    rethrow;
  }
}
