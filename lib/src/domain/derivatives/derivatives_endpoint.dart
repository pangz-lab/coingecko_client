import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class DerivativesEndpoint extends EndpointBase {
  String _path = "";
  DerivativesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all derivative tickers
  /// <br/><b>Endpoint </b>: /derivatives
  /// 
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, defaults to unexpired
  Future<Response> getDerivatives({
    DerivativesTickers? includeTickers
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'include_tickers': includeTickers?.value ?? ''
      },
      endpointPath: "/derivatives"
    );
    return await send(_path);
  }

  /// List all derivative exchanges
  /// <br/><b>Endpoint </b>: /derivatives/exchanges
  /// 
  /// [order] order results using following params name_asc，name_desc，open_interest_btc_asc，open_interest_btc_desc，trade_volume_24h_btc_asc，trade_volume_24h_btc_desc
  /// [per_page] Total results per page
  /// [page] Page through results
  Future<Response> getDerivativesExchanges({
    DerivativesExchangeOrdering? order,
    int? perPage,
    int? page
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'order': order?.value ?? '',
        'per_page': perPage,
        'page': page
      },
      endpointPath: "/derivatives/exchanges"
    );
    return await send(_path);
  }

  /// show derivative exchange data
  /// <br/><b>Endpoint </b>: /derivatives/exchanges/{id}
  /// 
  /// [id] pass the exchange id (can be obtained from derivatives/exchanges/list) eg. bitmex
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, leave blank to omit tickers data in response
  Future<Response> getDerivativesExchangesWithId({
    required String id,
    DerivativesTickers? includeTickers
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'include_tickers': includeTickers?.value ?? ''
      },
      endpointPath: "/derivatives/exchanges/{id}"
    );
    return await send(_path);
  }

  /// List all derivative exchanges name and identifier
  /// <br/><b>Endpoint </b>: /derivatives/exchanges/list
  Future<Response> getDerivativesExchangesList() async {
    _path = '/derivatives/exchanges/list';
    return await send(_path);
  }
}