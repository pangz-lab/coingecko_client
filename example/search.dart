import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    var client = CoinGeckoClient();

    /// sample call for - /search
    final result = await client.search.getResult(query: 'bybit');
    print(result);
    print(result.keys);
    print(result.values);
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
