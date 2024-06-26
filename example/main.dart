import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    final client = CoinGeckoClient();

    /// sample call for - /ping
    final result = await client.ping.getResult();
    print(result);
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
