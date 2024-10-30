import 'package:flutter/material.dart';
import 'food_inherited_widget.dart';
import 'locator.dart';
import 'food_service.dart';

class FoodDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodService = getIt<FoodService>();
    final inheritedFoodName = FoodInheritedWidget.of(context)?.foodName ?? 'Unknown';
    final inheritedCalories = FoodInheritedWidget.of(context)?.calories ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'InheritedWidget: $inheritedFoodName, Calories: $inheritedCalories',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'GetIt: ${foodService.foodName}, Calories: ${foodService.calories}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

