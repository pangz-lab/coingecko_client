import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ExchangesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/exchanges";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  ExchangesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getExchanges({
    int? perPage,
    String? page
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'per_page': perPage,
        'page': page
      },
      endpointPath: "/exchanges"
    );
    return await send(_path);
  }

  Future<Response> getExchangesList() async {
    _path = '/exchanges/list';
    return await send(_path);
  }

  Future<Response> getExchangesWithId({
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id
      },
      endpointPath: "/exchanges/$id"
    );
    return await send(_path);
  }

  Future<Response> getExchangesWithIdTickers({
    required String id,
    String? coinIds,
    String? includeExchangeLogo,
    int? page,
    String? depth,
    String? order
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'coin_ids': coinIds,
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'depth': depth,
        'order': order
      },
      endpointPath: "/exchanges/$id/tickers"
    );
    return await send(_path);
  }

  Future<Response> getExchangesWithIdVolumeChart({
    required String id,
    required int days
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'days': days
      },
      endpointPath: "/exchanges/$id/volume_chart"
    );
    return await send(_path);
  }
}