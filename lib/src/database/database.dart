import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/constants/recipes.dart';
import 'package:winemaker/src/desired_wine/database/desired_wine_dao.dart';
import 'package:winemaker/src/desired_wine/database/desired_wine_entity.dart';
import 'package:winemaker/src/ingredients/database/ingredients_dao.dart';
import 'package:winemaker/src/ingredients/database/ingredients_entity.dart';
import 'package:winemaker/src/must/database/must_dao.dart';
import 'package:winemaker/src/must/database/must_entity.dart';
import 'package:winemaker/src/recipe/realization/database/recipe_realization_dao.dart';
import 'package:winemaker/src/recipe/realization/database/recipe_realization_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
    tables: [DesiredWineEntity, MustEntity, IngredientsEntity, RecipeRealizationEntity],
    daos: [DesiredWineDao, MustDao, IngredientsDao, RecipeRealizationDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();
      });
}

MyDatabase getDatabase(BuildContext context) => Provider.of<MyDatabase>(context, listen: false);
