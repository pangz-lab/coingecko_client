class DataParsingException extends FormatException {
  DataParsingException(super.message);
  factory DataParsingException.unreadableData() {
    return DataParsingException("Failed to parse the data.");
  }

  factory DataParsingException.mismatchedType() {
    return DataParsingException("Cannot be converted. Expected format is mismatched with the actual response data format.");
  }
}