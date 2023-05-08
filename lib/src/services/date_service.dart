/// This is generic service for formatting dates.
class DateService {
  /// Converts date into ddmmYY.
  static String formatAsDefault(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
  }
}
