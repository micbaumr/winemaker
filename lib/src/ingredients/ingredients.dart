class IngredientList {
  Ingredients requiredIngredients;
  Ingredients addedIngredients;

  IngredientList(this.requiredIngredients, this.addedIngredients);
}

class Ingredients {
  double sugar;
  double water;
  bool yeast;
  bool nutrients;

  Ingredients(this.sugar, this.water, this.yeast, this.nutrients);
}
