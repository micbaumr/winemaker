import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';

import 'desired_wine_entity.dart';

part 'desired_wine_dao.g.dart';

@UseDao(tables: [DesiredWineEntity])
class DesiredWineDao extends DatabaseAccessor<MyDatabase>
    with _$DesiredWineDaoMixin {
  DesiredWineDao(MyDatabase db) : super(db);

  Future<List<DesiredWineEntityData>> get allDesiredWineEntries =>
      select(desiredWineEntity).get();

  Future<DesiredWineEntityData> desiredWineById(int id) =>
      (select(desiredWineEntity)..where((tbl) => tbl.id.equals(id)))
          .getSingle();

  Future<int> addDesiredWine(DesiredWineEntityData wine) =>
      into(desiredWineEntity).insert(wine);

  Future updateDesiredWine(int id, DesiredWineEntityCompanion wine) {
    return (update(desiredWineEntity)..where((i) => i.id.equals(id)))
        .write(wine);
  }
}
