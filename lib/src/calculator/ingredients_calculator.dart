import 'package:flutter/widgets.dart';
import 'package:winemaker/src/ingredients/ingredients.dart';
import 'package:winemaker/src/ingredients/ingredients_service.dart';

class IngredientsCalculator {
  final BuildContext context;
  final IngredientsService ingredientsService;

  IngredientsCalculator(this.context) : ingredientsService = IngredientsService(context);


  void calculateAndSaveIngredients() {
    var ingredients = Ingredients(15, 30, true, true);
    ingredientsService.saveInitialIngredients(ingredients);
  }
}
