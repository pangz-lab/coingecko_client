import 'package:http/http.dart' as http;
import 'package:http/http.dart';

///
/// Http service interface. It contain methods for sending http requests.
///
abstract class HttpRequestServiceInterface {
  Future<Response> sendGet(String server, String path, String? query,
          {Map<String, String>? headers}) =>
      throw UnimplementedError();
}


/// Main implementation of the HttpRequestServiceInterface using the http library.
/// Other http packages can be used(like dio) as long it implements this interface.
/// This the main HTTP service class used to send the HTTP request to the coingecko endpoints
class HttpRequestService implements HttpRequestServiceInterface {
  @override
  Future<Response> sendGet(String server, String path, String? query,
      {Map<String, String>? headers}) async {
    final url = Uri(scheme: 'https', host: server, path: path, query: query);
    return await http.get(url, headers: headers);
  }
}
