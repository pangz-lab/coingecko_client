import 'package:http/http.dart';

///
/// Used to raise when a network issue has occurred while sending the request<br>
/// to the server. Request and response will be logged as a result which help
/// to determine the main cause of the error.
///
class NetworkRequestException extends ClientException {
  NetworkRequestException(super.message);

  factory NetworkRequestException.failedResponse(
      int statusCode, Response response) {
    return NetworkRequestException(
        "[STATUS: $statusCode] Failed to receive the response from the server."
        "\n\n[RESPONSE]"
        "\n${response.body}"
        "\n${response.reasonPhrase}"
        "\n${response.headers}"
        "\n\n[REQUEST]"
        "\n${response.request?.url ?? ''}"
        "\n${response.request?.headers ?? ''}"
        "\n${response.request?.method ?? ''}");
  }
}
