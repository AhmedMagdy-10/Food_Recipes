import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/cubit/home_cubit.dart';

import 'package:recipes_app/models/recipes_model.dart';
import 'package:recipes_app/responsive_helper/size_provider.dart';
import 'package:recipes_app/responsive_helper/sizer_helper.dart';

class DetailsRecipeItem extends StatelessWidget {
  const DetailsRecipeItem({
    super.key,
    required this.categoryName,
    required this.recipesModel,
  });

  final RecipesModel recipesModel;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) => SizeProvider(
        baseSize: const Size(250, 250),
        width: size.maxWidth,
        height: size.maxHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CachedNetworkImage(
              imageUrl: recipesModel.image,
              height: context.sizeProvider.height * 0.50,
              width: context.sizeProvider.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: context.setMinSize(20), top: context.setMinSize(30)),
              child: IconButton(
                onPressed: () {
                  if (categoryName != null) {
                    BlocProvider.of<HomeCubit>(context)
                        .getMealType(mealType: categoryName!);
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    BlocProvider.of<HomeCubit>(context).getAllRecipes();
                  }
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              right: 30,
              left: 30,
              child: Container(
                height: context.sizeProvider.height * 0.16,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(context.setMinSize(12)),
                  color: Colors.amberAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.setMinSize(12),
                          left: context.setMinSize(12),
                          right: context.setMinSize(12)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipesModel.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: context.setSp(18),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  recipesModel.mealType[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.setSp(18),
                                  ),
                                ),
                                const Text(
                                  ' & ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  recipesModel.cuisine,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.setSp(18),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: context.sizeProvider.height * 0.065,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            context.setMinSize(12),
                          ),
                          bottomRight: Radius.circular(
                            context.setMinSize(12),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.setMinSize(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                            ),
                            Text(
                              '${recipesModel.rating}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Icon(
                              Icons.timer,
                              color: Colors.blue,
                            ),
                            Text(
                              '${recipesModel.cookTimeMinutes}m',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Icon(
                              Icons.accessibility_new,
                              color: Colors.black,
                            ),
                            Text(
                              '${recipesModel.caloriesPerServing} CAl',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
