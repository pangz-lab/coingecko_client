import 'package:coingecko_client/src/models/base_model.dart';

class CoinLinks extends BaseModel {
  List<String>? _homepage;
  List<String>? _blockchainSite;
  List<String>? _officialForumUrl;
  List<String>? _chatUrl;
  List<String>? _announcementUrl;
  String? _twitterScreenName;
  String? _facebookUsername;
  String? _bitcointalkThreadIdentifier;
  String? _telegramChannelIdentifier;
  String? _subredditUrl;
  Map<String, dynamic>? _reposUrl;

  CoinLinks({
    List<String>? homepage,
    List<String>? blockchainSite,
    List<String>? officialForumUrl,
    List<String>? chatUrl,
    List<String>? announcementUrl,
    String? twitterScreenName,
    String? facebookUsername,
    String? bitcointalkThreadIdentifier,
    String? telegramChannelIdentifier,
    String? subredditUrl,
    Map<String, dynamic>? reposUrl
  }) {
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
  String? get bitcointalkThreadIdentifier => _bitcointalkThreadIdentifier;
  String? get telegramChannelIdentifier => _telegramChannelIdentifier;
  String? get subredditUrl => _subredditUrl;
  Map<String, dynamic>? get reposUrl => _reposUrl;

  CoinLinks.fromJson(Map<String, dynamic> json) {
    _homepage = json['homepage'].forEach((v) {_homepage!.add(v);});
    _blockchainSite = json['blockchain_site'].forEach((v) {_blockchainSite!.add(v);});
    _officialForumUrl = json['official_forum_url'].forEach((v) {_officialForumUrl!.add(v);});
    _chatUrl = json['chat_url'].forEach((v) {_chatUrl!.add(v);});
    _announcementUrl = json['announcement_url'].forEach((v) {_announcementUrl!.add(v);});
    _twitterScreenName = json['twitter_screen_name'];
    _facebookUsername = json['facebook_username'];
    _bitcointalkThreadIdentifier = json['bitcointalk_thread_identifier'];
    _telegramChannelIdentifier = json['telegram_channel_identifier'];
    _subredditUrl = json['subreddit_url'];
    _reposUrl = json['repos_url'];
  }

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