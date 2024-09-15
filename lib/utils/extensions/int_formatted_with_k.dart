extension IntExtension on int {
  String get formattedWithK {
    if (this >= 1000) {
      double valueInThousands = this / 1000;
      return "${valueInThousands.toStringAsFixed(1)}K";
    } else {
      return toString();
    }
  }
}