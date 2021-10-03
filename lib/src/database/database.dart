import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:winemaker/src/desired_wine/database/desired_wine_dao.dart';
import 'package:winemaker/src/desired_wine/database/desired_wine_entity.dart';
import 'package:winemaker/src/ingredients/database/ingredients_dao.dart';
import 'package:winemaker/src/ingredients/database/ingredients_entity.dart';
import 'package:winemaker/src/must/database/must_dao.dart';
import 'package:winemaker/src/must/database/must_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
    tables: [DesiredWineEntity, MustEntity, IngredientsEntity],
    daos: [DesiredWineDao, MustDao, IngredientsDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();
      });
}
