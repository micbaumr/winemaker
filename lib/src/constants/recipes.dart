import 'package:winemaker/src/recipe/recipe.dart';
import 'package:winemaker/src/recipe/task.dart';
import 'package:winemaker/src/recipe/task_type.dart';

final Recipe redWineRecipe = Recipe([
  Task("Desired wine parameters", TaskType.desiredWineForm),
  Task("Must parameters measurement", TaskType.measurementForm),
  Task("Calculate ingredients", TaskType.calculations),
  Task("Add first ingredients", TaskType.addingIngredients),
  Task("Add second ingredients", TaskType.addingIngredients),
]);

enum AvailableRecipes {
  redWine,
}

extension AvaliableRecipesExtension on AvailableRecipes {
  Recipe getRecipe() {
    switch (this) {
      case AvailableRecipes.redWine:
        return redWineRecipe;
    }
  }
}
