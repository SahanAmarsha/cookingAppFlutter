import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;

  const TabScreen({this.favouriteMeals});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  int _selectedPageIndex = 0;

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });
  }
  List<Map<String,Object>> _pages;
  @override
  void initState()
  {
    _pages =[
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(favouriteMeals: widget.favouriteMeals),
        'title': 'Your Favourites',
      }
    ];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromRGBO(81, 255, 13,1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor, icon: Icon(Icons.category), title:Text('Categories'),),
          BottomNavigationBarItem(backgroundColor:Theme.of(context).primaryColor, icon: Icon(Icons.star), title: Text('Favourites'),)
        ]
      ),
    ),);
  }
}
