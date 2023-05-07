import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  try {
    var client = CoinGeckoClient();

    /// sample call for - /exchange_rates
    var list = await client.exchangeRates.getList();
    print(list.length);
    print(list.first);
    print(list.first.name);
    print(list.first.type);

  } on NetworkRequestException catch (e, _){
    print(e.message);
  } on FormatException catch (e, _){
    print(e.message);
  } on TypeError catch (e, _){
    print(e.stackTrace);
  } catch(_) {
    rethrow;
  }
}