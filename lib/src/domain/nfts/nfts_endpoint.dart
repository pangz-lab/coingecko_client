import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class NftsEndpoint extends EndpointBase {
  String _path = "";
  NftsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all supported NFT ids, paginated by 100 items per page, paginated to 100 items
  /// 
  /// Use this to obtain all the NFT ids in order to make API calls, paginated to 100 items
  /// 
  /// [order] valid values: <b>h24_volume_native_asc, h24_volume_native_desc, floor_price_native_asc, floor_price_native_desc, market_cap_native_asc, market_cap_native_desc, market_cap_usd_asc, market_cap_usd_desc</b>
  /// [asset_platform_id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [per_page] Total results per page
  /// [page] Page through results
  Future<Response> getNftsList({
    String? order,
    String? assetPlatformId,
    int? perPage,
    int? page
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'order': order,
        'asset_platform_id': assetPlatformId,
        'per_page': perPage,
        'page': page
      },
      endpointPath: "/nfts/list"
    );
    return await send(_path);
  }

  /// Get current data (name, price_floor, volume_24h ...) for an NFT collection. native_currency (string) is only a representative of the currency.
  /// 
  /// [id] id of nft collection (can be obtained from /nfts/list)
  Future<Response> getNftsWithId({
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id
      },
      endpointPath: "/nfts/{id}"
    );
    return await send(_path);
  }

  /// Get current data (name, price_floor, volume_24h ...) for an NFT collection
  /// 
  /// [asset_platform_id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options, use filter=nft param)
  /// [contract_address] The contract_address of the nft collection (/nfts/list for list of nft collection with metadata)
  Future<Response> getNftsWithAssetPlatformIdContractWithContractAddress({
    required String assetPlatformId,
    required String contractAddress
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'asset_platform_id': assetPlatformId,
        'contract_address': contractAddress
      },
      endpointPath: "/nfts/{asset_platform_id}/contract/{contract_address}"
    );
    return await send(_path);
  }
}