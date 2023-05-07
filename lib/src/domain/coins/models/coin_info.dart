import 'package:coingecko_client/src/domain/coins/models/coin_links.dart';
import 'package:coingecko_client/src/domain/coins/models/market_data.dart';
import 'package:coingecko_client/src/domain/coins/models/ticker_info.dart';
import 'package:coingecko_client/src/models/base_model.dart';
import 'package:coingecko_client/src/models/image.dart';

class CoinInfo extends BaseModel {
  String? _id;
  String? _symbol;
  String? _name;
  String? _assetPlatformId;
  Map<String, dynamic>? _platforms;
  Map<String, dynamic>? _detailPlatforms;
  int? _blockTimeInMinutes;
  String? _hashingAlgorithm;
  List<String>? _categories;
  String? _publicNotice;
  List<String>? _additionalNotices;
  Map<String, dynamic>? _localization;
  Map<String, dynamic>? _description;
  CoinLinks? _links;
  Image? _image;
  String? _countryOrigin;
  DateTime? _genesisDate;
  String? _contractAddress;
  double? _sentimentVotesUpPercentage;
  double? _sentimentVotesDownPercentage;
  int? _watchlistPortfolioUsers;
  int? _marketCapRank;
  int? _coingeckoRank;
  double? _coingeckoScore;
  double? _developerScore;
  double? _communityScore;
  double? _liquidityScore;
  double? _publicInterestScore;
  MarketData? _marketData;
  Map<String, dynamic>? _communitydata;
  Map<String, dynamic>? _developerdata;
  Map<String, dynamic>? _publicInterestStats;
  List<String>? _statusUpdates;
  DateTime? _lastUpdated;
  List<TickerInfo>? _tickers;

  CoinInfo({
    String? id,
    String? symbol,
    String? name,
    String? assetPlatformId,
    Map<String, dynamic>? platforms,
    Map<String, dynamic>? detailPlatforms,
    int? blockTimeInMinutes,
    String? hashingAlgorithm,
    List<String>? categories,
    String? publicNotice,
    List<String>? additionalNotices,
    Map<String, dynamic>? localization,
    Map<String, dynamic>? description,
    CoinLinks? links,
    Image? image,
    String? countryOrigin,
    DateTime? genesisDate,
    String? contractAddress,
    double? sentimentVotesUpPercentage,
    double? sentimentVotesDownPercentage,
    int? watchlistPortfolioUsers,
    int? marketCapRank,
    int? coingeckoRank,
    double? coingeckoScore,
    double? developerScore,
    double? communityScore,
    double? liquidityScore,
    double? publicInterestScore,
    MarketData? marketData,
    Map<String, dynamic>? communitydata,
    Map<String, dynamic>? developerdata,
    Map<String, dynamic>? publicInterestStats,
    List<String>? statusUpdates,
    DateTime? lastUpdated,
    List<TickerInfo>? tickers,
  }) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _assetPlatformId = assetPlatformId;
    _platforms = platforms;
    _detailPlatforms = detailPlatforms;
    _blockTimeInMinutes = blockTimeInMinutes;
    _hashingAlgorithm = hashingAlgorithm;
    _categories = categories;
    _publicNotice = publicNotice;
    _additionalNotices = additionalNotices;
    _localization = localization;
    _description = description;
    _links = links;
    _image = image;
    _countryOrigin = countryOrigin;
    _genesisDate = genesisDate;
    _contractAddress = contractAddress;
    _sentimentVotesUpPercentage = sentimentVotesUpPercentage;
    _sentimentVotesDownPercentage = sentimentVotesDownPercentage;
    _watchlistPortfolioUsers = watchlistPortfolioUsers;
    _marketCapRank = marketCapRank;
    _coingeckoRank = coingeckoRank;
    _coingeckoScore = coingeckoScore;
    _developerScore = developerScore;
    _communityScore = communityScore;
    _liquidityScore = liquidityScore;
    _publicInterestScore = publicInterestScore;
    _marketData = marketData;
    _communitydata = communitydata;
    _developerdata = developerdata;
    _publicInterestStats = publicInterestStats;
    _statusUpdates = statusUpdates;
    _lastUpdated = lastUpdated;
    _tickers = tickers;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get assetPlatformId => _assetPlatformId;
  Map<String, dynamic>? get platforms => _platforms;
  Map<String, dynamic>? get detailPlatforms => _detailPlatforms;
  int? get blockTimeInMinutes => _blockTimeInMinutes;
  String? get hashingAlgorithm => _hashingAlgorithm;
  List<String>? get categories => _categories;
  String? get publicNotice => _publicNotice;
  List<String>? get additionalNotices => _additionalNotices;
  Map<String, dynamic>? get localization => _localization;
  Map<String, dynamic>? get description => _description;
  CoinLinks? get links => _links;
  Image? get image => _image;
  String? get countryOrigin => _countryOrigin;
  DateTime? get genesisDate => _genesisDate;
  String? get contractAddress => _contractAddress;
  double? get sentimentVotesUpPercentage => _sentimentVotesUpPercentage;
  double? get sentimentVotesDownPercentage => _sentimentVotesDownPercentage;
  int? get watchlistPortfolioUsers => _watchlistPortfolioUsers;
  int? get marketCapRank => _marketCapRank;
  int? get coingeckoRank => _coingeckoRank;
  double? get coingeckoScore => _coingeckoScore;
  double? get developerScore => _developerScore;
  double? get communityScore => _communityScore;
  double? get liquidityScore => _liquidityScore;
  double? get publicInterestScore => _publicInterestScore;
  MarketData? get marketData => _marketData;
  Map<String, dynamic>? get communitydata => _communitydata;
  Map<String, dynamic>? get developerdata => _developerdata;
  Map<String, dynamic>? get publicInterestStats => _publicInterestStats;
  List<String>? get statusUpdates => _statusUpdates;
  DateTime? get lastUpdated => _lastUpdated;
  List<TickerInfo>? get tickers => _tickers;

  CoinInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _assetPlatformId = json['asset_platform_id'];
    _platforms = toMap<dynamic>(json['platforms']);
    _detailPlatforms = toMap<dynamic>(json['detail_platforms']);
    _blockTimeInMinutes = toInt(json['block_time_in_minutes']);
    _hashingAlgorithm = json['hashing_algorithm'];
    _categories = toList(json['categories']);
    _publicNotice = json['public_notice'];
    _additionalNotices = toList(json['additional_notices']);
    _localization = toMap<dynamic>(json['localization']);
    _description = toMap<dynamic>(json['description']);
    _links = json['links'] != null ? CoinLinks.fromJson(json['links']) : null;
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
    _countryOrigin = json['country_origin'];
    _genesisDate = toDate(json['genesis_date']);
    _contractAddress = json['contract_address'];
    _sentimentVotesUpPercentage =
        toDouble(json['sentiment_votes_up_percentage']);
    _sentimentVotesDownPercentage =
        toDouble(json['sentiment_votes_down_percentage']);
    _watchlistPortfolioUsers = toInt(json['watchlist_portfolio_users']);
    _marketCapRank = toInt(json['market_cap_rank']);
    _coingeckoRank = toInt(json['coingecko_rank']);
    _coingeckoScore = toDouble(json['coingecko_score']);
    _developerScore = toDouble(json['developer_score']);
    _communityScore = toDouble(json['community_score']);
    _liquidityScore = toDouble(json['liquidity_score']);
    _publicInterestScore = toDouble(json['public_interest_score']);
    _marketData = json['market_data'] != null
        ? MarketData.fromJson(json['market_data'])
        : null;
    _communitydata = toMap<dynamic>(json['community_data']);
    _developerdata = toMap<dynamic>(json['developer_data']);
    _publicInterestStats = toMap<dynamic>(json['public_interest_stats']);
    _statusUpdates = toList<String>(json['status_updates']);
    _lastUpdated = toDate(json['last_updated']);
    _tickers = json['tickers'] != null
        ? List<dynamic>.of(json['tickers'])
            .map((e) => TickerInfo.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['asset_platform_id'] = _assetPlatformId;
    data['platforms'] = _platforms;
    data['detail_platforms'] = _detailPlatforms;
    data['block_time_in_minutes'] = _blockTimeInMinutes;
    data['hashing_algorithm'] = _hashingAlgorithm;
    data['categories'] = _categories;
    data['public_notice'] = _publicNotice;
    data['additional_notices'] = _additionalNotices;
    data['localization'] = _localization;
    data['description'] = _description;
    data['links'] = _links;
    data['image'] = _image;
    data['country_origin'] = _countryOrigin;
    data['genesis_date'] = _genesisDate;
    data['contract_address'] = _contractAddress;
    data['sentiment_votes_up_percentage'] = _sentimentVotesUpPercentage;
    data['sentiment_votes_down_percentage'] = _sentimentVotesDownPercentage;
    data['watchlist_portfolio_users'] = _watchlistPortfolioUsers;
    data['market_cap_rank'] = _marketCapRank;
    data['coingecko_rank'] = _coingeckoRank;
    data['coingecko_score'] = _coingeckoScore;
    data['developer_score'] = _developerScore;
    data['community_score'] = _communityScore;
    data['liquidity_score'] = _liquidityScore;
    data['public_interest_score'] = _publicInterestScore;
    data['market_data'] = _marketData;
    return data;
  }
}
