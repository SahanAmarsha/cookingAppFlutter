import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;

  const FavouriteScreen({this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty)
    {
      return Center(
        child: Text('You have no favourites yet - start adding some') ,
      );
    } else
    {
      return ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          id: favouriteMeals[index].id,
          title: favouriteMeals[index].title,
          affordability: favouriteMeals[index].affordability,
          complexity: favouriteMeals[index].complexity,
          duration: favouriteMeals[index].duration,
          imageUrl: favouriteMeals[index].imageUrl,

        );
      },itemCount: favouriteMeals.length);
    }

  }
}
