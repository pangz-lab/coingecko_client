import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

abstract class EndpointInterface {
  String get baseEndpoint;
}

class EndpointBase {
  static final apiHost = "api.coingecko.com";
  static final version = "/api/v3";
  HttpRequestServiceInterface httpRequestService;
  EndpointBase(this.httpRequestService);

  Future<Response> send(String path) {
    try {
      return httpRequestService.sendGet(apiHost, "$version$path");
    } catch (_) {
      rethrow;
    }
  }

  String createEndpointUrlPath({
    required String endpointPath,
    Map<String, dynamic>? rawQueryItems
  }) {
    var kvList = rawQueryItems!.map(
      (key, value) {
        return MapEntry(key, value != null ? "$key=${value.toString()}" : "");
      }).values.toList();

    kvList.removeWhere((value) => value.toString().isEmpty);
    return kvList.join("&");
  }
}