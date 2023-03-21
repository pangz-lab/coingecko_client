import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class AssetPlatformsEndpoint extends EndpointBase {
  String _path = "";
  AssetPlatformsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all asset platforms (Blockchain networks)
  /// 
  /// List all asset platforms
  /// 
  /// [filter] apply relevant filters to results
  ///  valid values: "nft" (asset_platform nft-support)
  Future<Response> getAssetPlatforms({
    String? filter
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'filter': filter
      },
      endpointPath: "/asset_platforms"
    );
    return await send(_path);
  }
}