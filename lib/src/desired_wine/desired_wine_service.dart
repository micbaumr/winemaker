import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/src/future/future_mapper.dart';

import 'desired_wine.dart';

class DesiredWineService {
  final BuildContext context;
  final MyDatabase database;

  DesiredWineService(this.context)
      : database = Provider.of<MyDatabase>(context, listen: false);

  void saveDesiredWineParameters(DesiredWine desiredWine) {
    database.desiredWineDao.addDesiredWine(
      DesiredWineEntityData(
        id: 1,
        alcohol: desiredWine.alcohol,
        sugar: desiredWine.sugar,
      ),
    );
  }

  Future<DesiredWine> getDesiredWineById(int id) => database.desiredWineDao
      .desiredWineById(id)
      .map((data) => DesiredWine(data.alcohol, data.sugar));
}
