import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/companies/models/company_list.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)<br>
///
class CompaniesEndpoint extends BaseEndpoint {
  CompaniesEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)
  /// <br/><b>Endpoint </b>: /companies/public_treasury/{coin_id}
  ///
  /// [coin_id] bitcoin or ethereum
  Future<CompanyList> getList({required String? coinId}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'coin_id': coinId},
          endpointPath: "/companies/public_treasury/{coin_id}");

      return CompanyList.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
