import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class SearchEndpoint extends BaseEndpoint {
  String _path = "";
  SearchEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});
  
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