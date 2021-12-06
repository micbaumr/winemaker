import 'package:flutter/widgets.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/future/future_mapper.dart';

import 'desired_wine.dart';

void saveDesiredWineParameters(DesiredWine desiredWine, BuildContext context) {
  var database = getDatabase(context);
  var desiredWineEntityData = DesiredWineEntityData(
    id: 1,
    alcohol: desiredWine.alcohol,
    sugar: desiredWine.sugar,
  );
  database.desiredWineDao.addDesiredWine(desiredWineEntityData);
}

Future<DesiredWine> getDesiredWineById(int id, BuildContext context) {
  var database = getDatabase(context);
  return database.desiredWineDao.desiredWineById(id).map((data) => DesiredWine(data.alcohol, data.sugar));
}
