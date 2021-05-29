import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Theme.of(context).primaryColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 120,
              child: Container(
                width: 100,
                child: Text(
                  'cooking Up!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          Divider(),
        ],
      ),
    );
  }
}
