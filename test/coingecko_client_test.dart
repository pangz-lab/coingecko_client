import 'dart:convert';

import 'package:coingecko_client/src/endpoints/ping/ping_endpoint.dart';
import 'package:test/test.dart';

import 'services/http_request_service_mock.dart';

void main() {
  group('Endpoint test', () {
    final sut = PingEndpoint(HttpRequestServiceMock(
      statusCode : 200,
      body: '''{
  "gecko_says": "(V3) To the Moon!"
}'''));
    setUp(() {
      // Additional setup goes here.
    });

    test('ping', () async {
      var result = await sut();
      expect(result.statusCode, 200);
      expect(Map<String,dynamic>.of(jsonDecode(result.body))['gecko_says'], "(V3) To the Moon!");
    });

    test('ping2', () async {
      var result = await sut.callTest(param0: "param0", param1: "param1", param2: false);
      // expect(result.statusCode, 200);
      // expect(Map<String,dynamic>.of(jsonDecode(result.body))['gecko_says'], "(V3) To the Moon!");
    });
  });
}
