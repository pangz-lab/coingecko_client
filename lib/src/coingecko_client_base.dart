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