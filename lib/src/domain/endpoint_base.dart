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
    var pathParameters = _getPathParameters(endpointPath, rawQueryItems);
    if(pathParameters.isNotEmpty && rawQueryItems != null) {
      rawQueryItems.removeWhere((key, value) => pathParameters.contains(key));
    }
    var kvList = rawQueryItems!.map(
      (key, value) {
        return MapEntry(key, value != null ? "$key=${value.toString()}" : "");
      }).values.toList();

    kvList.removeWhere((value) => value.toString().isEmpty);
    return "${_replaceEndpointPathWithValue(endpointPath, rawQueryItems, pathParameters)}?${kvList.join("&")}";
  }

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

  String _replaceEndpointPathWithValue(String path, Map<String, dynamic> paramters, List<String?> pathVariableList) {
    if(!path.contains("{")) { return path; }
    var replacedPath = path;
    for (var pathVariable in pathVariableList) {
      replacedPath = replacedPath.replaceAll("{$pathVariable}", paramters[pathVariable]! as String);
    }
    return replacedPath;
  }

  // String _convertPathToMethodName(String path) {
  //   return "get${path.split("/").map(
  //     (e) {
  //       if(e.isEmpty) { return ""; }
  //       if(e.startsWith("{")) {
  //         return "With${_convertNameToUpperCamelCase(e
  //           .replaceAll("{", "")
  //           .replaceAll("}", "")
  //         )}";
  //       }
  //       return _convertNameToUpperCamelCase(e);
  //     }).toList().join("")}";
  // }

  // String _convertNameToLowerCamelCase(String name) {
  //   name = _convertNameToUpperCamelCase(name);
  //   return name[0].toLowerCase() + name.substring(1);
  // }

  // String _convertNameToUpperCamelCase(String name) {
  //   if(name.isEmpty) { return ""; }
  //   if(!name.contains("_")) {
  //     return name[0].toUpperCase() + name.substring(1).toLowerCase();
  //   }
  //   return name.split('_').map((n) {
  //     if(n.isEmpty || n.contains('beta')) { return ''; }
  //     var convertedName = n.trim().toLowerCase();
  //     return convertedName[0].toUpperCase() + convertedName.substring(1);
  //   }).join('');
  // }
}