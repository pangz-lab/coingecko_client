import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ExchangeRatesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/exchange_rates";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  ExchangeRatesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getExchangeRates() async {
    _path = '/exchange_rates';
    return await send(_path);
  }
}