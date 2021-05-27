import 'package:flutter/material.dart';

import './categories_screen.dart';
import './category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: const Color(0xFF04009A),
        accentColor: const Color(0xFF77ACF1),
        fontFamily: 'ReggaeOne',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 18,
              ),
            ),
      ),
      home: CategoriesScreen(),
      routes: {
        '/category_meals': (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
