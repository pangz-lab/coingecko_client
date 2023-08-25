import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/categories/enums/coin_categories_data_ordering.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_category_basic_info.dart';
import 'package:coingecko_client/src/domain/categories/models/coin_category_info.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

///
/// List all coin categories and categories with market data
///
class CategoriesEndpoint extends BaseEndpoint {
  CategoriesEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, apiKey: apiKey);

  /// List all categories
  /// <br/><b>Endpoint </b>: /coins/categories/list
  Future<List<CoinCategoryBasicInfo>> getBasicList() async {
    try {
      final path = '/coins/categories/list';

      final result = List<dynamic>.of(await sendBasic(path));
      return result
          .map((value) => CoinCategoryBasicInfo.fromJson(value))
          .toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// List all categories with market data
  /// <br/><b>Endpoint </b>: /coins/categories
  ///
  /// [order] valid values: <b>market_cap_desc (default), market_cap_asc, name_desc, name_asc, market_cap_change_24h_desc and market_cap_change_24h_asc</b>
  Future<List<CoinCategoryInfo>> getList(
      {CoinCategoriesDataOrdering? order}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'order': order?.value},
          endpointPath: "/coins/categories");

      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => CoinCategoryInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
