import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-details';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Color _color = Colors.white;

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContent(BuildContext context, Widget child) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final detailMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(detailMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              child: Image.network(
                detailMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingradients'),
            buildContent(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        detailMeal.ingredients[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  itemCount: detailMeal.ingredients.length,
                )),
            buildTitle(context, 'Steps'),
            buildContent(
              context,
              ListView.builder(
                itemCount: detailMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(detailMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.star,
          color: _color,
        ),
        onPressed: () {
          if (_color == Colors.white) {
            setState(() {
              _color = Colors.amber;
            });
            Fluttertoast.showToast(
              msg: "Added to Favorites",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            setState(() {
              _color = Colors.white;
            });
            Fluttertoast.showToast(
              msg: "Removed from Favorites",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      ),
    );
  }
}
