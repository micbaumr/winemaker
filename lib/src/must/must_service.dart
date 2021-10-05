import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/database/moor_value_extension.dart';
import 'package:winemaker/src/future/future_mapper.dart';

import 'must_measurements.dart';

class MustService {
  final BuildContext context;
  MyDatabase database;

  MustService(this.context)
      : database = Provider.of<MyDatabase>(context, listen: false);

  void saveInitialMustMeasurements(MustMeasurements mustMeasurements) {
    database.mustDao.addMust(
      MustEntityData(
        id: 1,
        volume: mustMeasurements.volume,
        sugar: mustMeasurements.sugar,
      ),
    );
  }

  void saveMustMeasurements(MustMeasurements mustMeasurements) {
    database.mustDao.updateMust(
      1,
      MustEntityCompanion(
        volume: mustMeasurements.volume.toMoorValue(),
        sugar: mustMeasurements.sugar.toMoorValue(),
      ),
    );
  }

  Future<MustMeasurements> getMustMeasurementsById(int id) => database.mustDao
      .mustById(id)
      .map((data) => MustMeasurements(data.volume, data.sugar));
}
