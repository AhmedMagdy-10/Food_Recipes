// 1.create model
// 2. create home repo

import 'package:dartz/dartz.dart';
import 'package:recipes_app/models/recipes_model.dart';
import 'package:recipes_app/repos/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<RecipesModel>>> getAllRecipes();
  Future<Either<Failure, List<RecipesModel>>> getMealType(
      {required String mealType});
}
