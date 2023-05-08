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

/// Main coingecko_client library class.
/// This is the class that should be instantiated to access all the available
/// coingecko api endpoints.
class CoinGeckoClient {
  ///
  /// Set the API key to access pro version endpoint
  ///
  String? _apiKey;
  CoinGeckoClient({String? apiKey}) {
    _apiKey = apiKey;
  }

  ///
  /// Main HTTP service class used to send the HTTP request to the coingecko endpoints
  ///
  final HttpRequestService _httpService = HttpRequestService();

  ///
  /// Use to check API server status
  ///
  PingEndpoint get ping => PingEndpoint(_httpService);

  ///
  /// - Get the current price of any cryptocurrencies in any other supported currencies that you need.<br>
  /// - Get current price of tokens (using contract addresses) for a given platform in any other currency that you need.<br>
  /// - Get list of supported_vs_currencies.<br>
  ///
  SimpleEndpoint get simple => SimpleEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - Use this to obtain all the coins, coins market data (price, market cap, volume)<br>
  /// - Get current data (name, price, market, ... including exchange tickers) for a coin.<br>
  /// <b>IMPORTANT:</b><br>
  /// Ticker object is limited to 100 items, to get more tickers, use `/coins/{id}/tickers`<br>
  /// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.<br>
  /// Ticker is_anomaly is true if ticker's price is outliered by our system.<br>
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)<br>
  /// - Get historical data (price, market cap, 24hr volume, ..) at a given date for a coin.<br>
  /// The data returned is at 00:00:00 UTC.<br>
  /// - Get historical market data include price, market cap, and 24h volume (granularity auto)<br><br>
  /// Data granularity is automatic (cannot be adjusted)<br>
  /// 1 day from current time = 5 minute interval data<br>
  /// 1 - 90 days from current time = hourly data<br>
  /// above 90 days from current time = daily data (00:00 UTC)<br><br>
  ///
  /// Candle's body:<br>
  /// 1 - 2 days: 30 minutes<br>
  /// 3 - 30 days: 4 hours<br>
  /// 31 days and beyond: 4 days<br>
  ///
  CoinsEndpoint get coins => CoinsEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - Get coin info from contract address<br>
  /// - Get historical market data include price, market cap, and 24h volume or within a range of timestamp (granularity auto)<br>
  ///
  ContractEndpoint get contract =>
      ContractEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// List all asset platforms
  ///
  AssetPlatformsEndpoint get assetPlatforms =>
      AssetPlatformsEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// List all coin categories and categories with market data
  ///
  CategoriesEndpoint get categories =>
      CategoriesEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - List all exchanges<br>
  /// - Use this to obtain all the markets' id in order to make API calls<br>
  /// - Get exchange volume in BTC and tickers<br>
  /// <b>IMPORTANT:</b><br>
  /// Ticker object is limited to 100 items, to get more tickers, use `/exchanges/{id}/tickers`<br>
  /// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.<br>
  /// Ticker is_anomaly is true if ticker's price is outliered by our system.<br>
  /// You are responsible for managing how you want to display these information<br>
  /// (e.g. footnote, different background, change opacity, hide)<br><br>
  ///
  /// - Get exchange tickers<br>
  /// <b>IMPORTANT:</b><br>
  /// Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for a while.<br>
  /// Ticker is_anomaly is true if ticker's price is outliered by our system.<br>
  /// You are responsible for managing how you want to display these information<br>
  /// (e.g. footnote, different background, change opacity, hide)<br>
  /// - Get volume_chart data (in BTC) for a given exchange<br>
  ///
  ExchangesEndpoint get exchanges =>
      ExchangesEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - List all market indexes<br>
  /// - Use to get market index by market id and index id<br>
  ///
  IndexesEndpoint get indexes => IndexesEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - List all derivative tickers<br>
  /// - List all derivative exchanges<br>
  /// - Get derivative exchange info<br>
  /// - List all derivative exchanges name and identifier<br>
  ///
  DerivativesEndpoint get derivatives =>
      DerivativesEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - Use this to obtain all the NFT ids in order to make API calls, paginated to 100 items<br>
  /// - Get current data (name, price_floor, volume_24h ...) for an NFT collection. native_currency (string) is only a representative of the currency.<br>
  /// - `Solana NFT` & `Art Blocks` are not supported for this endpoint, please use `/nfts/{id}` endpoint instead.<br>
  ///
  NftsEndpoint get nfts => NftsEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// Get BTC-to-Currency exchange rates
  ///
  ExchangeRatesEndpoint get exchangeRates =>
      ExchangeRatesEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// Use to search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first
  ///
  SearchEndpoint get search => SearchEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// Top-7 trending coins on CoinGecko as searched by users in the last 24 hours (Ordered by most popular first)
  ///
  TrendingEndpoint get trending =>
      TrendingEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// - Get cryptocurrency global data<br>
  /// - Get Top 100 Cryptocurrency Global Eecentralized Finance(defi) data<br>
  ///
  GlobalEndpoint get global => GlobalEndpoint(_httpService, apiKey: _apiKey);

  ///
  /// Get public companies bitcoin or ethereum holdings (Ordered by total holdings descending)<br>
  ///
  CompaniesEndpoint get companies =>
      CompaniesEndpoint(_httpService, apiKey: _apiKey);
}
