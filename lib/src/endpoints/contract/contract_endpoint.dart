import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ContractEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/contract";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  ContractEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getCoinsWithIdContractWithContractAddress({
    required String id,
    required String contractAddress
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'contract_address': contractAddress
      },
      endpointPath: "/coins/$id/contract/$contractAddress"
    );
    return await send(_path);
  }

  Future<Response> getCoinsWithIdContractWithContractAddressMarketChart({
    required String id,
    required String contractAddress,
    required String vsCurrency,
    required String days
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'contract_address': contractAddress,
        'vs_currency': vsCurrency,
        'days': days
      },
      endpointPath: "/coins/$id/contract/$contractAddress/market_chart/"
    );
    return await send(_path);
  }

  Future<Response> getCoinsWithIdContractWithContractAddressMarketChartRange({
    required String id,
    required String contractAddress,
    required String vsCurrency,
    required String from,
    required String to
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'contract_address': contractAddress,
        'vs_currency': vsCurrency,
        'from': from,
        'to': to
      },
      endpointPath: "/coins/$id/contract/$contractAddress/market_chart/range"
    );
    return await send(_path);
  }
}