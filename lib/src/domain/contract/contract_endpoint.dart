import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class ContractEndpoint extends EndpointBase {
  String _path = "";
  ContractEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// Get coin info from contract address
  /// endpoint : /coins/{id}/contract/{contract_address}
  /// 
  /// [id] Asset platform (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  Future<Response> getCoinsWithIdContractWithContractAddress({
    required String id,
    required String contractAddress
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'contract_address': contractAddress
      },
      endpointPath: "/coins/{id}/contract/{contract_address}"
    );
    return await send(_path);
  }

  /// Get historical market data include price, market cap, and 24h volume (granularity auto) from a contract address 
  /// endpoint : /coins/{id}/contract/{contract_address}/market_chart/
  /// 
  /// [id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [days] Data up to number of days ago (eg. 1,14,30,max)
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
      endpointPath: "/coins/{id}/contract/{contract_address}/market_chart/"
    );
    return await send(_path);
  }

  /// Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) from a contract address
  /// endpoint : /coins/{id}/contract/{contract_address}/market_chart/range
  /// 
  /// [id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [from] From date in UNIX Timestamp (eg. 1392577232)
  /// [to] To date in UNIX Timestamp (eg. 1422577232)
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
      endpointPath: "/coins/{id}/contract/{contract_address}/market_chart/range"
    );
    return await send(_path);
  }
}