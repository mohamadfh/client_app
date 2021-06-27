import 'dart:collection';
import 'package:client_app/Screens/models.dart';
import 'package:flutter/cupertino.dart';

class OrderNotifier extends ChangeNotifier {
  List<InactiveOrder> _cartList = [];

  UnmodifiableListView<InactiveOrder> get cartList =>
      UnmodifiableListView(_cartList);

  addFood(InactiveOrder food) {
    _cartList.add(food);
    notifyListeners();
  }

  Remove_Food(index) {
    _cartList.removeWhere(
        (_food) => _food.restaurant == _cartList[index].restaurant);
    notifyListeners();
  }
}
