import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/exchange_rates/models/exchange_rate.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// Get BTC-to-Currency exchange rates
///
class ExchangeRatesEndpoint extends BaseEndpoint {
  ExchangeRatesEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// Get BTC-to-Currency exchange rates
  /// <br/><b>Endpoint </b>: /exchange_rates
  Future<List<ExchangeRate>> getList() async {
    try {
      var path = '/exchange_rates';
      var response = await sendBasic(path);

      var result = Map<String, dynamic>.of(response['rates']);
      return result.values.map((map) => ExchangeRate.fromJson(map)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
