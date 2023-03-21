import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class HttpRequestServiceInterface {
  Future<Response> sendGet(String server, String path) => throw UnimplementedError();
}

class HttpRequestService implements HttpRequestServiceInterface {
  @override
  Future<Response> sendGet(String server, String path) async {
    final httpPackageUrl = Uri.https(server, path);
    return await http.get(httpPackageUrl);
  }
}