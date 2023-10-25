// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';
import 'package:meal_app/Model/category.dart';

import 'package:meal_app/Screens/filters_Screen.dart';
import 'package:meal_app/Widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
    required this.filters,
  }) : super(key: key);

  final Map<Filter, bool> filters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2),
          children: [
            for (final Category e in availableCategories)
              CategoryGridItem(

                category: e, filters: selctedFilter,
              )
          ],
        ),
      ),
    );
  }
}
