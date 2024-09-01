import 'package:recipes_app/models/recipes_model.dart';

abstract class HomeCubitStates {}

class InitialState extends HomeCubitStates {}

class LoadingState extends HomeCubitStates {}

class SuccessGetDataState extends HomeCubitStates {
  final List<RecipesModel> recipesList;

  SuccessGetDataState(this.recipesList);
}

class ErrorGetDataState extends HomeCubitStates {
  final String errMessage;

  ErrorGetDataState({required this.errMessage});
}

class ChangeButtonState extends HomeCubitStates {}

class SelectedCategoryState extends HomeCubitStates {}

class LoadingMealTypeState extends HomeCubitStates {}

class SuccessGetMealTypeDataState extends HomeCubitStates {
  final List<RecipesModel> recipesList;

  SuccessGetMealTypeDataState(this.recipesList);
}

class ErrorGetMealTypeDataState extends HomeCubitStates {
  final String errMessage;

  ErrorGetMealTypeDataState({required this.errMessage});
}
