import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class PingEndpoint extends BaseEndpoint {
  String _path = "";
  PingEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Check API server status
  /// <br/><b>Endpoint </b>: /ping
  Future<Response> call() async {
    _path = '/ping';
    return await send(_path);
  }
}