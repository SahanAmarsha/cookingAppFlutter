import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String,bool> setFilters;

  const FilterScreen({this.setFilters, this.saveFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var isGlutenFree = false;
  var isVegetarian = false;
  var isVegan = false;
  var isLactoseFree = false;

  @override
  initState()
  {

    isGlutenFree = widget.setFilters['gluten'];
    isLactoseFree = widget.setFilters['lactose'];
    isVegan  = widget.setFilters['vegan'];
    isVegetarian = widget.setFilters['vegetarian'];

    super.initState();
  }

  Widget buildListTile(
      String title,
      String desc,
      bool currentValue,
      Function updateValue,
      )
  {
    return  SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(
            desc
        ),
        onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Your Filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters =
                {
                  'gluten' : isGlutenFree,
                  'lactose' : isLactoseFree,
                  'vegan' : isVegan,
                  'vegetarian' : isVegetarian
                };
                widget.saveFilters();
              },
            )
          ],),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection. ',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildListTile('Gluten-Free', 'Only include Gluten Free Meals', isGlutenFree,
                          (newValue) {
                        setState(() {
                          isGlutenFree = newValue;
                        });
                      }
                  ),
                  buildListTile('Lactose-Free', 'Only include Lactose Free Meals', isLactoseFree,
                          (newValue) {
                        setState(() {
                          isLactoseFree= newValue;
                        });
                      }
                  ),
                  buildListTile('Vegeterian', 'Only include Vegeterian Meals', isVegetarian,
                          (newValue) {
                        setState(() {
                          isVegetarian = newValue;
                        });
                      }
                  ),
                  buildListTile('Vegan', 'Only include Vegan Meals', isVegan,
                          (newValue) {
                        setState(() {
                          isVegan = newValue;
                        });
                      }
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}