import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_exchange_ordering.dart';
import 'package:coingecko_client/src/domain/derivatives/models/derivatives_tickers.dart';
import 'package:coingecko_client/src/domain/exchanges/models/exchange_basic_info.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// - List all derivative tickers<br>
/// - List all derivative exchanges<br>
/// - Get derivative exchange info<br>
/// - List all derivative exchanges name and identifier<br>
///
class DerivativesEndpoint extends BaseEndpoint {
  DerivativesEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// List all derivative tickers
  /// <br/><b>Endpoint </b>: /derivatives
  ///
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, defaults to unexpired
  Future<List<Derivatives>> getList(
      {DerivativesTickers? includeTickers}) async {
    try {
      var path = createEndpointPathUrl(
          rawQueryItems: {'include_tickers': includeTickers?.value},
          endpointPath: "/derivatives");

      var result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => Derivatives.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// List all derivative exchanges
  /// <br/><b>Endpoint </b>: /derivatives/exchanges
  ///
  /// [order] order results using following params name_asc，name_desc，open_interest_btc_asc，open_interest_btc_desc，trade_volume_24h_btc_asc，trade_volume_24h_btc_desc
  /// [per_page] Total results per page
  /// [page] Page through results
  Future<List<DerivativesExchange>> getExchangeList(
      {DerivativesExchangeOrdering? order, int? perPage, int? page}) async {
    try {
      var path = createEndpointPathUrl(rawQueryItems: {
        'order': order?.value,
        'per_page': perPage,
        'page': page
      }, endpointPath: "/derivatives/exchanges");

      var result = List<dynamic>.of(await sendBasic(path));
      return result
          .map((value) => DerivativesExchange.fromJson(value))
          .toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// show derivative exchange data
  /// <br/><b>Endpoint </b>: /derivatives/exchanges/{id}
  ///
  /// [id] pass the exchange id (can be obtained from derivatives/exchanges/list) eg. bitmex
  /// [include_tickers] ['all', 'unexpired'] - expired to show unexpired tickers, all to list all tickers, leave blank to omit tickers data in response
  Future<DerivativesExchange> getExchange(
      {required String id, DerivativesTickers? includeTickers}) async {
    try {
      var path = createEndpointPathUrl(
          rawQueryItems: {'id': id, 'include_tickers': includeTickers?.value},
          endpointPath: "/derivatives/exchanges/{id}");

      return DerivativesExchange.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// List all derivative exchanges name and identifier
  /// <br/><b>Endpoint </b>: /derivatives/exchanges/list
  Future<List<ExchangeBasicInfo>> getExchangeBasicInfoList() async {
    try {
      var path = '/derivatives/exchanges/list';

      var result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => ExchangeBasicInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
