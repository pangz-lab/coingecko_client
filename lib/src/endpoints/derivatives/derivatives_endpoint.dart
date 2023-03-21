import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class DerivativesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/derivatives";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  DerivativesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getDerivatives({
    String? includeTickers
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'include_tickers': includeTickers
      },
      endpointPath: "/derivatives"
    );
    return await send(_path);
  }

  Future<Response> getDerivativesExchanges({
    String? order,
    int? perPage,
    int? page
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'order': order,
        'per_page': perPage,
        'page': page
      },
      endpointPath: "/derivatives/exchanges"
    );
    return await send(_path);
  }

  Future<Response> getDerivativesExchangesWithId({
    required String id,
    String? includeTickers
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'include_tickers': includeTickers
      },
      endpointPath: "/derivatives/exchanges/$id"
    );
    return await send(_path);
  }

  Future<Response> getDerivativesExchangesList() async {
    _path = '/derivatives/exchanges/list';
    return await send(_path);
  }
}