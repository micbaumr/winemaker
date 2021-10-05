import 'package:winemaker/src/recipe/recipe.dart';
import 'package:winemaker/src/recipe/task.dart';
import 'package:winemaker/src/recipe/task_type.dart';

final Recipe redWineRecipe = Recipe([
  Task("Desired wine parameters", TaskType.desiredWineForm),
  Task("Must parameters measurement", TaskType.measurementForm),
  Task("Must parameters displayed", TaskType.simpleTask),
  Task("Add first ingredients", TaskType.addingIngredients),
  Task("Add second ingredients", TaskType.addingIngredients),
]);
