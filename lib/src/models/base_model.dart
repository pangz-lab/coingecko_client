///
/// Base class of model classes. <br>
/// Can be extended to create model class for other data formats.<br>
/// This provides utiliy methods to explcitly convert data to it's target type
/// to avoid formatting error in runtime
///
class BaseModel {
  DateTime? toDate(dynamic value) {
    if (value == null) return null;
    return DateTime.tryParse(value.toString());
  }

  DateTime? toDateFromTimestamp(dynamic value) {
    if (value == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(
        (int.tryParse(value.toString()) ?? 0) * 1000);
  }

  DateTime? toDateFromMs(dynamic value) {
    value = toInt(value);
    if (value == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  double? toDouble(dynamic value) {
    if (value == null) return null;
    return double.tryParse(value.toString());
  }

  int? toInt(dynamic value) {
    if (value == null) return null;
    return int.tryParse(value.toString());
  }

  Map<String, T>? toMap<T>(dynamic value) {
    return value != null ? Map<String, T>.of(value) : null;
  }

  List<T>? toList<T>(dynamic value) {
    return value != null ? List<T>.from(value) : null;
  }
}
