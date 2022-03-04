import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          ...dummyCategories.map((e) => Container(
              child: Center(child: Text(e.title, style: Theme.of(context).textTheme.headline6,)),
              decoration: BoxDecoration(
                color: e.color,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              )))
        ],
      ),
    );
  }
}
