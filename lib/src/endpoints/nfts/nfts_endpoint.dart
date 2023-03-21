import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class NftsEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/nfts (beta)";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  NftsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

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

  Future<Response> getNftsWithId({
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id
      },
      endpointPath: "/nfts/$id"
    );
    return await send(_path);
  }

  Future<Response> getNftsWithAssetPlatformIdContractWithContractAddress({
    required String assetPlatformId,
    required String contractAddress
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'asset_platform_id': assetPlatformId,
        'contract_address': contractAddress
      },
      endpointPath: "/nfts/$assetPlatformId/contract/$contractAddress"
    );
    return await send(_path);
  }
}