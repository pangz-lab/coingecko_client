import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/categories/models/categories_data_ordering.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CategoriesEndpoint extends BaseEndpoint {
  String _path = "";
  CategoriesEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all categories
  /// <br/><b>Endpoint </b>: /coins/categories/list
  Future<Response> getCoinsCategoriesList() async {
    _path = '/coins/categories/list';
    return await send(_path);
  }

  /// List all categories with market data
  /// <br/><b>Endpoint </b>: /coins/categories
  /// 
  /// [order] valid values: <b>market_cap_desc (default), market_cap_asc, name_desc, name_asc, market_cap_change_24h_desc and market_cap_change_24h_asc</b>
  Future<Response> getCoinsCategories({
    CategoriesCoinDataOrdering? order
  }) async {
    _path = createEndpointPathUrl(
      rawQueryItems: {
        'order': order?.value ?? ''
      },
      endpointPath: "/coins/categories"
    );
    return await send(_path);
  }
}