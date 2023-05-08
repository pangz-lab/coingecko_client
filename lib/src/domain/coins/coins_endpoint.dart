import 'package:coingecko_client/src/domain/coins/models/coin_basic_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_info.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_price_change.dart';
import 'package:coingecko_client/src/domain/base_endpoint.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_data_ordering.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_tickers.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_market_history.dart';
import 'package:coingecko_client/src/domain/coins/models/coin_ohlc.dart';
import 'package:coingecko_client/src/models/currencies.dart';
import 'package:coingecko_client/src/models/data_range.dart';
import 'package:coingecko_client/src/models/exceptions/data_parsing_exception.dart';
import 'package:coingecko_client/src/services/date_service.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';

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
class CoinsEndpoint extends BaseEndpoint {
  CoinsEndpoint(HttpRequestServiceInterface httpRequestService,
      {String? apiKey})
      : super(httpRequestService, {apiKey: apiKey});

  /// List all supported coins id, name and symbol (no pagination required)
  /// <br/><b>Endpoint </b>: /coins/list
  ///
  /// Use this to obtain all the coins' id in order to make API calls
  ///
  /// [include_platform] flag to include platform contract addresses (eg. 0x.... for Ethereum based tokens).
  ///  valid values: true, false
  Future<List<CoinBasicInfo>> getBasicList({bool? includePlatform}) async {
    try {
      final path = createEndpointPathUrl(
          rawQueryItems: {'include_platform': includePlatform},
          endpointPath: "/coins/list");

      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => CoinBasicInfo.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// List all supported coins price, market cap, volume, and market related data
  /// <br/><b>Endpoint </b>: /coins/markets
  ///
  /// Use this to obtain all the coins market data (price, market cap, volume)
  ///
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [ids] The ids of the coin, comma separated crytocurrency symbols (base). refers to `/coins/list`.
  /// [category] filter by coin category. Refer to /coin/categories/list
  /// [order] valid values: <b>market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc</b>
  /// sort results by field.
  /// [per_page] valid values: 1..250
  ///  Total results per page
  /// [page] Page through results
  /// [sparkline] Include sparkline 7 days data (eg. true, false)
  /// [price_change_percentage] Include price change percentage in <b>1h, 24h, 7d, 14d, 30d, 200d, 1y</b> (eg. '`1h,24h,7d`' comma-separated, invalid values will be discarded)
  Future<List<CoinMarket>> getMarketList(
      {required Currencies vsCurrency,
      List<String>? ids,
      String? category,
      CoinMarketDataOrdering? order,
      int? perPage,
      int? page,
      bool? sparkline,
      List<CoinPriceChange>? priceChangePercentage}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'vs_currency': vsCurrency.code,
        'ids': ids?.join(','),
        'category': category,
        'order': order?.value,
        'per_page': perPage,
        'page': page,
        'sparkline': sparkline,
        'price_change_percentage':
            priceChangePercentage?.map((e) => e.value).join(",")
      }, endpointPath: "/coins/markets");

      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => CoinMarket.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get current data (name, price, market, ... including exchange tickers) for a coin
  /// <br/><b>Endpoint </b>: /coins/{id}
  ///
  /// Get current data (name, price, market, ... including exchange tickers) for a coin.<br><br> **IMPORTANT**:
  /// Ticker object is limited to 100 items, to get more tickers, use `/coins/{id}/tickers`
  /// Ticker `is_stale` is true when ticker that has not been updated/unchanged from the exchange for a while.
  /// Ticker `is_anomaly` is true if ticker's price is outliered by our system.
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
  ///
  /// [id] pass the coin id (can be obtained from /coins) eg. bitcoin
  /// [localization] Include all localized languages in response (true/false) <b>[default: true]</b>
  /// [tickers] Include tickers data (true/false) <b>[default: true]</b>
  /// [market_data] Include market_data (true/false) <b>[default: true]</b>
  /// [community_data] Include community_data data (true/false) <b>[default: true]</b>
  /// [developer_data] Include developer_data data (true/false) <b>[default: true]</b>
  /// [sparkline] Include sparkline 7 days data (eg. true, false) <b>[default: false]</b>
  Future<CoinInfo> getInfo(
      {required String id,
      bool? localization,
      bool? tickers,
      bool? marketData,
      bool? communityData,
      bool? developerData,
      bool? sparkline}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'localization': localization,
        'tickers': tickers,
        'market_data': marketData,
        'community_data': communityData,
        'developer_data': developerData,
        'sparkline': sparkline
      }, endpointPath: "/coins/{id}");

      return CoinInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get coin tickers (paginated to 100 items)
  /// <br/><b>Endpoint </b>: /coins/{id}/tickers
  ///
  /// Get coin tickers (paginated to 100 items)<br><br> **IMPORTANT**:
  /// Ticker `is_stale` is true when ticker that has not been updated/unchanged from the exchange for a while.
  /// Ticker `is_anomaly` is true if ticker's price is outliered by our system.
  /// You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
  ///
  /// [id] pass the coin id (can be obtained from /coins/list) eg. bitcoin
  /// [exchange_ids] filter results by exchange_ids (ref: v3/exchanges/list)
  /// [include_exchange_logo] flag to show exchange_logo
  /// [page] Page through results
  /// [order] valid values: <b>trust_score_desc (default), trust_score_asc and volume_desc</b>
  /// [depth] flag to show 2% orderbook depth. valid values: true, false
  Future<CoinTickers> getTickers(
      {required String id,
      String? exchangeIds,
      bool? includeExchangeLogo,
      int? page,
      CoinTickersDataOrdering? order,
      bool? depth}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'exchange_ids': exchangeIds,
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'order': order?.value,
        'depth': depth
      }, endpointPath: "/coins/{id}/tickers");

      return CoinTickers.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get historical data (name, price, market, stats) at a given date for a coin
  /// <br/><b>Endpoint </b>: /coins/{id}/history
  ///
  /// [id] pass the coin id (can be obtained from /coins) eg. bitcoin
  /// [date] The date of data snapshot in dd-mm-yyyy eg. 30-12-2017
  /// [localization] Set to false to exclude localized languages in response
  Future<CoinInfo> getHistory(
      {required String id, required DateTime date, bool? localization}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'date': DateService.formatAsDefault(date),
        'localization': localization
      }, endpointPath: "/coins/{id}/history");

      return CoinInfo.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get historical market data include price, market cap, and 24h volume (granularity auto)
  /// <br/><b>Endpoint </b>: /coins/{id}/market_chart
  ///
  /// <b><ul><li>Data granularity is automatic (cannot be adjusted)</li><li>1 day from current time = 5 minute interval data</li><li>1 - 90 days from current time = hourly data</li><li>above 90 days from current time = daily data (00:00 UTC)</li></ul> </b>
  ///
  /// [id] pass the coin id (can be obtained from /coins) eg. bitcoin
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [days] Data up to number of days ago (eg. 1,14,30,max)
  /// [interval] Data interval. Possible value: daily
  Future<CoinMarketHistory> getMarketHistory(
      {required String id,
      required Currencies vsCurrency,
      required DataRange days,
      String? interval}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency.code,
        'days': days.value,
        'interval': interval
      }, endpointPath: "/coins/{id}/market_chart");

      return CoinMarketHistory.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto)
  /// <br/><b>Endpoint </b>: /coins/{id}/market_chart/range
  ///
  /// <b><ul><li>Data granularity is automatic (cannot be adjusted)</li><li>1 day from current time = 5 minute interval data</li><li>1 - 90 days from current time = hourly data</li><li>above 90 days from current time = daily data (00:00 UTC)</li></ul> </b>
  ///
  /// [id] pass the coin id (can be obtained from /coins) eg. bitcoin
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [from] From date in UNIX Timestamp (eg. 1392577232)
  /// [to] To date in UNIX Timestamp (eg. 1422577232)
  Future<CoinMarketHistory> getMarketHistoryWithDateRange(
      {required String id,
      required Currencies vsCurrency,
      required DateTime from,
      required DateTime to}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency.code,
        'from': from.millisecondsSinceEpoch,
        'to': to.millisecondsSinceEpoch
      }, endpointPath: "/coins/{id}/market_chart/range");

      return CoinMarketHistory.fromJson(await sendBasic(path));
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }

  /// Get coin's OHLC
  /// <br/><b>Endpoint </b>: /coins/{id}/ohlc
  ///
  /// Candle's body:
  ///
  /// 1 - 2 days: 30 minutes
  /// 3 - 30 days: 4 hours
  /// 31 days and beyond: 4 days
  ///
  /// [id] pass the coin id (can be obtained from /coins/list) eg. bitcoin
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [days]  Data up to number of days ago (1/7/14/30/90/180/365/max)
  Future<List<CoinOhlc>> getOhlcList(
      {required String id,
      required Currencies vsCurrency,
      required DataRange days}) async {
    try {
      final path = createEndpointPathUrl(rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency.code,
        'days': days.value
      }, endpointPath: "/coins/{id}/ohlc");

      final result = List<dynamic>.of(await sendBasic(path));
      return result.map((value) => CoinOhlc.fromJson(value)).toList();
    } on FormatException {
      throw DataParsingException.unreadableData();
    } on TypeError {
      throw DataParsingException.mismatchedType();
    } catch (_) {
      rethrow;
    }
  }
}
