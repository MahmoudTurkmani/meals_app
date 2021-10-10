import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(args['id']),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return CategoryMeal(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
      ),
    );
  }
}
