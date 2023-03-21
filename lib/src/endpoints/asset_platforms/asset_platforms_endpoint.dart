import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class AssetPlatformsEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/asset_platforms";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  AssetPlatformsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

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