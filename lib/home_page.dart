import 'package:flutter/material.dart';
import 'food_inherited_widget.dart';
import 'locator.dart';
import 'food_service.dart';
import 'food_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodService = getIt<FoodService>();
    final inheritedFoodName = FoodInheritedWidget.of(context)?.foodName ?? 'Unknown';
    final inheritedType = FoodInheritedWidget.of(context)?.type ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Info'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.lightGreenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 boxes per row
            childAspectRatio: 1.2, // Adjusts the aspect ratio of the boxes
            crossAxisSpacing: 20, // Space between columns
            mainAxisSpacing: 20, // Space between rows
            children: [
              _buildFoodBox('InheritedWidget: $inheritedFoodName', 'Type: $inheritedType'),
              _buildFoodBox('GetIt: ${foodService.foodName}', 'Type: ${foodService.type}'),
              _buildFoodBox('Food Item 3', 'Type: 3'),
              _buildFoodBox('Food Item 4', 'Type: 4'),
              // Add more boxes as needed
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodService.updateFood('Pasta', 400);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodDetailsPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  Widget _buildFoodBox(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}