import 'package:moor/moor.dart';

class Must extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get volume => real()();

  RealColumn get sugar => real()();
}
