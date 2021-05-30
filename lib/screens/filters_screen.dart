import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  // this is function which pass from main and will send and declare which filter
  // is active and uses in Icon of AppBar to save Filters
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // The 4 properties for chick the items
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarianFree = false;
  var _veganFree = false;

  Widget _buildSwitch(
      String title, String subTitle, bool val, Function update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: val,
      onChanged: update,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarianFree = widget.currentFilters['vegetarian'];
    _veganFree = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarianFree,
                'vegan': _veganFree,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjust your meal selections',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                _buildSwitch(
                  'Gluten-Free',
                  'Only include Gluten-Free Meals',
                  _glutenFree,
                  (checked) {
                    setState(() {
                      _glutenFree = checked;
                    });
                  },
                ),
                _buildSwitch(
                  'Lactose-Free',
                  'Only include Lactose-Free Meals',
                  _lactoseFree,
                  (checked) {
                    setState(() {
                      _lactoseFree = checked;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegetarian',
                  'Only include Vegetarian Meals',
                  _vegetarianFree,
                  (checked) {
                    setState(() {
                      _vegetarianFree = checked;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegan',
                  'Only include Vegan Meals',
                  _veganFree,
                  (checked) {
                    setState(() {
                      _veganFree = checked;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
