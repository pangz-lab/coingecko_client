import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class IndexesEndpoint extends EndpointBase {
  String _path = "";
  IndexesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all market indexes
  /// 
  /// [per_page] Total results per page
  /// [page] Page through results
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

  /// Get market index by market id and index id
  /// 
  /// [market_id] pass the market id (can be obtained from /exchanges/list)
  /// [id] pass the index id (can be obtained from /indexes/list)
  Future<Response> getIndexesWithMarketIdWithId({
    required String marketId,
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'market_id': marketId,
        'id': id
      },
      endpointPath: "/indexes/{market_id}/{id}"
    );
    return await send(_path);
  }

  /// List market indexes id and name
  Future<Response> getIndexesList() async {
    _path = '/indexes/list';
    return await send(_path);
  }
}