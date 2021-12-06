import 'package:flutter/widgets.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/database/moor_value_extension.dart';
import 'package:winemaker/src/future/future_mapper.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization.dart';

void saveRecipeRealization(RecipeRealization realization, BuildContext context) {
  var database = getDatabase(context);
  database.recipeRealizationDao
      .addRecipeRealization(RecipeRealizationEntityData(
        id: 1,
        currentTask: realization.currentTask,
        recipe: realization.recipe,
      ))
      .catchError((id) => Future.value(1));
}

void updateRecipeRealizationCurrentTask(int currentTask, BuildContext context) {
  var database = getDatabase(context);
  var entityCompanion = RecipeRealizationEntityCompanion(currentTask: currentTask.toMoorValue());
  database.recipeRealizationDao.updateRecipeRealization(1, entityCompanion);
}

Future<RecipeRealization> getRecipeRealizationById(int id, BuildContext context) {
  var database = getDatabase(context);
  return database.recipeRealizationDao.recipeRealizationById(id).map((data) => RecipeRealization(data.currentTask, data.recipe));
}
