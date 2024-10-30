import 'package:flutter/material.dart';
import 'locator.dart';
import 'food_inherited_widget.dart';
import 'food_service.dart';
import 'home_page.dart';

void main() {
  setupLocator(); // Настройка GetIt
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodService = getIt<FoodService>();

    return MaterialApp(
      home: FoodInheritedWidget(
        foodName: foodService.foodName,
        calories: foodService.calories,
        child: HomePage(),
      ),
    );
  }
}

