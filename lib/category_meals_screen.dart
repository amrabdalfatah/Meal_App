import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  const CategoryMealsScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('The recipes for category!'),
      ),
    );
  }
}
