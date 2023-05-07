///
/// Used by several classes to represent image urls.
///
class Image {
  String? _thumb;
  String? _small;
  String? _large;

  Image({String? thumb, String? small, String? large}) {
    _thumb = thumb;
    _small = small;
    _large = large;
  }

  String? get thumb => _thumb;
  String? get small => _small;
  String? get large => _large;

  Image.fromJson(Map<String, dynamic> json) {
    _thumb = json['thumb'];
    _small = json['small'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['thumb'] = _thumb;
    data['small'] = _small;
    data['large'] = _large;
    return data;
  }
}
