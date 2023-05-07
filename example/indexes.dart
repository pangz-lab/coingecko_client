import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    var client = CoinGeckoClient();

    /// sample call for - /indexes
    var list = await client.indexes.getList(perPage: 10, page: 2);
    print(list.first);
    print(list.length);
    print(list.first.id);
    print(list.first.name);
    print(list.first.market);

    /// sample call for - /indexes/{market_id}/{id}
    var info = await client.indexes.getInfo(
      marketId: 'bybit',
      id: 'HOT',
    );
    print(info);
    print(info.last);
    print(info.market);

    /// sample call for - /indexes/list
    var basicInfo = await client.indexes.getBasicInfoList();
    print(basicInfo.first.runtimeType);
    print(basicInfo.length);
    print(basicInfo.first.id);
    print(basicInfo.first.name);
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
