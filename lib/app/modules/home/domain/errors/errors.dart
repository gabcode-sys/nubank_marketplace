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

class NotValidEntrie extends Failure {
  final String? message;

  NotValidEntrie({
    this.message,
  });
}

class NoBalance extends Failure {
  final String? message;

  NoBalance({
    this.message,
  });
}

class ErrorNewPurchase extends Failure {
  final String? message;

  ErrorNewPurchase({
    this.message,
  });
}
