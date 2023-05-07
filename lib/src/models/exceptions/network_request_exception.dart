import 'package:http/http.dart';

class NetworkRequestException extends ClientException {
  NetworkRequestException(super.message);

  factory NetworkRequestException.failedResponse(int statusCode, Response response) {
    return NetworkRequestException(
      "[STATUS: $statusCode] Failed to receive the response from the server."
      "\n\n[RESPONSE]"
      "\n${response.body}"
      "\n${response.reasonPhrase}"
      "\n${response.headers}"
      "\n\n[REQUEST]"
      "\n${response.request?.url ?? ''}"
      "\n${response.request?.headers ?? ''}"
      "\n${response.request?.method ?? ''}"
    );
  }
}