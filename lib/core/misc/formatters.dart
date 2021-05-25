class Formatters {
  static String formatDateFull(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} : ${dateTime.hour}:${dateTime.minute}';
  }

  static String formatDateHalf(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String pluralFormat(int length) {
    return (length > 1 || length == 0) ? 's' : '';
  }
}
