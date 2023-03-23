class BaseModel {
  DateTime? toDate(dynamic value) {
    if(value == null) return null;
    return DateTime.tryParse(value.toString());
  }

  double? toDouble(dynamic value) {
    if(value == null) return null;
    return double.tryParse(value.toString());
  }

  int? toInt(dynamic value) {
    if(value == null) return null;
    return int.tryParse(value.toString());
  }
}