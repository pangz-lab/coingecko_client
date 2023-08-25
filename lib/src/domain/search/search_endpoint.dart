import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// Use to search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first
///
class SearchEndpoint extends BaseEndpoint {
  SearchEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, apiKey: apiKey);

  /// Search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first
  /// <br/><b>Endpoint </b>: /search
  ///
  /// [query] Search string
  Future<Map<String, dynamic>> getResult({required String query}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'query': query}, endpointPath: "/search");

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
