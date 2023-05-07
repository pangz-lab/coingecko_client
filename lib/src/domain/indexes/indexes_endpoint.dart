import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/indexes/models/market_index.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class IndexesEndpoint extends BaseEndpoint {
  IndexesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all market indexes
  /// <br/><b>Endpoint </b>: /indexes
  /// 
  /// [per_page] Total results per page
  /// [page] Page through results
  Future<List<MarketIndex>> getList({
    int? perPage,
    int? page
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'per_page': perPage,
          'page': page
        },
        endpointPath: "/indexes"
      );

      var result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => MarketIndex.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get market index by market id and index id
  /// <br/><b>Endpoint </b>: /indexes/{market_id}/{id}
  /// 
  /// [market_id] pass the market id (can be obtained from /exchanges/list)
  /// [id] pass the index id (can be obtained from /indexes/list)
  Future<MarketIndex> getInfo({
    required String marketId,
    required String id
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'market_id': marketId,
          'id': id
        },
        endpointPath: "/indexes/{market_id}/{id}"
      );
      
      return MarketIndex.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// List market indexes id and name
  /// <br/><b>Endpoint </b>: /indexes/list
  Future<List<MarketIndex>> getBasicInfoList() async {
    try {
      var path = '/indexes/list';

      var result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => MarketIndex.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }
}