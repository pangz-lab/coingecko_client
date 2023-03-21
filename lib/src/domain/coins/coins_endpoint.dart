import 'package:coingecko_client/src/domain/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CoinsEndpoint extends EndpointBase {
  String _path = "";
  CoinsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

  /// List all supported coins id, name and symbol (no pagination required)
  /// <br/><b>Endpoint </b>: /coins/list
  /// 
  /// Use this to obtain all the coins' id in order to make API calls
  /// 
  /// [include_platform] flag to include platform contract addresses (eg. 0x.... for Ethereum based tokens). 
  ///  valid values: true, false
  Future<Response> getCoinsList({
    bool? includePlatform
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'include_platform': includePlatform
      },
      endpointPath: "/coins/list"
    );
    return await send(_path);
  }

  /// List all supported coins price, market cap, volume, and market related data
  /// <br/><b>Endpoint </b>: /coins/markets
  /// 
  /// Use this to obtain all the coins market data (price, market cap, volume)
  /// 
  /// [vs_currency] The target currency of market data (usd, eur, jpy, etc.)
  /// [ids] The ids of the coin, comma separated crytocurrency symbols (base). refers to `/coins/list`.
  /// [category] filter by coin category. Refer to /coin/categories/list
  /// [order] valid values: <b>market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc</b>
  /// sort results by field.
  /// [per_page] valid values: 1..250
  ///  Total results per page
  /// [page] Page through results
  /// [sparkline] Include sparkline 7 days data (eg. true, false)
  /// [price_change_percentage] Include price change percentage in <b>1h, 24h, 7d, 14d, 30d, 200d, 1y</b> (eg. '`1h,24h,7d`' comma-separated, invalid values will be discarded)
  Future<Response> getCoinsMarkets({
    required String vsCurrency,
    String? ids,
    String? category,
    String? order,
    int? perPage,
    int? page,
    bool? sparkline,
    String? priceChangePercentage
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'vs_currency': vsCurrency,
        'ids': ids,
        'category': category,
        'order': order,
        'per_page': perPage,
        'page': page,
        'sparkline': sparkline,
        'price_change_percentage': priceChangePercentage
      },
      endpointPath: "/coins/markets"
    );
    return await send(_path);
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
  Future<Response> getCoinsWithId({
    required String id,
    String? localization,
    bool? tickers,
    bool? marketData,
    bool? communityData,
    bool? developerData,
    bool? sparkline
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'localization': localization,
        'tickers': tickers,
        'market_data': marketData,
        'community_data': communityData,
        'developer_data': developerData,
        'sparkline': sparkline
      },
      endpointPath: "/coins/{id}"
    );
    return await send(_path);
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
  Future<Response> getCoinsWithIdTickers({
    required String id,
    String? exchangeIds,
    String? includeExchangeLogo,
    int? page,
    String? order,
    String? depth
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'exchange_ids': exchangeIds,
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'order': order,
        'depth': depth
      },
      endpointPath: "/coins/{id}/tickers"
    );
    return await send(_path);
  }

  /// Get historical data (name, price, market, stats) at a given date for a coin
  /// <br/><b>Endpoint </b>: /coins/{id}/history
  /// 
  /// [id] pass the coin id (can be obtained from /coins) eg. bitcoin
  /// [date] The date of data snapshot in dd-mm-yyyy eg. 30-12-2017
  /// [localization] Set to false to exclude localized languages in response
  Future<Response> getCoinsWithIdHistory({
    required String id,
    required String date,
    String? localization
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'date': date,
        'localization': localization
      },
      endpointPath: "/coins/{id}/history"
    );
    return await send(_path);
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
  Future<Response> getCoinsWithIdMarketChart({
    required String id,
    required String vsCurrency,
    required String days,
    String? interval
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency,
        'days': days,
        'interval': interval
      },
      endpointPath: "/coins/{id}/market_chart"
    );
    return await send(_path);
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
  Future<Response> getCoinsWithIdMarketChartRange({
    required String id,
    required String vsCurrency,
    required String from,
    required String to
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency,
        'from': from,
        'to': to
      },
      endpointPath: "/coins/{id}/market_chart/range"
    );
    return await send(_path);
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
  Future<Response> getCoinsWithIdOhlc({
    required String id,
    required String vsCurrency,
    required String days
  }) async {
    _path = createEndpointUrlPath(
      rawQueryItems: {
        'id': id,
        'vs_currency': vsCurrency,
        'days': days
      },
      endpointPath: "/coins/{id}/ohlc"
    );
    return await send(_path);
  }
}