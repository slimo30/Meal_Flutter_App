// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';

enum Filter { glutinFree, vegan, vegetarian, lactoseFree }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    Key? key,
    required this.selctedFilter,
  }) : super(key: key);
  final Map<Filter, bool> selctedFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(String title, String subtitle, bool value,
      void Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary, fontSize: 15),
      ),
      value: value,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 32, right: 22),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      body: Column(
        children: [
          buildSwitchListTile(
            'Glutain-free',
            'only include Glutain-free meals',
            selctedFilter[Filter.glutinFree]!,
            (value) {
              setState(() {
                selctedFilter[Filter.glutinFree] = value;
              });
            },
          ),
          buildSwitchListTile(
            'Vegan',
            'only include Vegan meals',
            selctedFilter[Filter.vegan]!,
            (value) {
              setState(() {
                selctedFilter[Filter.vegan] = value;
              });
            },
          ),
          buildSwitchListTile(
            'Vegetarian',
            'only include vegetarian meals',
            selctedFilter[Filter.vegetarian]!,
            (value) {
              setState(() {
                selctedFilter[Filter.vegetarian] = value;
              });
            },
          ),
          buildSwitchListTile(
            'Lactose-Free',
            'only include Lactose-Free meals',
            selctedFilter[Filter.lactoseFree]!,
            (value) {
              setState(() {
                selctedFilter[Filter.lactoseFree] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
