import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// Use to check API server status.
///
class PingEndpoint extends BaseEndpoint {
  PingEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// Check API server status
  /// <br/><b>Endpoint </b>: /ping
  Future<Map<String, dynamic>> getResult() async {
    try {
      var path = '/ping';

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
