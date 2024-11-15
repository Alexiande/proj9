class FoodService {
  String foodName = 'Pasta';
  int type = 150;

  void updateFood(String name, int cal) {
    foodName = name;
    type = cal;
  }
}

