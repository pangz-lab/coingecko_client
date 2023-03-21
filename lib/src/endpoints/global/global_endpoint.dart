import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class GlobalEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/global";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  GlobalEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getGlobal() async {
    _path = '/global';
    return await send(_path);
  }

  Future<Response> getGlobalDecentralizedFinanceDefi() async {
    _path = '/global/decentralized_finance_defi';
    return await send(_path);
  }
}