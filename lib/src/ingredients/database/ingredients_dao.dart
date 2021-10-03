import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';

import 'ingredients_entity.dart';

part 'ingredients_dao.g.dart';

@UseDao(tables: [IngredientsEntity])
class IngredientsDao extends DatabaseAccessor<MyDatabase>
    with _$IngredientsDaoMixin {
  IngredientsDao(MyDatabase db) : super(db);

  Future<List<IngredientsEntityData>> get allIngredientsEntries =>
      select(ingredientsEntity).get();

  Future<IngredientsEntityData> ingredientsById(int id) =>
      (select(ingredientsEntity)..where((tbl) => tbl.id.equals(id)))
          .getSingle();

  Future<int> addIngredients(IngredientsEntityData entry) =>
      into(ingredientsEntity).insert(entry);

  Future updateIngredients(int id, IngredientsEntityCompanion ingredients) {
    return (update(ingredientsEntity)..where((i) => i.id.equals(id)))
        .write(ingredients);
  }
}
