import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class HttpRequestServiceInterface {
  Future<Response> sendGet(String server, String path, String? query) => throw UnimplementedError();
}

class HttpRequestService implements HttpRequestServiceInterface {
  @override
  Future<Response> sendGet(String server, String path, String? query) async {
    final url = Uri(scheme: 'https', host: server, path: path, query: query);
    return await http.get(url);
  }
}