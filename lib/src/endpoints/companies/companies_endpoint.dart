import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CompaniesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/companies (beta)";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  CompaniesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getCompaniesPublicTreasuryWithCoinId({
    String? coinId
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'coin_id': coinId
      },
      endpointPath: "/companies/public_treasury/$coinId"
    );
    return await send(_path);
  }
}