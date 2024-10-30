class FoodService {
  String foodName = 'Salad';
  int calories = 150;

  void updateFood(String name, int cal) {
    foodName = name;
    calories = cal;
  }
}

