import 'package:http/http.dart';

class FailedRequestException extends ClientException {
  FailedRequestException(super.message);
}