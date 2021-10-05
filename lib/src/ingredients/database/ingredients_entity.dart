import 'package:moor/moor.dart';

class IngredientsEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get requiredSugar => real()();
  RealColumn get addedSugar => real()();

  RealColumn get requiredWater => real()();
  RealColumn get addedWater => real()();

  BoolColumn get requiredYeast => boolean()();
  BoolColumn get addedYeast => boolean()();

  BoolColumn get requiredNutrients => boolean()();
  BoolColumn get addedNutrients => boolean()();
}
