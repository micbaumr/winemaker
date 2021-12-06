import 'package:flutter/widgets.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/database/moor_value_extension.dart';
import 'package:winemaker/src/future/future_mapper.dart';

import 'must_measurements.dart';

void saveInitialMustMeasurements(MustMeasurements mustMeasurements, BuildContext context) {
  var database = getDatabase(context);
  database.mustDao.addMust(
    MustEntityData(
      id: 1,
      volume: mustMeasurements.volume,
      sugar: mustMeasurements.sugar,
    ),
  );
}

void saveMustMeasurements(MustMeasurements mustMeasurements, BuildContext context) {
  var database = getDatabase(context);
  database.mustDao.updateMust(
    1,
    MustEntityCompanion(
      volume: mustMeasurements.volume.toMoorValue(),
      sugar: mustMeasurements.sugar.toMoorValue(),
    ),
  );
}

Future<MustMeasurements> getMustMeasurementsById(int id, BuildContext context) {
  var database = getDatabase(context);
  return database.mustDao.mustById(id).map((data) => MustMeasurements(data.volume, data.sugar));
}
