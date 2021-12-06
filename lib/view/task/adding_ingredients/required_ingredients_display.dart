import 'package:flutter/material.dart';
import 'package:winemaker/src/ingredients/ingredients.dart';
import 'package:winemaker/src/ingredients/ingredients_service.dart';
import 'package:winemaker/view/constants.dart';

class RequiredIngredientsDisplay extends StatelessWidget {
  const RequiredIngredientsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _ingredients = getRemainingIngredients(1, context);

    return getIngredientsFutureBuilder(_ingredients);
  }

  FutureBuilder<Ingredients> getIngredientsFutureBuilder(_value) {
    return FutureBuilder<Ingredients>(
        future: _value,
        builder: (context, snapshot) {
          return Column(
            children: [
              Text("Water: ${snapshot.data?.water} l", style: biggerFont),
              Text("Sugar: ${snapshot.data?.sugar} kg", style: biggerFont),
              if (snapshot.data != null && snapshot.data!.yeast) const Text("Please add yeast"),
              if (snapshot.data != null && snapshot.data!.nutrients) const Text("Please add nutrients"),
            ],
          );
        });
  }
}
