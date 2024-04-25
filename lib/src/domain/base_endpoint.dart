import 'dart:convert';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/models/exceptions/request_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

/// Main class that provides utility methods in preparing and sending the<br>
/// http request to the API service.<br>
/// This class is being extended by domain classes.
class BaseEndpoint {
  /// Coingecko community endpoint host
  static final apiHost = "api.coingecko.com";

  /// Coingecko pro endpoint host
  static final apiProHost = "pro-api.coingecko.com";

  /// Coingecko key name. This is embedded either in the url query
  /// of the http request header. This will contain the API key
  /// provided to the pro user when sent to the service.
  static final apiKeyQueryParam = "x-cg-pro-api-key";

  /// Current API version supported
  static final version = "/api/v3";
  String _endpointPath = "";

  /// The generated endpoint path. This will contain the resulting endpoints
  /// which is used as the URL and the query in sending the request.
  String get endpointPath => _endpointPath;
  HttpRequestServiceInterface httpRequestService;
  String? _apiKey;
  BaseEndpoint(this.httpRequestService, {String? apiKey}) {
    _apiKey = apiKey;
  }

  /// Sends the HTTP request to the community host server
  Future<dynamic> sendBasic(String path) {
    try {
      return _send(path, apiHost);
    } catch (_) {
      rethrow;
    }
  }

  /// **CURRENTLY NOT SUPPORTED**
  /// Sends the HTTP request to the pro host server<br>
  /// This automatically embeds the provided api key in CoinGeckoClient.
  /// This will be used for every request.
  /// ```dart
  /// var client = CoinGeckoClient(apiKey: API_KEY_YOU_SET_HERE);
  /// ```
  Future<dynamic> sendPro(String path) {
    try {
      if (_apiKey?.isEmpty ?? true) {
        throw RequestException.apiKeyNotFound();
      }
      final headers = Map.fromEntries(
          [MapEntry<String, String>(apiKeyQueryParam, _apiKey ?? '')]);
      return _send(path, apiProHost, headers: headers);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> _send(String path, String host,
      {Map<String, String>? headers}) async {
    try {
      _endpointPath = "$version$path";
      final urlComponent = _endpointPath.split("?");
      final query = urlComponent.length > 1 ? urlComponent.elementAt(1) : null;
      final response = await httpRequestService
          .sendGet(host, urlComponent.elementAt(0), query, headers: headers);
      if (response.statusCode != 200) {
        throw NetworkRequestException.failedResponse(
            response.statusCode, response);
      }
      final data = utf8.decode(response.bodyBytes);
      if (data.trim().isEmpty) {
        throw DataParsingException("Response data is empty");
      }

      return jsonDecode(data);
    } catch (_) {
      rethrow;
    }
  }

  /// The main method that generates the URL based on the given url template.<br>
  /// This either recreates the url structure if needed or crete a url query based on
  /// the presence of key-value pair. Or could be both.
  String createEndpointPathUrl(
      {required String endpointPath, Map<String, dynamic>? rawQueryItems}) {
    final defaultRawQueryItems = Map<String, dynamic>.from(rawQueryItems ?? {});
    final pathParameters = _getPathParameters(endpointPath, rawQueryItems);
    if (pathParameters.isNotEmpty && rawQueryItems != null) {
      rawQueryItems.removeWhere((key, value) => pathParameters.contains(key));
    }
    var kvList = rawQueryItems!
        .map((key, value) {
          return MapEntry(
              key,
              value != null && value.toString().isNotEmpty
                  ? "$key=${value.toString()}"
                  : "");
        })
        .values
        .toList();

    kvList.removeWhere((value) => value.toString().isEmpty);
    var path = kvList.join("&").trim();
    path = path.isNotEmpty ? "?${kvList.join("&")}" : '';

    return "${_replaceEndpointPathWithValue(endpointPath, defaultRawQueryItems)}$path";
  }

  // TODO : Simplify this
  List<String?> _getPathParameters(
      String path, Map<String, dynamic>? parameters) {
    if (!path.contains("{")) {
      return [];
    }
    if (parameters?.isEmpty ?? true) {
      return [];
    }

    final result = path.split("/").map((e) {
      if (!e.contains("{")) {
        return "";
      }
      if (e.contains("{")) {
        return e.replaceAll("{", "").replaceAll("}", "");
      }
    }).toList();

    if (result.isNotEmpty) {
      result.removeWhere((element) => element?.isEmpty ?? true);
    }
    return result;
  }

  String _replaceEndpointPathWithValue(
      String path, Map<String, dynamic>? parameters) {
    if (!path.contains("{") || parameters == null) {
      return path;
    }
    var replacedPath = path;
    for (var pathVariable in parameters.keys) {
      replacedPath = replacedPath.replaceAll(
          "{$pathVariable}", parameters[pathVariable].toString());
    }
    return replacedPath;
  }
}
