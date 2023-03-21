import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class TrendingEndpoint extends EndpointBase {
  String _path = "";
  TrendingEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Get trending search coins (Top-7) on CoinGecko in the last 24 hours
  /// 
  /// Top-7 trending coins on CoinGecko as searched by users in the last 24 hours (Ordered by most popular first)
  Future<Response> getSearchTrending() async {
    _path = '/search/trending';
    return await send(_path);
  }
}