import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class SearchEndpoint extends EndpointBase {
  String _path = "";
  SearchEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);
  
  /// Search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first
  /// <br/><b>Endpoint </b>: /search
  /// 
  /// [query] Search string
  Future<Response> getSearch({
    required String query
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'query': query
      },
      endpointPath: "/search"
    );
    return await send(_path);
  }
}