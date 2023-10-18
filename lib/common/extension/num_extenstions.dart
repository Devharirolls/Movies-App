extension NumExtension on num? {
  String convertToPercentageString() {
    // ignore: prefer_interpolation_to_compose_strings
    return ((this ?? 0 ) * 10).toStringAsFixed(0) + '%';
  }
}
