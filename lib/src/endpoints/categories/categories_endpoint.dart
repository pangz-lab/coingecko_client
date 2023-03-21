import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CategoriesEndpoint extends EndpointBase {
  String _path = "";
  CategoriesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all categories
  Future<Response> getCoinsCategoriesList() async {
    _path = '/coins/categories/list';
    return await send(_path);
  }

  /// List all categories with market data
  /// 
  /// List all categories with market data
  /// 
  /// [order] valid values: <b>market_cap_desc (default), market_cap_asc, name_desc, name_asc, market_cap_change_24h_desc and market_cap_change_24h_asc</b>
  Future<Response> getCoinsCategories({
    String? order
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'order': order
      },
      endpointPath: "/coins/categories"
    );
    return await send(_path);
  }
}