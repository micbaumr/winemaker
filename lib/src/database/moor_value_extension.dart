import 'package:moor/moor.dart';

extension ToMoorValue<T> on T {
  Value<T> toMoorValue() => Value(this);
}
