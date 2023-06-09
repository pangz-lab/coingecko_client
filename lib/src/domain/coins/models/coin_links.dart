import 'package:coingecko_client/src/models/base_model.dart';

/// Contains urls from different sources.
/// This is mainly used for the coin result but is also used in other domain.
class CoinLinks extends BaseModel {
  List<String>? _homepage;
  List<String>? _blockchainSite;
  List<String>? _officialForumUrl;
  List<String>? _chatUrl;
  List<String>? _announcementUrl;
  String? _twitterScreenName;
  String? _facebookUsername;
  int? _bitcointalkThreadIdentifier;
  String? _telegramChannelIdentifier;
  String? _subredditUrl;
  Map<String, dynamic>? _reposUrl;

  CoinLinks(
      {List<String>? homepage,
      List<String>? blockchainSite,
      List<String>? officialForumUrl,
      List<String>? chatUrl,
      List<String>? announcementUrl,
      String? twitterScreenName,
      String? facebookUsername,
      int? bitcointalkThreadIdentifier,
      String? telegramChannelIdentifier,
      String? subredditUrl,
      Map<String, dynamic>? reposUrl}) {
    _homepage = homepage;
    _blockchainSite = blockchainSite;
    _officialForumUrl = officialForumUrl;
    _chatUrl = chatUrl;
    _announcementUrl = announcementUrl;
    _twitterScreenName = twitterScreenName;
    _facebookUsername = facebookUsername;
    _bitcointalkThreadIdentifier = bitcointalkThreadIdentifier;
    _telegramChannelIdentifier = telegramChannelIdentifier;
    _subredditUrl = subredditUrl;
    _reposUrl = reposUrl;
  }

  List<String>? get homepage => _homepage;
  List<String>? get blockchainSite => _blockchainSite;
  List<String>? get officialForumUrl => _officialForumUrl;
  List<String>? get chatUrl => _chatUrl;
  List<String>? get announcementUrl => _announcementUrl;
  String? get twitterScreenName => _twitterScreenName;
  String? get facebookUsername => _facebookUsername;
  int? get bitcointalkThreadIdentifier => _bitcointalkThreadIdentifier;
  String? get telegramChannelIdentifier => _telegramChannelIdentifier;
  String? get subredditUrl => _subredditUrl;
  Map<String, dynamic>? get reposUrl => _reposUrl;

  /// Converts the raw json data(contained in a Map or List) to a CoinLinks object
  CoinLinks.fromJson(Map<String, dynamic> json) {
    _homepage = toList<String>(json['homepage']);
    _blockchainSite = toList<String>(json['blockchain_site']);
    _officialForumUrl = toList<String>(json['official_forum_url']);
    _chatUrl = toList<String>(json['chat_url']);
    _announcementUrl = toList<String>(json['announcement_url']);
    _twitterScreenName = json['twitter_screen_name'];
    _facebookUsername = json['facebook_username'];
    _bitcointalkThreadIdentifier = toInt(json['bitcointalk_thread_identifier']);
    _telegramChannelIdentifier = json['telegram_channel_identifier'];
    _subredditUrl = json['subreddit_url'];
    _reposUrl = toMap<dynamic>(json['repos_url']);
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['homepage'] = _homepage;
    data['blockchain_site'] = _blockchainSite;
    data['official_forum_url'] = _officialForumUrl;
    data['chat_url'] = _chatUrl;
    data['announcement_url'] = _announcementUrl;
    data['twitter_screen_name'] = _twitterScreenName;
    data['facebook_username'] = _facebookUsername;
    data['bitcointalk_thread_identifier'] = _bitcointalkThreadIdentifier;
    data['telegram_channel_identifier'] = _telegramChannelIdentifier;
    data['subreddit_url'] = _subredditUrl;
    data['repos_url'] = _reposUrl;
    return data;
  }
}
