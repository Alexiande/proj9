import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodForm(),
    );
  }
}

class Food {
  final String name;
  final String type;
  final int calories;
  final String description;
  final String ingredients;
  final String preparationTime;
  final String servingSize;

  Food({
    required this.name,
    required this.type,
    required this.calories,
    required this.description,
    required this.ingredients,
    required this.preparationTime,
    required this.servingSize,
  });
}

class FoodForm extends StatefulWidget {
  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String type = '';
  int calories = 0;
  String description = '';
  String ingredients = '';
  String preparationTime = '';
  String servingSize = '';
  List<Food> foodList = [];

  void _createFood() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final food = Food(
        name: name,
        type: type,
        calories: calories,
        description: description,
        ingredients: ingredients,
        preparationTime: preparationTime,
        servingSize: servingSize,
      );
      setState(() {
        foodList.add(food);
      });
      _formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Создана еда: ${food.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Форма еды')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Название'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите название еды';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Тип'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите тип еды';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      type = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Калории'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите калорийность';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Введите корректное число';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      calories = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Описание'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите описание еды';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      description = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ингредиенты'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите ингредиенты';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      ingredients = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Время приготовления'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите время приготовления';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      preparationTime = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Размер порции'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите размер порции';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      servingSize = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _createFood,
                    child: Text('Создать еду'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  final food = foodList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(food.name),
                      subtitle: Text(
                          'Тип: ${food.type}\nКалории: ${food.calories}\nОписание: ${food.description}\nИнгредиенты: ${food.ingredients}\nВремя: ${food.preparationTime}\nПорция: ${food.servingSize}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


