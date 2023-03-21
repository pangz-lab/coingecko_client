import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class SearchEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/search";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  SearchEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

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