import 'dart:convert';

import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/src/response.dart';

class HttpRequestServiceMock implements HttpRequestServiceInterface {
  dynamic body = "";
  int statusCode = 200;
  HttpRequestServiceMock({
    required this.body,
    required this.statusCode
  });
  @override
  Future<Response> sendGet(String server, String path, String? query, { Map<String, String>? headers }) {
    return Future.delayed(
      Duration.zero,() => Response.bytes(
        utf8.encode(body),
        statusCode,
        headers: {
          'transfer-encoding': 'chunked',
          'content-type': 'application/json;charset=utf-8',
          'content-encoding': 'gzip',
        }
      )
    );
  }
  
}