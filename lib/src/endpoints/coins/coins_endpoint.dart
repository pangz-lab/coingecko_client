import 'package:coingecko_client/src/endpoints/endpoint_base.dart';
import 'package:coingecko_client/src/services/http_request_service.dart';
import 'package:http/http.dart';

class CoinsEndpoint extends EndpointBase implements EndpointInterface {
  final String _baseEndpoint = "/coins";
  String _path = "";
  @override
  String get baseEndpoint => _baseEndpoint;
  CoinsEndpoint(HttpRequestServiceInterface httpRequestService) : super(httpRequestService);

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
      endpointPath: "/coins/$id"
    );
    return await send(_path);
  }

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
      endpointPath: "/coins/$id/tickers"
    );
    return await send(_path);
  }

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
      endpointPath: "/coins/$id/history"
    );
    return await send(_path);
  }

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
      endpointPath: "/coins/$id/market_chart"
    );
    return await send(_path);
  }

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
      endpointPath: "/coins/$id/market_chart/range"
    );
    return await send(_path);
  }

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
      endpointPath: "/coins/$id/ohlc"
    );
    return await send(_path);
  }
}