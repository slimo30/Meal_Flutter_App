// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';

import 'package:meal_app/Screens/Categories_Screen.dart';
import 'package:meal_app/Screens/meals_screeens.dart';
import 'package:meal_app/Widgets/main_drawe.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      filters: selctedFilter,
    );
    var activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        title: 'Favorites',
        meals: favMeal,
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: (_selectedIndex == 0)
          ? AppBar(
              title: Text(activePageTitle),
            )
          : null,
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
