import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/src/response.dart';

class HttpRequestServiceMock implements HttpRequestServiceInterface {
  String body = "";
  int statusCode = 200;
  HttpRequestServiceMock({
    required this.body,
    required this.statusCode
  });
  @override
  Future<Response> sendGet(String server, String path, String query) {
    return Future.delayed(
      Duration.zero,() => Response(
        body,
        statusCode,
        headers: {'content-type': 'application/json'}
      )
    );
  }
  
}