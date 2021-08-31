abstract class Failure implements Exception {
  String? get message;
}

class ConnectionError extends Failure {
  final String? message;

  ConnectionError({
    this.message,
  });
}

class ErrorGetCustomerData extends Failure {
  final String? message;

  ErrorGetCustomerData({
    this.message,
  });
}
