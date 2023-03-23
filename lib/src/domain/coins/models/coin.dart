class Coin {
  String? _id;
  String? _symbol;
  String? _name;
  Map<String, String>? _platforms;

  Coin({String? id, String? symbol, String? name, Map<String, String>? platforms}) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _platforms = platforms;
  }

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  Map<String, String>? get platforms => _platforms;

  Coin.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _platforms = json['platforms'] != null
      ? Map<String, String>.from(json['platforms'])
      : {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['symbol'] = _symbol;
    data['name'] = _name;
    data['platforms'] = _platforms;
    return data;
  }
}
