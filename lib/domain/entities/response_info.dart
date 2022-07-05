class ResponseInfo<T> {
  const ResponseInfo({
    required this.endReached,
    required this.results,
    this.exception,
    this.localizedMessage,
  });

  final bool endReached;
  final Exception? exception;
  final String? localizedMessage;

  final List<T> results;
}
