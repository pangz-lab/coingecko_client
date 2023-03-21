import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class PingEndpoint extends EndpointBase {
  String _path = "";
  PingEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Check API server status
  /// <br/><b>Endpoint </b>: /ping
  Future<Response> call() async {
    _path = '/ping';
    return await send(_path);
  }
}