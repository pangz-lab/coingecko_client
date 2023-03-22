import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchanges_data_ordering.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ExchangesEndpoint extends BaseEndpoint {
  String _path = "";
  ExchangesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all exchanges (Active with trading volumes)
  /// <br/><b>Endpoint </b>: /exchanges
  /// 
  /// [per_page] Valid values: 1...250
  /// Total results per page
  /// Default value:: 100
  /// [page] page through results
  Future<Response> getExchanges({
    int? perPage,
    int? page
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

  /// List all supported markets id and name (no pagination required)
  /// <br/><b>Endpoint </b>: /exchanges/list
  /// 
  /// Use this to obtain all the markets' id in order to make API calls
  Future<Response> getExchangesList() async {
    _path = '/exchanges/list';
    return await send(_path);
  }

  /// Get exchange volume in BTC and top 100 tickers only
  /// <br/><b>Endpoint </b>: /exchanges/{id}
  /// 
  /// Get exchange volume in BTC and tickers<br><br> **IMPORTANT**:
  /// Ticker object is limited to 100 items, to get more tickers, use `/exchanges/{id}/tickers`
  /// Ticker `is_stale` is true when ticker that has not been updated/unchanged from the exchange for a while.
  /// Ticker `is_anomaly` is true if ticker's price is outliered by our system.
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
  /// 
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  Future<Response> getExchangesWithId({
    required String id
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id
      },
      endpointPath: "/exchanges/{id}"
    );
    return await send(_path);
  }

  /// Get exchange tickers (paginated, 100 tickers per page)
  /// <br/><b>Endpoint </b>: /exchanges/{id}/tickers
  /// 
  /// Get exchange tickers (paginated)<br><br> **IMPORTANT**:
  /// Ticker `is_stale` is true when ticker that has not been updated/unchanged from the exchange for a while.
  /// Ticker `is_anomaly` is true if ticker's price is outliered by our system.
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
  /// 
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  /// [coin_ids] filter tickers by coin_ids (ref: v3/coins/list)
  /// [include_exchange_logo] flag to show exchange_logo. valid values: true, false
  /// [page] Page through results
  /// [depth] flag to show 2% orderbook depth i.e., cost_to_move_up_usd and cost_to_move_down_usd. valid values: true, false
  /// [order] valid values: <b>trust_score_desc (default), trust_score_asc and volume_desc</b>
  Future<Response> getExchangesWithIdTickers({
    required String id,
    String? coinIds,
    bool? includeExchangeLogo,
    int? page,
    bool? depth,
    ExchangesDataOrdering? order
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'coin_ids': coinIds,
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'depth': depth,
        'order': order?.value ?? ''
      },
      endpointPath: "/exchanges/{id}/tickers"
    );
    return await send(_path);
  }

  /// Get volume_chart data for a given exchange
  /// <br/><b>Endpoint </b>: /exchanges/{id}/volume_chart
  /// 
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  /// [days]  Data up to number of days ago (eg. 1,14,30)
  Future<Response> getExchangesWithIdVolumeChart({
    required String id,
    required DataRange days
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'days': days.value
      },
      endpointPath: "/exchanges/{id}/volume_chart"
    );
    return await send(_path);
  }
}