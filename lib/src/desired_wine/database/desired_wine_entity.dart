import 'package:moor/moor.dart';

class DesiredWineEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get alcohol => real()();

  RealColumn get sugar => real()();
}
