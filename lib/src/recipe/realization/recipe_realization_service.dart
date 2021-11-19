import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/database/moor_value_extension.dart';
import 'package:winemaker/src/future/future_mapper.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization.dart';

class RecipeRealizationService {
  final BuildContext context;
  MyDatabase database;

  RecipeRealizationService(this.context) : database = Provider.of<MyDatabase>(context, listen: false);

  void saveRecipeRealization(RecipeRealization realization) {
    database.recipeRealizationDao
        .addRecipeRealization(RecipeRealizationEntityData(
          id: 1,
          currentTask: realization.currentTask,
          recipe: realization.recipe,
        ))
        .catchError((id) => Future.value(1));
  }

  void updateRecipeRealizationCurrentTask(int currentTask) {
    var entityCompanion = RecipeRealizationEntityCompanion(currentTask: currentTask.toMoorValue());
    database.recipeRealizationDao.updateRecipeRealization(1, entityCompanion);
  }

  Future<RecipeRealization> getRecipeRealizationById(int id) =>
      database.recipeRealizationDao.recipeRealizationById(id).map((data) => RecipeRealization(data.currentTask, data.recipe));
}
