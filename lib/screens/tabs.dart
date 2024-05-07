import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';
import 'package:food/screens/categories.dart';
import 'package:food/screens/meals.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting =_favouriteMeals.contains(meal);

    if (isExisting){
      setState(() {
        _favouriteMeals.remove(meal);

      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage =  MealsScreen(meals: _favouriteMeals, onToggleFavourite: _toggleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories' ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites' )

        ],
      ),
    );
  }
}
