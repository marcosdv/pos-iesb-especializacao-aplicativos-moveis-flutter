extension StringExtension on String {
  int toInt({int valorPadrao = 0}) {
    return int.tryParse(this) ?? valorPadrao;
  }

  double toDouble({double valorPadrao = 0}) {
    return double.tryParse(this) ?? valorPadrao;
  }
}