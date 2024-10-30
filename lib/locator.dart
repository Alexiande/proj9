import 'package:get_it/get_it.dart';
import 'food_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FoodService>(() => FoodService());
}
