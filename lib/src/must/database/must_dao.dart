import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';

import 'must_entity.dart';

part 'must_dao.g.dart';

@UseDao(tables: [MustEntity])
class MustDao extends DatabaseAccessor<MyDatabase> with _$MustDaoMixin {
  MustDao(MyDatabase db) : super(db);

  Future<List<MustEntityData>> get allMustEntries => select(mustEntity).get();

  Future<MustEntityData> mustById(int id) =>
      (select(mustEntity)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> addMust(MustEntityData entry) => into(mustEntity).insert(entry);

  Future updateMust(int id, MustEntityCompanion must) {
    return (update(mustEntity)..where((i) => i.id.equals(id))).write(must);
  }
}
