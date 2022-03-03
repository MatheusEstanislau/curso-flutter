import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData theme = ThemeData().copyWith(
    primaryColor: Colors.purple,
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: Colors.purple, secondary: Colors.amber),
    textTheme: ThemeData().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
