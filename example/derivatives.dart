import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  var client = CoinGeckoClient();

  /// sample call for - /derivatives
  var list = await client.derivatives.getList(
    includeTickers: DerivativesTickers.unexpired
  );
  print(list.first.runtimeType);
  print(list.first.contractType);
  print(list.first.price);
  /// sample call for - /derivatives/exchanges
  var exchangeList = await client.derivatives.getExchangeList(
    order: DerivativesExchangeOrdering.nameAsc,
    perPage: 10,
    page: 2
  );
  print(exchangeList.first.runtimeType);
  print(exchangeList.first.id);
  print(exchangeList.first.name);
  print(exchangeList.first.country);
  print(exchangeList.first.description);

  /// sample call for - /derivatives/exchanges/{id}
  var exchange = await client.derivatives.getExchange(
    id: "bybit",
    includeTickers: DerivativesTickers.unexpired
  );
  print(exchange);
  print(exchange.id);
  print(exchange.name);
  print(exchange.country);

  /// sample call for - /derivatives/exchanges/list
  var exchangeBasicInfoList = await client.derivatives.getExchangeBasicInfoList();
  print(exchangeBasicInfoList.first.runtimeType);
  print(exchangeBasicInfoList.length);
  print(exchangeBasicInfoList.first.id);
  print(exchangeBasicInfoList.first.name);

}