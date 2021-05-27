import 'package:flutter/material.dart';

import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Color(0xFF04009A),
        accentColor: Color(0xFF77ACF1),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'ReggaeOne',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 18,
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}
