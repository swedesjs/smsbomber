part of smsbomber;

class BomberException implements Exception {
  final String message;

  const BomberException(this.message);

  @override
  String toString() => "BomberException: $message";
}
