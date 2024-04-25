import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/screens/meals.dart';
import 'package:food/widgets/category_grid_item.dart';
import 'package:food/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category){
    final filteredFood = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();


    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredFood,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectedCategory: (){
              _selectCategory(context, category);
            },)
        ],
    );
  }
}