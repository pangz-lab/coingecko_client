import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platform.dart';
import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/domain/asset_platforms/models/asset_platforms_filter.dart';
import 'package:coingecko_client/src/models/exceptions/network_request_exception.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class AssetPlatformsEndpoint extends EndpointBase {
  String _path = "";
  AssetPlatformsEndpoint(
    HttpRequestServiceInterface httpRequestService,
    {String? apiKey}
  ) : super(httpRequestService, {apiKey: apiKey});

  /// List all asset platforms (Blockchain networks)
  /// <br/><b>Endpoint </b>: /asset_platforms
  /// 
  /// throws [NetworkRequestException] and [DataParsingException]
  /// [filter] apply relevant filters to results
  ///  valid values: "nft" (asset_platform nft-support)
  Future<List<AssetPlatform>> call({
    AssetPlatformsFilter? filter
  }) async {
    try {
      _path = createEndpointUrlPath(
        rawQueryItems: {
          'filter': filter?.name ?? ''
        },
        endpointPath: "/asset_platforms"
      );
      var result = List<dynamic>.of(await sendBasic(_path));
      return result.map((value) => AssetPlatform.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }
}