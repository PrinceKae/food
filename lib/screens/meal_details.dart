import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';



class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;

  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: (){onToggleFavourite(meal);}, icon: const Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold
                  ),
            ),
            const SizedBox(height: 14,),
            for (final ingredients in meal.ingredients)
              Text(ingredients, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
    'Steps',
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
    color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.bold
    ),),
                ),
            const SizedBox(height: 14,),
            for (final steps in meal.steps)
              Text(steps, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
