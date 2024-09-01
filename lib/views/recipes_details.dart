import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/cubit/home_cubit.dart';
import 'package:recipes_app/cubit/home_states.dart';

import 'package:recipes_app/models/recipes_model.dart';
import 'package:recipes_app/views/widgets/details_Recipe_item.dart';
import 'package:recipes_app/views/widgets/switch_custom_button.dart';

class RecipesDetails extends StatelessWidget {
  const RecipesDetails(
      {super.key, required this.recipesModel, required this.categoryMealType});

  final RecipesModel recipesModel;
  final String? categoryMealType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitStates>(builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailsRecipeItem(
                recipesModel: recipesModel,
                categoryName: categoryMealType,
              ),
              const SwitchCustomButton(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(
                          '${(index + 1).toString()}.',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            BlocProvider.of<HomeCubit>(context).isInstructions
                                ? "${recipesModel.instructions[index]}"
                                : "${recipesModel.ingredients[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: BlocProvider.of<HomeCubit>(context).isInstructions
                      ? recipesModel.instructions.length
                      : recipesModel.ingredients.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
