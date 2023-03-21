import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class SimpleEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/simple";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  SimpleEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getSimplePrice({
    required String ids,
    required String vsCurrencies,
    String? includeMarketCap,
    String? include24hrVol,
    String? include24hrChange,
    String? includeLastUpdatedAt,
    String? precision
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'ids': ids,
        'vs_currencies': vsCurrencies,
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hrVol,
        'include_24hr_change': include24hrChange,
        'include_last_updated_at': includeLastUpdatedAt,
        'precision': precision
      },
      endpointPath: "/simple/price"
    );
    return await send(_path);
  }

  Future<Response> getSimpleTokenPriceWithId({
    required String id,
    required String contractAddresses,
    required String vsCurrencies,
    String? includeMarketCap,
    String? include24hrVol,
    String? include24hrChange,
    String? includeLastUpdatedAt,
    String? precision
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'contract_addresses': contractAddresses,
        'vs_currencies': vsCurrencies,
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hrVol,
        'include_24hr_change': include24hrChange,
        'include_last_updated_at': includeLastUpdatedAt,
        'precision': precision
      },
      endpointPath: "/simple/token_price/$id"
    );
    return await send(_path);
  }

  Future<Response> getSimpleSupportedVsCurrencies() async {
    _path = '/simple/supported_vs_currencies';
    return await send(_path);
  }
}