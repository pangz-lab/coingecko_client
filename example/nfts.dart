import 'package:coingecko_client/coingecko_client.dart';

void main() async {

  try {
    var client = CoinGeckoClient();

    /// sample call for - /nfts/list
    var list = await client.nfts.getBasicList(
      perPage: 10,
      page: 2
    );
    print(list.length);
    print(list.first.runtimeType);
    print(list.first.id);
    print(list.first.name);
    print(list.first.symbol);
    /// sample call for - /nfts/{id}
    var info = await client.nfts.getInfo(
      id: 'meebits',
    );
    print(info);
    print(info.id);
    print(info.name);
    print(info.assetPlatformId);
    print(info.description);

    /// sample call for - /nfts/{asset_platform_id}/contract/{contract_address}
    var contractInfo = await client.nfts.getContractInfo(
      assetPlatformId: 'ethereum',
      contractAddress: '0x36F379400DE6c6BCDF4408B282F8b685c56adc60',
    );
    print(contractInfo);
    print(contractInfo.id);
    print(contractInfo.name);
    print(contractInfo.assetPlatformId);
    print(contractInfo.description);
  

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