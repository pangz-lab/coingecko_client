import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platforms_filter.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class AssetPlatformsEndpoint extends EndpointBase {
  String _path = "";
  AssetPlatformsEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all asset platforms (Blockchain networks)
  /// <br/><b>Endpoint </b>: /asset_platforms
  /// 
  /// [filter] apply relevant filters to results
  ///  valid values: "nft" (asset_platform nft-support)
  Future<Response> getAssetPlatforms({
    AssetPlatformsFilter? filter
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'filter': filter?.name ?? ''
      },
      endpointPath: "/asset_platforms"
    );
    return await send(_path);
  }
}