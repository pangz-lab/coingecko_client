import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/global/models/global_crypto_info.dart';
import 'package:coingecko_client/src/domain/global/models/global_defi_info.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class GlobalEndpoint extends BaseEndpoint {
  GlobalEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get cryptocurrency global data
  /// <br/><b>Endpoint </b>: /global
  Future<GlobalCryptoInfo> getCryptoInfo() async {
    try {
      var path = '/global';
      var response = await sendBasic(path);
      
      return GlobalCryptoInfo.fromJson(response['data']);
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }

  /// Get Top 100 Cryptocurrency Global Eecentralized Finance(defi) data
  /// <br/><b>Endpoint </b>: /global/decentralized_finance_defi
  Future<GlobalDefiInfo> getDefiInfo() async {
    try {
      var path = '/global/decentralized_finance_defi';
      var response = await sendBasic(path);

      return GlobalDefiInfo.fromJson(response['data']);
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch(_) {
      rethrow;
    }
  }
}