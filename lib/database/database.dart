import 'package:moor/moor.dart';
import 'package:winemaker/must/must.dart';
import 'package:winemaker/must/must_dao.dart';
import 'package:winemaker/wine/desired_wine.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:winemaker/wine/desired_wine_dao.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [DesiredWine, Must], daos: [DesiredWineDao, MustDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
          onCreate: (m) async {
            await m.createAll();
          }
      );
}
