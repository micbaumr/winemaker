import 'package:flutter/widgets.dart';
import 'package:winemaker/src/ingredients/ingredients.dart';
import 'package:winemaker/src/ingredients/ingredients_service.dart';

void calculateAndSaveIngredients(BuildContext context) {
  var ingredients = Ingredients(15, 30, true, true);
  saveInitialIngredients(ingredients, context);
}
