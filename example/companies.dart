import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  try {
    var client = CoinGeckoClient();

    /// sample call for - /companies/public_treasury/{coin_id}
    var list = await client.companies.getList(
      coinId: 'ethereum'
    );
    print(list);
    print(list.companies?.length);

  } on NetworkRequestException catch (e, _){
    print(e.message);
  } on FormatException catch (e, _){
    print(e.message);
  } on TypeError catch (e, _){
    print(e.stackTrace);
  } catch(_) {
    /// Do something here or just rethrow
    rethrow;
  }
}