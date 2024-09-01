import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/cubit/home_states.dart';

import 'package:recipes_app/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit(this.homeRepo) : super(InitialState());

  final HomeRepo homeRepo;

  Future<void> getAllRecipes() async {
    emit(LoadingState());

    var recipes = await homeRepo.getAllRecipes();

    recipes.fold((faliure) {
      emit(ErrorGetDataState(errMessage: faliure.errMessage));
    }, (recipe) {
      emit(SuccessGetDataState(recipe));
    });
  }

  bool isInstructions = true;
  changebutton() {
    isInstructions = !isInstructions;
    emit(ChangeButtonState());
  }

  String selectedCategory = 'All';
  void selectCategory(String category) {
    selectedCategory = category;
    emit(SelectedCategoryState());
  }

  Future<void> getMealType({required String mealType}) async {
    emit(LoadingMealTypeState());
    selectCategory(mealType);
    var mealTypeRecipe = await homeRepo.getMealType(mealType: mealType);

    mealTypeRecipe.fold(
        (faliure) =>
            emit(ErrorGetMealTypeDataState(errMessage: faliure.errMessage)),
        (mealType) {
      return emit(SuccessGetDataState(mealType));
    });
  }
}
