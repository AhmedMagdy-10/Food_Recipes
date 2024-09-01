import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/cubit/home_cubit.dart';
import 'package:recipes_app/cubit/home_states.dart';
import 'package:recipes_app/responsive_helper/size_provider.dart';
import 'package:recipes_app/responsive_helper/sizer_helper.dart';
import 'package:recipes_app/views/recipes_details.dart';
import 'package:recipes_app/views/widgets/modifyed_button.dart';
import 'package:recipes_app/views/widgets/recipes_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitStates>(
      listener: (context, state) {
        if (state is ErrorGetMealTypeDataState) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Text(state.errMessage),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Recipes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            elevation: 0,
          ),
          body: LayoutBuilder(
            builder: (context, size) => SizeProvider(
              baseSize: Size(size.maxWidth, size.maxHeight),
              height: size.maxHeight,
              width: size.maxWidth,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(context.setMinSize(20)),
                  child: Column(
                    children: [
                      const CategoryMealType(),
                      SizedBox(
                        height: context.setHeight(20),
                      ),
                      state is SuccessGetDataState
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipesDetails(
                                        categoryMealType:
                                            BlocProvider.of<HomeCubit>(context)
                                                .selectedCategory,
                                        recipesModel: state.recipesList[index],
                                      ),
                                    ),
                                  );
                                },
                                child: RecipesItem(
                                  recipesModel: state.recipesList[index],
                                ),
                              ),
                              itemCount: state.recipesList.length,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoryMealType extends StatelessWidget {
  const CategoryMealType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitStates>(builder: (context, state) {
      return LayoutBuilder(
        builder: (context, size) => SizeProvider(
          baseSize: const Size(200, 200),
          width: size.maxWidth,
          height: size.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories ',
                style: TextStyle(
                  fontSize: context.setSp(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.setHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonModifyed(
                    text: 'All',
                    color:
                        BlocProvider.of<HomeCubit>(context).selectedCategory ==
                                'All'
                            ? Colors.blue
                            : Colors.white,
                    onTapButton: () {
                      BlocProvider.of<HomeCubit>(context).getAllRecipes();
                    },
                  ),
                  CustomButtonModifyed(
                    onTapButton: () {
                      BlocProvider.of<HomeCubit>(context)
                          .getMealType(mealType: 'snack');
                    },
                    color:
                        BlocProvider.of<HomeCubit>(context).selectedCategory ==
                                'snack'
                            ? Colors.blue
                            : Colors.white,
                    text: 'Snack',
                  ),
                  CustomButtonModifyed(
                    onTapButton: () {
                      BlocProvider.of<HomeCubit>(context)
                          .getMealType(mealType: 'dinner');
                    },
                    color:
                        BlocProvider.of<HomeCubit>(context).selectedCategory ==
                                'dinner'
                            ? Colors.blue
                            : Colors.white,
                    text: 'Dinner',
                  ),
                ],
              ),
              SizedBox(
                height: context.setHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonModifyed(
                    text: 'Lunch',
                    onTapButton: () {
                      BlocProvider.of<HomeCubit>(context)
                          .getMealType(mealType: 'lunch');
                    },
                    color:
                        BlocProvider.of<HomeCubit>(context).selectedCategory ==
                                'lunch'
                            ? Colors.blue
                            : Colors.white,
                  ),
                  CustomButtonModifyed(
                    onTapButton: () {
                      BlocProvider.of<HomeCubit>(context)
                          .getMealType(mealType: 'appetizer');
                    },
                    text: 'appetizer',
                    color:
                        BlocProvider.of<HomeCubit>(context).selectedCategory ==
                                'appetizer'
                            ? Colors.blue
                            : Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
