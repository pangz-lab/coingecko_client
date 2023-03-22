import 'package:coingecko_client/src/domain/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/domain/categories/categories_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/domain/companies/companies_endpoint.dart';
import 'package:coingecko_client/src/domain/contract/contract_endpoint.dart';
import 'package:coingecko_client/src/domain/derivatives/derivatives_endpoint.dart';
import 'package:coingecko_client/src/domain/exchange_rates/exchange_rates_endpoint.dart';
import 'package:coingecko_client/src/domain/exchanges/exchanges_endpoint.dart';
import 'package:coingecko_client/src/domain/global/global_endpoint.dart';
import 'package:coingecko_client/src/domain/indexes/indexes_endpoint.dart';
import 'package:coingecko_client/src/domain/nfts/nfts_endpoint.dart';
import 'package:coingecko_client/src/domain/ping/ping_endpoint.dart';
import 'package:coingecko_client/src/domain/search/search_endpoint.dart';
import 'package:coingecko_client/src/domain/simple/simple_endpoint.dart';
import 'package:coingecko_client/src/domain/trending/trending_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class CoinGeckoClient {
  String? apiKey;
  CoinGeckoClient(this.apiKey);
  final HttpRequestService _httpService = HttpRequestService();
  PingEndpoint get ping => PingEndpoint(_httpService, apiKey: apiKey);
  SimpleEndpoint get simple => SimpleEndpoint(_httpService, apiKey: apiKey);
  CoinsEndpoint get coins => CoinsEndpoint(_httpService, apiKey: apiKey);
  ContractEndpoint get contract => ContractEndpoint(_httpService, apiKey: apiKey);
  AssetPlatformsEndpoint get assetPlatforms => AssetPlatformsEndpoint(_httpService, apiKey: apiKey);
  CategoriesEndpoint get categories => CategoriesEndpoint(_httpService, apiKey: apiKey);
  ExchangesEndpoint get exchanges => ExchangesEndpoint(_httpService, apiKey: apiKey);
  IndexesEndpoint get indexes => IndexesEndpoint(_httpService, apiKey: apiKey);
  DerivativesEndpoint get derivatives => DerivativesEndpoint(_httpService, apiKey: apiKey);
  NftsEndpoint get nfts => NftsEndpoint(_httpService, apiKey: apiKey);
  ExchangeRatesEndpoint get exchangeRates => ExchangeRatesEndpoint(_httpService, apiKey: apiKey);
  SearchEndpoint get search => SearchEndpoint(_httpService, apiKey: apiKey);
  TrendingEndpoint get trending => TrendingEndpoint(_httpService, apiKey: apiKey);
  GlobalEndpoint get global => GlobalEndpoint(_httpService, apiKey: apiKey);
  CompaniesEndpoint get companies => CompaniesEndpoint(_httpService, apiKey: apiKey);
}