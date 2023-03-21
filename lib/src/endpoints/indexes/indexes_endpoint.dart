import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class IndexesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/indexes";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  IndexesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getIndexes({
    int? perPage,
    int? page
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'per_page': perPage,
        'page': page
      },
      endpointPath: "/indexes"
    );
    return await send(_path);
  }

  Future<Response> getIndexesWithMarketIdWithId({
    required String marketId,
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'market_id': marketId,
        'id': id
      },
      endpointPath: "/indexes/$marketId/$id"
    );
    return await send(_path);
  }

  Future<Response> getIndexesList() async {
    _path = '/indexes/list';
    return await send(_path);
  }
}