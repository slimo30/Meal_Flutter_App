// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';

import 'package:meal_app/Model/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  void showInfoM(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 71, 32, 18), // Background color
    elevation: 8, // Elevation (shadow)
    behavior: SnackBarBehavior.floating, // Floating style
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
  ),);
  }

  var clr = Colors.white;
  void onFav(Meal meal) {
    final isExist = favMeal.contains(meal);

    if (isExist) {
      favMeal.remove(meal);
      showInfoM('Removed from favorites');
      setState(() {
        clr = Colors.white;
      });
    } else {
      favMeal.add(meal);
      showInfoM('Marked as favorite');
      setState(() {
        clr = Colors.yellow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onFav(widget.meal);

                debugPrint(' add ${favMeal.length} ${clr.toString()}');
              },
              icon: Icon(Icons.star,
                  color:
                      (favMeal.contains(widget.meal)) ? Colors.yellow : clr)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                widget.meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Ingredient',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 30),
              ),
             const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 229, 103, 103),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  children: [
                    for (final ing in widget.meal.ingredients)
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          ing,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 20),
                        ),
                      ),
                  ],
                ),
              ),
             const SizedBox(
                height: 14,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 229, 103, 103),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    for (final stp in widget.meal.steps)
                      Container(
                        margin:const  EdgeInsets.only(top: 10),
                        child: Text(
                          stp,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                  ],
                ),
              ),
             const  SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
