import 'package:http/http.dart';

///
/// This exception is raised when an issue occured before sending an HTTP request.<br>
///
class RequestException extends ClientException {
  RequestException(super.message);

  ///
  /// Will be raised if an API does not exist when a paid method is used.
  ///
  factory RequestException.apiKeyNotFound() {
    return RequestException("API key is required. Request will be terminated.");
  }
}
