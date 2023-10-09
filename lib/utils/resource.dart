sealed class Resource<T> {}

class Success<T> extends Resource<T> {
  final T data;

  Success({required this.data});
}

class Error<T> extends Resource<T> {
  final String error;

  Error({required this.error});
}