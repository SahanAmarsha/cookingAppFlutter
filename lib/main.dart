import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  List<Meal> _favouriteMeals =[];

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData)
  {
    _filters=filterData;
    _availableMeals= DUMMY_MEALS.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree)
        {
          return false;
        }
      if(_filters['lactose'] && !meal.isLactoseFree)
      {
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan)
      {
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian)
      {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavourite(String mealId)
  {
    final existingIndex= _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0)
      {
        setState(() {
          _favouriteMeals.removeAt(existingIndex);
        });
      } else
        {
          _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
        }
  }

  bool _isMealFavourite(String id)
  {
    return _favouriteMeals.any((meal) => meal.id== id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        // This is the theme of your application.
          primarySwatch: Colors.blue,
          accentColor: Color.fromRGBO(0, 193, 152, 1.0),
          canvasColor: Color.fromRGBO(249, 243, 230, 1.0),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1.0),
              ),

              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1.0),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )
          )
      ),
      //home: CategoriesScreen(),
      initialRoute: '/', // default is '/'

      routes:  {
        '/': (ctx) => TabScreen(favouriteMeals: _favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>  CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>  MealDetailScreen(toggleFavourite: _toggleFavourite, isMealFavourite: _isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(setFilters: _filters, saveFilters: _setFilters),

      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

