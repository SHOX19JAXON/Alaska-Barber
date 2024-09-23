extension DateTimeExtension on DateTime {
  String get formattedDate {
    final year = this.year;
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}