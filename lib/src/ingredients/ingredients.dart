class IngredientList {
  final Ingredients requiredIngredients;
  final Ingredients addedIngredients;

  IngredientList(this.requiredIngredients, this.addedIngredients);
}

class Ingredients {
  final double sugar;
  final double water;
  final bool yeast;
  final bool nutrients;

  Ingredients(this.sugar, this.water, this.yeast, this.nutrients);
}
