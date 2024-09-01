import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipes_app/models/recipes_model.dart';
import 'package:recipes_app/repos/api_helper.dart';
import 'package:recipes_app/repos/failure.dart';
import 'package:recipes_app/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl(this.apiHelper);
  @override
  Future<Either<Failure, List<RecipesModel>>> getAllRecipes() async {
    try {
      var data = await apiHelper.get(endPoints: 'recipes');

      List<dynamic> recipesList = data['recipes'];

      List<RecipesModel> recipes = [];
      for (var eachRecipes in recipesList) {
        RecipesModel recipesModel = RecipesModel.fromJson(eachRecipes);
        recipes.add(recipesModel);
      }

      return right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecipesModel>>> getMealType(
      {required String mealType}) async {
    try {
      var data = await apiHelper.get(endPoints: 'recipes/meal-type/$mealType');

      List<dynamic> recipesList = data['recipes'];

      List<RecipesModel> recipes = [];
      for (var eachRecipes in recipesList) {
        RecipesModel recipesModel = RecipesModel.fromJson(eachRecipes);
        recipes.add(recipesModel);
      }

      return right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
