import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';

import 'package:meal_app/Screens/filters_Screen.dart';

import 'package:meal_app/Screens/meals_screeens.dart';

import '../Model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    Key? key,
    required this.category,
    required this.filters,
  }) : super(key: key);
  final Category category;
  final Map<Filter, bool> filters;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final availableMeals = dummyMeals.where((meal) {
          if (filters[Filter.glutinFree]! && meal.isGlutenFree) {
            return false;
          }
          if (filters[Filter.lactoseFree]! && meal.isLactoseFree) {
            return false;
          }
          if (filters[Filter.vegan]! && meal.isVegan) {
            return false;
          }
          if (filters[Filter.vegetarian]! && meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();

        final filteredMeal = availableMeals
            .where(
              (meal) => (meal.categories.contains(category.id)),
            )
            .toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeal,
          ),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.54),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}
