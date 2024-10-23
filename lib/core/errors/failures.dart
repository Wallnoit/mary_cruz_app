abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class DuplicateFailure extends Failure {
  DuplicateFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
