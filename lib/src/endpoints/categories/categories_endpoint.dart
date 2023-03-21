import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CategoriesEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/categories";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  CategoriesEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  Future<Response> getCoinsCategoriesList() async {
    _path = '/coins/categories/list';
    return await send(_path);
  }

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