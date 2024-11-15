import 'package:flutter/material.dart';

class FoodInheritedWidget extends InheritedWidget {
  final String foodName;
  final int type;

  const FoodInheritedWidget({
    Key? key,
    required this.foodName,
    required this.type,
    required Widget child,
  }) : super(key: key, child: child);

  static FoodInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FoodInheritedWidget>();
  }


  @override
  bool updateShouldNotify(FoodInheritedWidget oldWidget) {
    return oldWidget.foodName != foodName || oldWidget.type != type;
  }
}
