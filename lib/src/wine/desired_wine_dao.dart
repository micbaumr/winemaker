import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/wine/desired_wine.dart';

part 'desired_wine_dao.g.dart';

@UseDao(tables: [DesiredWine])
class DesiredWineDao extends DatabaseAccessor<MyDatabase> with _$DesiredWineDaoMixin {
  DesiredWineDao(MyDatabase db) : super(db);

  Future<List<DesiredWineData>> get allDesiredWineEntries => select(desiredWine).get();

  Future<DesiredWineData> desiredWineById(int id) {
    return (select(desiredWine)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> addDesiredWine(DesiredWineCompanion entry) {
    return into(desiredWine).insert(entry);
  }
}
