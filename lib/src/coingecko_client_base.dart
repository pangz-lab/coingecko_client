import './domain/asset_platforms/asset_platforms_endpoint.dart';
import './domain/categories/categories_endpoint.dart';
import './domain/coins/coins_endpoint.dart';
import './domain/companies/companies_endpoint.dart';
import './domain/contract/contract_endpoint.dart';
import './domain/derivatives/derivatives_endpoint.dart';
import './domain/exchange_rates/exchange_rates_endpoint.dart';
import './domain/exchanges/exchanges_endpoint.dart';
import './domain/global/global_endpoint.dart';
import './domain/indexes/indexes_endpoint.dart';
import './domain/nfts/nfts_endpoint.dart';
import './domain/ping/ping_endpoint.dart';
import './domain/search/search_endpoint.dart';
import './domain/simple/simple_endpoint.dart';
import './domain/trending/trending_endpoint.dart';
import './services/http_request_service.dart';

class CoinGeckoClient {
  String? _apiKey;
  CoinGeckoClient({ String? apiKey }) {
    _apiKey = apiKey;
  }
  final HttpRequestService _httpService = HttpRequestService();
  PingEndpoint get ping => PingEndpoint(_httpService);
  SimpleEndpoint get simple => SimpleEndpoint(_httpService, apiKey: _apiKey);
  CoinsEndpoint get coins => CoinsEndpoint(_httpService, apiKey: _apiKey);
  ContractEndpoint get contract => ContractEndpoint(_httpService, apiKey: _apiKey);
  AssetPlatformsEndpoint get assetPlatforms => AssetPlatformsEndpoint(_httpService, apiKey: _apiKey);
  CategoriesEndpoint get categories => CategoriesEndpoint(_httpService, apiKey: _apiKey);
  ExchangesEndpoint get exchanges => ExchangesEndpoint(_httpService, apiKey: _apiKey);
  IndexesEndpoint get indexes => IndexesEndpoint(_httpService, apiKey: _apiKey);
  DerivativesEndpoint get derivatives => DerivativesEndpoint(_httpService, apiKey: _apiKey);
  NftsEndpoint get nfts => NftsEndpoint(_httpService, apiKey: _apiKey);
  ExchangeRatesEndpoint get exchangeRates => ExchangeRatesEndpoint(_httpService, apiKey: _apiKey);
  SearchEndpoint get search => SearchEndpoint(_httpService, apiKey: _apiKey);
  TrendingEndpoint get trending => TrendingEndpoint(_httpService, apiKey: _apiKey);
  GlobalEndpoint get global => GlobalEndpoint(_httpService, apiKey: _apiKey);
  CompaniesEndpoint get companies => CompaniesEndpoint(_httpService, apiKey: _apiKey);
}