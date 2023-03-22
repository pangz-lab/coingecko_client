import 'package:http/http.dart';

class NetworkRequestException extends ClientException {
  NetworkRequestException(super.message);
}