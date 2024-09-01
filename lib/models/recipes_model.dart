class RecipesModel {
  final dynamic id;
  final String name;
  final List<dynamic> ingredients;
  final List<dynamic> instructions;
  final List<dynamic> mealType;
  final dynamic prepTimeMinutes;
  final dynamic cookTimeMinutes;
  final dynamic rating;
  final dynamic caloriesPerServing;
  final String image;
  final String cuisine;

  RecipesModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.rating,
    required this.image,
    required this.cuisine,
    required this.mealType,
    required this.caloriesPerServing,
  });

  factory RecipesModel.fromJson(data) {
    return RecipesModel(
      id: data['id'],
      name: data['name'],
      ingredients: data['ingredients'],
      instructions: data['instructions'],
      prepTimeMinutes: data['prepTimeMinutes'],
      cookTimeMinutes: data['cookTimeMinutes'],
      rating: data['rating'],
      image: data['image'],
      cuisine: data['cuisine'],
      mealType: data['mealType'],
      caloriesPerServing: data['caloriesPerServing'],
    );
  }
}
