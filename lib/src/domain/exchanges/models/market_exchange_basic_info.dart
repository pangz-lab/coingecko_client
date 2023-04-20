class MarketExchangeBasicInfo {
  String? _id;
  String? _name;

  MarketExchangeBasicInfo({String? id, String? name}) {
    _id = id;
    _name = name;
  }

  String? get id => _id;
  String? get name => _name;

  MarketExchangeBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}