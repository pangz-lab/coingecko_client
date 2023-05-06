import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_basic_info.dart';
import 'package:coingecko_client/src/domain/nfts/models/nft_info.dart';
import 'package:coingecko_client/src/domain/nfts/models/nfts_data_ordering.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class NftsEndpoint extends BaseEndpoint {
  NftsEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// List all supported NFT ids, paginated by 100 items per page, paginated to 100 items
  /// <br/><b>Endpoint </b>: /nfts/list
  /// 
  /// Use this to obtain all the NFT ids in order to make API calls, paginated to 100 items
  /// 
  /// [order] valid values: <b>h24_volume_native_asc, h24_volume_native_desc, floor_price_native_asc, floor_price_native_desc, market_cap_native_asc, market_cap_native_desc, market_cap_usd_asc, market_cap_usd_desc</b>
  /// [asset_platform_id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [per_page] Total results per page
  /// [page] Page through results
  Future<List<NftBasicInfo>> getBasicList({
    NftsDataOrdering? order,
    String? assetPlatformId,
    int? perPage,
    int? page
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'order': order?.value ?? '',
          'asset_platform_id': assetPlatformId,
          'per_page': perPage,
          'page': page
        },
        endpointPath: "/nfts/list"
      );

      var result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => NftBasicInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get current data (name, price_floor, volume_24h ...) for an NFT collection. native_currency (string) is only a representative of the currency.
  /// <br/><b>Endpoint </b>: /nfts/{id}
  /// 
  /// [id] id of nft collection (can be obtained from /nfts/list)
  Future<NftInfo> getInfo({
    required String id
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'id': id
        },
        endpointPath: "/nfts/{id}"
      );

      return NftInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get current data (name, price_floor, volume_24h ...) for an NFT collection
  /// <br/><b>Endpoint </b>: /nfts/{asset_platform_id}/contract/{contract_address}
  /// 
  /// [asset_platform_id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options, use filter=nft param)
  /// [contract_address] The contract_address of the nft collection (/nfts/list for list of nft collection with metadata)
  Future<NftInfo> getContractInfo({
    required String assetPlatformId,
    required String contractAddress
  }) async {
    try {
      var path = createEndpointPathUrl(
        rawQueryItems: {
          'asset_platform_id': assetPlatformId,
          'contract_address': contractAddress
        },
        endpointPath: "/nfts/{asset_platform_id}/contract/{contract_address}"
      );
      
      return NftInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }
}