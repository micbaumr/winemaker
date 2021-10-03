extension FutureMapperExtension<T> on Future<T> {
  Future<R> map<R>(R Function(T) mapper) => asStream().map(mapper).first;
}
