// 1
abstract class Result<T> {}

// 2
class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

// 3
class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception);
}
