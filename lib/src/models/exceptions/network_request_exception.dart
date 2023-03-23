import 'package:http/http.dart';

class NetworkRequestException extends ClientException {
  NetworkRequestException(super.message);

  factory NetworkRequestException.failedResponse(int statusCode, Response response) {
    return NetworkRequestException(
      "[STATUS: $statusCode] Failed to receive the response from the server."
      "[RESPONSE]"
      "${response.body}"
      "${response.reasonPhrase}"
      "${response.headers}"
      "[REQUEST]"
      "${response.request?.url ?? ''}"
      "${response.request?.headers ?? ''}"
      "${response.request?.method ?? ''}"
    );
  }
}