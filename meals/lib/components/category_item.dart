import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  _handleOnTapCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const CategoriesMealsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleOnTapCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          )),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          )),
    );
  }
}
