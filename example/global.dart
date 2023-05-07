import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  try {
    var client = CoinGeckoClient();

    /// sample call for - /global
    var cryptoInfo = await client.global.getCryptoInfo();
    print(cryptoInfo);
    print(cryptoInfo.activeCryptocurrencies);
    print(cryptoInfo.endedIcos);
    /// sample call for - /global/decentralized_finance_defi
    var defiInfo = await client.global.getDefiInfo();
    print(defiInfo);
    print(defiInfo.ethMarketCap);
    print(defiInfo.defiToEthRatio);
  

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