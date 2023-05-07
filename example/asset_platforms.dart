import 'package:coingecko_client/coingecko_client.dart';

void main() async {
  try {
    var client = CoinGeckoClient();

    /// sample call for - /asset_platforms
    var result = await client.assetPlatforms.getList();
    print(result.first.runtimeType);
    print(result.first.id);
    print(result.first.name);
    print(result.first.shortName);
  

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