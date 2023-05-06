import 'dart:convert';

import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

abstract class ResponseDate {
  String get baseEndpoint;
}

class BaseEndpoint {
  static final apiHost = "api.coingecko.com";
  static final apiProHost = "pro-api.coingecko.com";
  static final apiKeyQueryParam = "x_cg_pro_api_key";
  static final version = "/api/v3";
  String _endpointPath = "";
  String get endpointPath => _endpointPath;
  HttpRequestServiceInterface httpRequestService;
  String? apiKey;
  BaseEndpoint(
    this.httpRequestService, Map<String?, String?> map,
    {this.apiKey}
  );

  Future<dynamic> sendBasic(String path) async {
    try {
      _endpointPath = "$version$path";
      var urlComponent = _endpointPath.split("?");
      var query = urlComponent.length > 1 ? urlComponent.elementAt(1) : null;
      var response = await httpRequestService.sendGet(apiHost, urlComponent.elementAt(0), query);
      if(response.statusCode != 200) {
        throw NetworkRequestException.failedResponse(
          response.statusCode,
          response
        );
      }
      var data = utf8.decode(response.bodyBytes);
      if(data.trim().isEmpty) {
        throw DataParsingException("Response data is empty");
      }
      return jsonDecode(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> sendPro(String path) {
    try {
      _endpointPath = "$version$path&$apiKeyQueryParam=$apiKey";
      return httpRequestService.sendGet(apiProHost, _endpointPath, '');
    } catch (_) {
      rethrow;
    }
  }

  String createEndpointPathUrl({
    required String endpointPath,
    Map<String, dynamic>? rawQueryItems
  }) {
    var defaultRawQueryItems = Map<String, dynamic>.from(rawQueryItems ?? {});
    var pathParameters = _getPathParameters(endpointPath, rawQueryItems);
    if(pathParameters.isNotEmpty && rawQueryItems != null) {
      rawQueryItems.removeWhere((key, value) => pathParameters.contains(key));
    }
    var kvList = rawQueryItems!.map(
      (key, value) {
        return MapEntry(
          key,
          value != null && value.toString().isNotEmpty ? 
            "$key=${value.toString()}" : 
            ""
          );
      }).values.toList();

    kvList.removeWhere((value) => value.toString().isEmpty);
    var path = kvList.join("&").trim(); 
    path = path.isNotEmpty ? "?${kvList.join("&")}" : '';

    return "${_replaceEndpointPathWithValue(endpointPath, defaultRawQueryItems)}$path";
  }

  /// TODO : Simplify this
  List<String?> _getPathParameters(String path, Map<String, dynamic>? parameters) {
    if(!path.contains("{")) { return []; }
    if(parameters?.isEmpty ?? true) { return []; }

    var result = path.split("/")
      .map((e) {
        if(!e.contains("{")) {return "";}
        if(e.contains("{")) {
          return e
            .replaceAll("{", "")
            .replaceAll("}", "");
        }
      }).toList();

    if(result.isNotEmpty) {
      result.removeWhere((element) => element?.isEmpty ?? true);
    }
    return result;
  }

  String _replaceEndpointPathWithValue(String path, Map<String, dynamic>? parameters) {
    if(!path.contains("{") || parameters == null) { return path; }
    var replacedPath = path;
    for (var pathVariable in parameters.keys) {
      replacedPath = replacedPath.replaceAll("{$pathVariable}", parameters[pathVariable].toString());
    }
    return replacedPath;
  }
}