import 'dart:convert';

import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/ping/ping_endpoint.dart';
import 'package:test/test.dart';

import 'services/http_request_service_mock.dart';

void main() {
  group('PingEndpoint test', () {
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
  });

  group('CoinEndpoint test', () {
    final sut = CoinsEndpoint(HttpRequestServiceMock(
      statusCode : 200,
      body: '''{
  "gecko_says": "(V3) To the Moon!"
}'''));
    setUp(() {
      // Additional setup goes here.
    });

    // test('getCoinsWithIdMarketChartRange', () async {
    //   var result = await sut.getCoinsWithIdMarketChartRange(
    //     id: id,
    //     vsCurrency: vsCurrency,
    //     from: from,
    //     to: to
    //   );
    //   expect(result.statusCode, 200);
    //   expect(Map<String,dynamic>.of(jsonDecode(result.body))['gecko_says'], "(V3) To the Moon!");
    // });
  });
}
