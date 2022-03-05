import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.pink,
      fontFamily: 'Raleway',
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    ),
      home: const MealsApp(),
    );
  }
}

class MealsApp extends StatefulWidget {
  const MealsApp({Key? key}) : super(key: key);

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos cozinhar?'),
      ),
      body: CategoriesScreen()
    );
  }
}
