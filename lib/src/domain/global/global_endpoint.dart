import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class GlobalEndpoint extends EndpointBase {
  String _path = "";
  GlobalEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Get cryptocurrency global data
  /// endpoint : /global
  Future<Response> getGlobal() async {
    _path = '/global';
    return await send(_path);
  }

  /// Get Top 100 Cryptocurrency Global Eecentralized Finance(defi) data
  /// endpoint : /global/decentralized_finance_defi
  Future<Response> getGlobalDecentralizedFinanceDefi() async {
    _path = '/global/decentralized_finance_defi';
    return await send(_path);
  }
}