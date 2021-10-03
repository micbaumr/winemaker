import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/database/moor_value_extension.dart';
import 'package:winemaker/src/future/future_mapper.dart';

import 'ingredients.dart';

class IngredientsService {
  final BuildContext context;
  MyDatabase database;

  IngredientsService(this.context)
      : database = Provider.of<MyDatabase>(context, listen: false);

  void saveAddedIngredients(int id, Ingredients addedIngredients) {
    database.ingredientsDao.updateIngredients(
      id,
      IngredientsEntityCompanion(
        addedSugar: addedIngredients.sugar.toMoorValue(),
        addedWater: addedIngredients.water.toMoorValue(),
        addedYeast: addedIngredients.yeast.toMoorValue(),
        addedNutrients: addedIngredients.nutrients.toMoorValue(),
      ),
    );
  }

  void addInitialIngredients(int id, Ingredients requiredIngredients) {
    const initialZero = 0.0;
    const initialFalse = false;

    database.ingredientsDao.addIngredients(
      IngredientsEntityData(
        id: 1,
        requiredSugar: requiredIngredients.sugar,
        addedSugar: initialZero,
        requiredWater: requiredIngredients.water,
        addedWater: initialZero,
        requiredYeast: requiredIngredients.yeast,
        addedYeast: initialFalse,
        requiredNutrients: requiredIngredients.nutrients,
        addedNutrients: initialFalse,
      ),
    );
  }

  Future<IngredientList> getDesiredWineById(int id) =>
      database.ingredientsDao.ingredientsById(id).map((data) => IngredientList(
          Ingredients(data.requiredSugar, data.requiredWater,
              data.requiredYeast, data.requiredNutrients),
          Ingredients(data.addedSugar, data.addedWater, data.addedYeast,
              data.addedNutrients)));
}
