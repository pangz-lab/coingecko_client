import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class GlobalEndpoint extends BaseEndpoint {
  String _path = "";
  GlobalEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get cryptocurrency global data
  /// <br/><b>Endpoint </b>: /global
  Future<Response> getGlobal() async {
    _path = '/global';
    return await send(_path);
  }

  /// Get Top 100 Cryptocurrency Global Eecentralized Finance(defi) data
  /// <br/><b>Endpoint </b>: /global/decentralized_finance_defi
  Future<Response> getGlobalDecentralizedFinanceDefi() async {
    _path = '/global/decentralized_finance_defi';
    return await send(_path);
  }
}