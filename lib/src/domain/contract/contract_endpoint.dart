import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_info.dart';
import 'package:coingecko_client/src/domain/contract/models/contract_market_chart.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class ContractEndpoint extends BaseEndpoint {
  ContractEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get coin info from contract address
  /// <br/><b>Endpoint </b>: /coins/{id}/contract/{contract_address}
  /// 
  /// [id] Asset platform (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  Future<ContractInfo> getInfo({
    required String id,
    required String contractAddress
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'id': id,
          'contract_address': contractAddress
        },
        endpointPath: "/coins/{id}/contract/{contract_address}"
      );

      return ContractInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get historical market data include price, market cap, and 24h volume (granularity auto) from a contract address 
  /// <br/><b>Endpoint </b>: /coins/{id}/contract/{contract_address}/market_chart/
  /// 
  /// [id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [days] Data up to number of days ago (eg. 1,14,30,max)
  Future<ContractMarketChart> getMarketHistory({
    required String id,
    required String contractAddress,
    required Currencies vsCurrency,
    required DataRange days
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'id': id,
          'contract_address': contractAddress,
          'vs_currency': vsCurrency.code,
          'days': days.value
        },
        endpointPath: "/coins/{id}/contract/{contract_address}/market_chart/"
      );

      return ContractMarketChart.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) from a contract address
  /// <br/><b>Endpoint </b>: /coins/{id}/contract/{contract_address}/market_chart/range
  /// 
  /// [id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [contract_address] Token's contract address
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [from] From date in UNIX Timestamp (eg. 1392577232)
  /// [to] To date in UNIX Timestamp (eg. 1422577232)
  Future<ContractMarketChart> getMarketHistoryWithDateRange({
    required String id,
    required String contractAddress,
    required Currencies vsCurrency,
    required DateTime from,
    required DateTime to
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'id': id,
          'contract_address': contractAddress,
          'vs_currency': vsCurrency.code,
          'from': from.millisecondsSinceEpoch,
          'to': to.millisecondsSinceEpoch
        },
        endpointPath: "/coins/{id}/contract/{contract_address}/market_chart/range"
      );

      return ContractMarketChart.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }
}