
import 'package:flutter/material.dart';

import 'package:meal_app/Model/meal.dart';
import 'package:meal_app/Screens/MealDetailsScreens.dart';
import 'package:meal_app/Widgets/MealItem.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    required this.title,
    required this.meals,
  }) : super(key: key);
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
          children: meals
              .map(
                (meal) => MealItem(
                  onSelectMeal: (meal) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MealDetailsScreen(
                        meal: meal,
                      ),
                    ));
                  },
                  meal: meal,
                ),
              )
              .toList()),
    );
  }
}
