import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class PingEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/ping";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  PingEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getPing() async {
    _path = '/ping';
    return await send(_path);
  }
}