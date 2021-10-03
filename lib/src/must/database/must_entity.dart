import 'package:moor/moor.dart';

class MustEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get volume => real()();

  RealColumn get sugar => real()();
}
