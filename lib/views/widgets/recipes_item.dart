import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipes_model.dart';

class RecipesItem extends StatelessWidget {
  const RecipesItem({
    super.key,
    required this.recipesModel,
  });

  final RecipesModel recipesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 1.5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    recipesModel.image,
                  ),
                  fit: BoxFit.fill,
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: Color(0xff2d2d2d),
                    offset: Offset(-2, 5),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black26,
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        recipesModel.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text(
                    '${recipesModel.rating}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '(${recipesModel.cookTimeMinutes})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    ' min',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
