import 'package:coingecko_client/src/endpoints/ping/ping_endpoint.dart';
import 'package:coingecko_client/src/endpoints/simple/simple_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class CoinGeckoClient {
  final HttpRequestService _httpService = HttpRequestService();
  PingEndpoint get ping => PingEndpoint(_httpService);
  SimpleEndpoint get simple => SimpleEndpoint(_httpService);
}