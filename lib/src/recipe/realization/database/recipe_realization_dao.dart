import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/recipe/realization/database/recipe_realization_entity.dart';

part 'recipe_realization_dao.g.dart';

@UseDao(tables: [RecipeRealizationEntity])
class RecipeRealizationDao extends DatabaseAccessor<MyDatabase> with _$RecipeRealizationDaoMixin {
  RecipeRealizationDao(MyDatabase db) : super(db);

  Future<List<RecipeRealizationEntityData>> get allRecipeRealizationEntries => select(recipeRealizationEntity).get();

  Future<RecipeRealizationEntityData> recipeRealizationById(int id) =>
      (select(recipeRealizationEntity)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> addRecipeRealization(RecipeRealizationEntityData realization) => into(recipeRealizationEntity).insert(realization);

  Future updateRecipeRealization(int id, RecipeRealizationEntityCompanion realization) =>
      (update(recipeRealizationEntity)..where((i) => i.id.equals(id))).write(realization);
}
