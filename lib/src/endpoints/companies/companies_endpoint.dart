import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CompaniesEndpoint extends EndpointBase {
  String _path = "";
  CompaniesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)
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