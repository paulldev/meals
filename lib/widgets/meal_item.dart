import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    // Hack to capitalize the firt letter of a string
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    // Hack to capitalize the firt letter of a string
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: meal.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54, //slightly transparent black background
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, // very long text ...
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(
                        icon: Icons.schedule,
                        label: '${meal.duration.toString()} min',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(
                        icon: Icons.work,
                        label: complexityText,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(
                        icon: Icons.attach_money,
                        label: affordabilityText,
                      ),
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
