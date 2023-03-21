import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class PingEndpoint extends EndpointBase {
  String _path = "";
  PingEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Check API server status
  Future<Response> getPing() async {
    _path = '/ping';
    return await send(_path);
  }
}