import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ExchangesEndpoint extends EndpointBase {
  String _path = "";
  ExchangesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all exchanges (Active with trading volumes)
  /// 
  /// [per_page] Valid values: 1...250
  /// Total results per page
  /// Default value:: 100
  /// [page] page through results
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

  /// List all supported markets id and name (no pagination required)
  /// 
  /// Use this to obtain all the markets' id in order to make API calls
  Future<Response> getExchangesList() async {
    _path = '/exchanges/list';
    return await send(_path);
  }

  /// Get exchange volume in BTC and top 100 tickers only
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
  /// 
  /// Get exchange tickers (paginated)<br><br> **IMPORTANT**:
  /// Ticker `is_stale` is true when ticker that has not been updated/unchanged from the exchange for a while.
  /// Ticker `is_anomaly` is true if ticker's price is outliered by our system.
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
  /// 
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  /// [coin_ids] filter tickers by coin_ids (ref: v3/coins/list)
  /// [include_exchange_logo] flag to show exchange_logo
  /// [page] Page through results
  /// [depth] flag to show 2% orderbook depth i.e., cost_to_move_up_usd and cost_to_move_down_usd
  /// [order] valid values: <b>trust_score_desc (default), trust_score_asc and volume_desc</b>
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
      endpointPath: "/exchanges/{id}/tickers"
    );
    return await send(_path);
  }

  /// Get volume_chart data for a given exchange
  /// 
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  /// [days]  Data up to number of days ago (eg. 1,14,30)
  Future<Response> getExchangesWithIdVolumeChart({
    required String id,
    required int days
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'days': days
      },
      endpointPath: "/exchanges/{id}/volume_chart"
    );
    return await send(_path);
  }
}