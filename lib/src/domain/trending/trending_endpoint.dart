import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// Top-7 trending coins on CoinGecko as searched by users in the last 24 hours (Ordered by most popular first).
///
class TrendingEndpoint extends BaseEndpoint {
  TrendingEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// Get trending search coins (Top-7) on CoinGecko in the last 24 hours
  /// <br/><b>Endpoint </b>: /search/trending
  ///
  /// Top-7 trending coins on CoinGecko as searched by users in the last 24 hours (Ordered by most popular first)
  Future<Map<String, dynamic>> getResult() async {
    try {
      var path = '/search/trending';

      return Map<String, dynamic>.of(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
