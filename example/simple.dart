import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /simple/price
  var coinPrice = await client.simple.getCoinPrice(
    ids: ['verus-coin'],
    vsCurrencies: [Currencies.php, Currencies.jpy, Currencies.usd]
  );
  print(coinPrice);

  /// sample call for - /simple/token_price/{id}
  var tokenPrice = await client.simple.getTokenPrice(
    id: 'ethereum',
    contractAddresses: ['0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'],
    vsCurrencies: [
      Currencies.php,
      CryptoCurrencies.btc,
      CryptoCurrencies.eth,
      CustomCurrency.from('try'),
      CustomCurrency.from('ppc'),
    ]
  );
  print(tokenPrice);

  /// sample call for - /simple/supported_vs_currencies
  var listResult = await client.simple.getSupportedVsCurrencies();
  print(listResult);

}