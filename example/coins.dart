import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    var client = CoinGeckoClient();

    /// sample call for - /coins/list
    var result = await client.coins.getBasicList();
    var firstCoin = result.first;
    var lastCoin = result.last;
    print(firstCoin);
    print(lastCoin);
    print(firstCoin.name);
    print(lastCoin.name);

    /// sample call for - /coins/{id}/history
    var coinHistory =
        await client.coins.getHistory(id: 'verus-coin', date: DateTime.now());
    print(coinHistory);
    print(coinHistory.name);

    /// sample call for - /coins/markets
    var coinMarket =
        await client.coins.getMarketList(vsCurrency: Currencies.php);
    var firstMarket = coinMarket.first;
    var lastMarket = coinMarket.last;
    print(firstMarket);
    print(lastMarket);
    print(firstMarket.id);
    print(lastMarket.id);

    /// sample call for - /coins/{id}
    var coinInfo = await client.coins.getInfo(id: 'verus-coin');
    print(coinInfo);
    print(coinInfo.name);
    print(coinInfo.blockTimeInMinutes);
    print(coinInfo.description?['en']);
    print(coinInfo.description?['jp']);

    /// sample call for - /coins/{id}/tickers
    var coinTickers = await client.coins.getTickers(id: 'verus-coin');
    print(coinTickers);
    print(coinTickers.tickers?.length);

    /// sample call for - /coins/{id}/market_chart
    var coinMarketHistory = await client.coins.getMarketHistory(
        id: 'verus-coin',
        vsCurrency: Currencies.php,
        days: DataRange.in1Day,
        interval: 'daily');
    print(coinMarketHistory);
    print(coinMarketHistory.marketCaps);
    print(coinMarketHistory.prices);

    /// sample call for - /coins/{id}/market_chart/range
    var coinMarketHistoryWithDateRange = await client.coins
        .getMarketHistoryWithDateRange(
            id: 'verus-coin',
            vsCurrency: Currencies.php,
            from: DateTime.fromMillisecondsSinceEpoch(1392577232),
            to: DateTime.fromMillisecondsSinceEpoch(1396587232));
    print(coinMarketHistoryWithDateRange);
    print(coinMarketHistoryWithDateRange.marketCaps?.length);

    /// sample call for - /coins/{id}/ohlc
    var coinOhlc = await client.coins.getOhlcList(
        id: 'verus-coin', vsCurrency: Currencies.php, days: DataRange.max);
    print(coinOhlc.first.runtimeType);
    print(coinOhlc.length);
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
