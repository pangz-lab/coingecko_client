import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class TrendingEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/trending";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  TrendingEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getSearchTrending() async {
    _path = '/search/trending';
    return await send(_path);
  }
}