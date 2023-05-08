/// Exchange basic information. Used when returning list of exchanges.
class ExchangeBasicInfo {
  String? _id;
  String? _name;

  ExchangeBasicInfo({String? id, String? name}) {
    _id = id;
    _name = name;
  }

  String? get id => _id;
  String? get name => _name;

  /// Converts the raw json data(contained in a Map or List) to an ExchangeBasicInfo object
  ExchangeBasicInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  /// Converts the object to a Map to make it json serializable.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}
