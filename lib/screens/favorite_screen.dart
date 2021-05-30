import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoriteScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Center(
            child: Text('No Meals Favorite'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(favorites[index]);
            },
            itemCount: favorites.length,
          );
  }
}
