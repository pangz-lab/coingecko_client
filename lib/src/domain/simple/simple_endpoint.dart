import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class SimpleEndpoint extends BaseEndpoint {
  String _path = "";
  SimpleEndpoint(HttpRequestServiceInterface httpRequestService, {String? apiKey}) : super(httpRequestService, {apiKey: apiKey});

  /// Get the current price of any cryptocurrencies in any other supported currencies that you need.
  /// <br/><b>Endpoint </b>: /simple/price
  /// 
  /// [ids] id of coins, comma-separated if querying more than 1 coin
  /// *refers to <b>`coins/list`</b>
  /// [vs_currencies] vs_currency of coins, comma-separated if querying more than 1 vs_currency
  /// *refers to <b>`simple/supported_vs_currencies`</b>
  /// [include_market_cap] <b>true/false</b> to include market_cap, <b>default: false</b>
  /// [include_24hr_vol] <b>true/false</b> to include 24hr_vol, <b>default: false</b>
  /// [include_24hr_change] <b>true/false</b> to include 24hr_change, <b>default: false</b>
  /// [include_last_updated_at] <b>true/false</b> to include last_updated_at of price, <b>default: false</b>
  /// [precision] <b>full</b> or any value between 0 - 18 to specify decimal place for currency price value, <b>default: 2</b>
  Future<Response> getSimplePrice({
    required List<String> ids,
    required List<Currencies> vsCurrencies,
    bool? includeMarketCap,
    bool? include24hrVol,
    bool? include24hrChange,
    bool? includeLastUpdatedAt,
    int? precision
  }) async {
    _path = createEndpointPathUrl(
      rawQueryItems: {
        'ids': ids.join(','),
        'vs_currencies': vsCurrencies.map((e) => e.code).join(','),
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hrVol,
        'include_24hr_change': include24hrChange,
        'include_last_updated_at': includeLastUpdatedAt,
        'precision': precision
      },
      endpointPath: "/simple/price"
    );
    return await send(_path);
  }

  /// Get current price of tokens (using contract addresses) for a given platform in any other currency that you need.
  /// <br/><b>Endpoint </b>: /simple/token_price/{id}
  /// 
  /// [id] The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
  /// [contract_addresses] The contract address of tokens, comma separated
  /// [vs_currencies] vs_currency of coins, comma-separated if querying more than 1 vs_currency
  /// *refers to <b>`simple/supported_vs_currencies`</b>
  /// [include_market_cap] <b>true/false</b> to include market_cap, <b>default: false</b>
  /// [include_24hr_vol] <b>true/false</b> to include 24hr_vol, <b>default: false</b>
  /// [include_24hr_change] <b>true/false</b> to include 24hr_change, <b>default: false</b>
  /// [include_last_updated_at] <b>true/false</b> to include last_updated_at of price, <b>default: false</b>
  /// [precision] <b>full</b> or any Integer to specify decimal place for currency price value, <b>default: 2</b>
  Future<Response> getSimpleTokenPriceWithId({
    required String id,
    required List<String> contractAddresses,
    required List<Currencies> vsCurrencies,
    bool? includeMarketCap,
    bool? include24hrVol,
    bool? include24hrChange,
    bool? includeLastUpdatedAt,
    int? precision
  }) async {
    _path = createEndpointPathUrl(
      rawQueryItems: {
        'id': id,
        'contract_addresses': contractAddresses.join(','),
        'vs_currencies': vsCurrencies.map((e) => e.code).join(','),
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hrVol,
        'include_24hr_change': include24hrChange,
        'include_last_updated_at': includeLastUpdatedAt,
        'precision': precision
      },
      endpointPath: "/simple/token_price/{id}"
    );
    return await send(_path);
  }

  /// Get list of supported_vs_currencies.
  /// <br/><b>Endpoint </b>: /simple/supported_vs_currencies
  Future<Response> getSimpleSupportedVsCurrencies() async {
    _path = '/simple/supported_vs_currencies';
    return await send(_path);
  }
}