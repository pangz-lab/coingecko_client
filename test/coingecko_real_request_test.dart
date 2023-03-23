import 'package:coingecko_client/src/domain/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platform.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:test/test.dart';

void main() {
  var httpService = HttpRequestService();
  group('Test for real request', () {
    test('from AssetPlatformsEndpoint should return a valid response', () async {
      var sut = AssetPlatformsEndpoint(httpService);
      var result = await sut();
      expect(result.elementAt(0).runtimeType, AssetPlatform);
    });
  });
}