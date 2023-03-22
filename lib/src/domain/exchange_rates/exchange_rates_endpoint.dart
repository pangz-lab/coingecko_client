import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ExchangeRatesEndpoint extends EndpointBase {
  String _path = "";
  ExchangeRatesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get BTC-to-Currency exchange rates
  /// <br/><b>Endpoint </b>: /exchange_rates
  Future<Response> getExchangeRates() async {
    _path = '/exchange_rates';
    return await send(_path);
  }
}