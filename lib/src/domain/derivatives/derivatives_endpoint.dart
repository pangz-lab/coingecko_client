import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class DerivativesEndpoint extends EndpointBase {
  String _path = "";
  DerivativesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all derivative tickers
  /// endpoint : /derivatives
  /// 
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, defaults to unexpired
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

  /// List all derivative exchanges
  /// endpoint : /derivatives/exchanges
  /// 
  /// [order] order results using following params name_asc，name_desc，open_interest_btc_asc，open_interest_btc_desc，trade_volume_24h_btc_asc，trade_volume_24h_btc_desc
  /// [per_page] Total results per page
  /// [page] Page through results
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

  /// show derivative exchange data
  /// endpoint : /derivatives/exchanges/{id}
  /// 
  /// [id] pass the exchange id (can be obtained from derivatives/exchanges/list) eg. bitmex
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, leave blank to omit tickers data in response
  Future<Response> getDerivativesExchangesWithId({
    required String id,
    String? includeTickers
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'include_tickers': includeTickers
      },
      endpointPath: "/derivatives/exchanges/{id}"
    );
    return await send(_path);
  }

  /// List all derivative exchanges name and identifier
  /// endpoint : /derivatives/exchanges/list
  Future<Response> getDerivativesExchangesList() async {
    _path = '/derivatives/exchanges/list';
    return await send(_path);
  }
}