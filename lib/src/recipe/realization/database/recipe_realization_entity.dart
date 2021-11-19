import 'package:moor/moor.dart';
import 'package:winemaker/src/constants/recipes.dart';

class RecipeRealizationEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get currentTask => integer()();

  IntColumn get recipe => intEnum<AvailableRecipes>()();
}

// class AvailableRecipesStringConverter extends TypeConverter<AvailableRecipes, String> {
//   const AvailableRecipesStringConverter();
//
//   @override
//   AvailableRecipes? mapToDart(String? fromDb) {
//     return AvailableRecipes.values.firstWhereOrNull((availableRecipe) => availableRecipe.toString().split(".").last == fromDb);
//   }
//
//   @override
//   String? mapToSql(AvailableRecipes? value) {
//     if (value == null) {
//       return null;
//     }
//
//     return value.toString();
//   }
// }
