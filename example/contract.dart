import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  try {
    var client = CoinGeckoClient();

    /// sample call for - /coins/{id}/contract/{contract_address}/market_chart
    var marketHistory = await client.contract.getMarketHistory(
      id: 'ethereum',
      contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
      vsCurrency: Currencies.jpy,
      days : DataRange.in2Weeks,
    );
    print(marketHistory);
    print(marketHistory.totalVolumes?.length);
    print(marketHistory.prices?.length);
    
    /// sample call for - /coins/{id}/contract/{contract_address}/market_chart/range
    var marketHistoryWithDateRange = await client.contract.getMarketHistoryWithDateRange(
      id: 'ethereum',
      contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
      vsCurrency: Currencies.php,
      from: DateTime.fromMillisecondsSinceEpoch(1683175446, isUtc: true),
      to: DateTime.fromMillisecondsSinceEpoch(1683262856, isUtc: true),
    );
    print(marketHistoryWithDateRange);
    print(marketHistoryWithDateRange.totalVolumes?.length);
    print(marketHistoryWithDateRange.prices?.length);

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