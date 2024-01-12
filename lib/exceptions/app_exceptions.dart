class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException({required this.message, required this.prefix});

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
