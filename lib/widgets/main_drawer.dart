import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData icon, Function tapHandler)
  {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: ()
      {
        tapHandler();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                color: Colors.greenAccent,
                width: 3.0,
              )
               )
            ),
            child: Text(
              'Cooking Up...',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(81, 255, 13,1)
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Filter', Icons.storage,
              (){
                Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
              }
          )
        ],
      ),
    );
  }
}
