import 'package:coingecko_client/src/models/base_model.dart';
import 'package:coingecko_client/src/models/image.dart';

class ExchangeStatus extends BaseModel {
  String? _description;
  String? _category;
  DateTime? _createdAt;
  String? _user;
  String? _userTitle;
  bool? _pin;
  Project? _project;

  ExchangeStatus(
      {String? description,
      String? category,
      DateTime? createdAt,
      String? user,
      String? userTitle,
      bool? pin,
      Project? project}) {
    _description = description;
    _category = category;
    _createdAt = createdAt;
    _user = user;
    _userTitle = userTitle;
    _pin = pin;
    _project = project;
  }

  String? get description => _description;
  String? get category => _category;
  DateTime? get createdAt => _createdAt;
  String? get user => _user;
  String? get userTitle => _userTitle;
  bool? get pin => _pin;
  Project? get project => _project;

  ExchangeStatus.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _category = json['category'];
    _createdAt = toDate(json['created_at']);
    _user = json['user'];
    _userTitle = json['user_title'];
    _pin = json['pin'];
    _project =
        json['project'] != null ? Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = _description;
    data['category'] = _category;
    data['created_at'] = _createdAt;
    data['user'] = _user;
    data['user_title'] = _userTitle;
    data['pin'] = _pin;
    data['project'] = _project;
    return data;
  }
}

class Project {
  String? _type;
  String? _id;
  String? _name;
  Image? _image;

  Project({String? type, String? id, String? name, Image? image}) {
    _type = type;
    _id = id;
    _name = name;
    _image = image;
  }

  String? get type => _type;
  String? get id => _id;
  String? get name => _name;
  Image? get image => _image;

  Project.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _name = json['name'];
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = _type;
    data['id'] = _id;
    data['name'] = _name;
    data['image'] = _image;
    return data;
  }
}
