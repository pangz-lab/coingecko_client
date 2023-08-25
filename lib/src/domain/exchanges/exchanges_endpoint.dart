import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_info.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_basic_info.dart';
import 'package:coingecko_client/src/domain/exchanges/enums/exchange_data_ordering.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_volume_chart.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// - List all exchanges<br>
/// - Use this to obtain all the markets' id in order to make API calls<br>
/// - Get exchange volume in BTC and tickers<br>
/// <b>IMPORTANT:</b><br>
/// Ticker object is limited to 100 items, to get more tickers, use `/exchanges/{id}/tickers`<br>
/// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.<br>
/// Ticker is_anomaly is true if ticker's price is outliered by our system.<br>
/// You are responsible for managing how you want to display these information<br>
/// (e.g. footnote, different background, change opacity, hide)<br><br>
///
/// - Get exchange tickers<br>
/// <b>IMPORTANT:</b><br>
/// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.<br>
/// Ticker is_anomaly is true if ticker's price is outliered by our system.<br>
/// You are responsible for managing how you want to display these information<br>
/// (e.g. footnote, different background, change opacity, hide)<br>
/// - Get volume_chart data (in BTC) for a given exchange<br>
///
class ExchangesEndpoint extends BaseEndpoint {
  ExchangesEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, apiKey: apiKey);

  /// List all exchanges (Active with trading volumes)
  /// <br/><b>Endpoint </b>: /exchanges
  ///
  /// [per_page] Valid values: 1...250
  /// Total results per page
  /// Default value:: 100
  /// [page] page through results
  Future<List<ExchangeInfo>> getList({int? perPage, int? page}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'per_page': perPage, 'page': page},
          endpointPath: "/exchanges");

      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => ExchangeInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// List all supported markets id and name (no pagination required)
  /// <br/><b>Endpoint </b>: /exchanges/list
  ///
  /// Use this to obtain all the markets' id in order to make API calls
  Future<List<ExchangeBasicInfo>> getBasicList() async {
    try {
      final path = '/exchanges/list';
      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => ExchangeBasicInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
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
  Future<ExchangeInfo> getInfo({required String id}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'id': id}, endpointPath: "/exchanges/{id}");
      return ExchangeInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
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
  Future<List<TickerInfo>?> getTickerList(
      {required String id,
      List<String>? coinIds,
      bool? includeExchangeLogo,
      int? page,
      bool? depth,
      ExchangeDataOrdering? order}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'coin_ids': coinIds?.join(','),
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'depth': depth,
        'order': order?.value
      }, endpointPath: "/exchanges/{id}/tickers");

      var json = await sendBasic(path);
      return json['tickers'] != null
          ? List<dynamic>.of(json['tickers'])
              .map((e) => TickerInfo.fromJson(e))
              .toList()
          : null;
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get volume_chart data for a given exchange
  /// <br/><b>Endpoint </b>: /exchanges/{id}/volume_chart
  ///
  /// [id] pass the exchange id (can be obtained from /exchanges/list) eg. binance
  /// [days]  Data up to number of days ago (eg. 1,14,30)
  Future<List<ExchangeVolumeChart>> getVolumeChartList(
      {required String id, required DataRange days}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'id': id, 'days': days.value},
          endpointPath: "/exchanges/{id}/volume_chart");

      final result = List<dynamic>.of(await sendBasic(path));
      return result
          .map((value) => ExchangeVolumeChart.fromJson(value))
          .toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
