import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CompaniesEndpoint extends BaseEndpoint {
  String _path = "";
  CompaniesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)
  /// <br/><b>Endpoint </b>: /companies/public_treasury/{coin_id}
  /// 
  /// [coin_id] bitcoin or ethereum
  Future<Response> getCompaniesPublicTreasuryWithCoinId({
    String? coinId
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'coin_id': coinId
      },
      endpointPath: "/companies/public_treasury/{coin_id}"
    );
    return await send(_path);
  }
}