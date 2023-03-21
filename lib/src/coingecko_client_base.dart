import 'package:coingecko_client/src/endpoints/asset_platforms/asset_platforms_endpoint.dart';
import 'package:coingecko_client/src/endpoints/categories/categories_endpoint.dart';
import 'package:coingecko_client/src/endpoints/coins/coins_endpoint.dart';
import 'package:coingecko_client/src/endpoints/companies/companies_endpoint.dart';
import 'package:coingecko_client/src/endpoints/contract/contract_endpoint.dart';
import 'package:coingecko_client/src/endpoints/derivatives/derivatives_endpoint.dart';
import 'package:coingecko_client/src/endpoints/exchange_rates/exchange_rates_endpoint.dart';
import 'package:coingecko_client/src/endpoints/exchanges/exchanges_endpoint.dart';
import 'package:coingecko_client/src/endpoints/global/global_endpoint.dart';
import 'package:coingecko_client/src/endpoints/indexes/indexes_endpoint.dart';
import 'package:coingecko_client/src/endpoints/nfts/nfts_endpoint.dart';
import 'package:coingecko_client/src/endpoints/ping/ping_endpoint.dart';
import 'package:coingecko_client/src/endpoints/search/search_endpoint.dart';
import 'package:coingecko_client/src/endpoints/simple/simple_endpoint.dart';
import 'package:coingecko_client/src/endpoints/trending/trending_endpoint.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

class CoinGeckoClient {
  final HttpRequestService _httpService = HttpRequestService();
  PingEndpoint get ping => PingEndpoint(_httpService);
  SimpleEndpoint get simple => SimpleEndpoint(_httpService);
  CoinsEndpoint get coins => CoinsEndpoint(_httpService);
  ContractEndpoint get contract => ContractEndpoint(_httpService);
  AssetPlatformsEndpoint get assetPlatforms => AssetPlatformsEndpoint(_httpService);
  CategoriesEndpoint get categories => CategoriesEndpoint(_httpService);
  ExchangesEndpoint get exchanges => ExchangesEndpoint(_httpService);
  IndexesEndpoint get indexes => IndexesEndpoint(_httpService);
  DerivativesEndpoint get derivatives => DerivativesEndpoint(_httpService);
  NftsEndpoint get nfts => NftsEndpoint(_httpService);
  ExchangeRatesEndpoint get exchangeRates => ExchangeRatesEndpoint(_httpService);
  SearchEndpoint get search => SearchEndpoint(_httpService);
  TrendingEndpoint get trending => TrendingEndpoint(_httpService);
  GlobalEndpoint get global => GlobalEndpoint(_httpService);
  CompaniesEndpoint get companies => CompaniesEndpoint(_httpService);
}