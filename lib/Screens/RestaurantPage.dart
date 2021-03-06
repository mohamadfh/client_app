import 'package:flutter/material.dart';
import 'package:client_app/Screens/models.dart';

class ResPage extends StatelessWidget {
  Restaurant res;
  ResPage({
    Key key,
    this.res,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          res.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: res.menu.length,
        itemBuilder: (context, index) {
          return FoodItemCard(
            item: res.menu[index],
          );
        },
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  FoodItem item;
  FoodItemCard({
    Key key,
    this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Column(
          children: [
            Text(item.name),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
