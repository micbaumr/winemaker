import 'package:moor/moor.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/must/must.dart';

part 'must_dao.g.dart';

@UseDao(tables: [Must])
class MustDao extends DatabaseAccessor<MyDatabase> with _$MustDaoMixin {
  MustDao(MyDatabase db) : super(db);

  Future<List<MustData>> get allMustEntries => select(must).get();

  Future<MustData> mustById(int id) {
    return (select(must)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> addMust(MustCompanion entry) {
    return into(must).insert(entry);
  }
}
