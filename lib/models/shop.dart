import 'package:flutter/material.dart';
import 'package:sushi_flutter/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _menuFood = [
    Food(
      name: "Sushi",
      price: "10.00",
      imagePath: "asset/image/sushi.png",
      rating: "4.7",
    ),
    Food(
      name: "Salmon",
      price: "12.90",
      imagePath: "asset/image/japanese-food.png",
      rating: "4.9",
    ),
  ];

  List<Food> _cart = [];

  List<Food> get cart => _cart;
  List<Food> get foodMenu => _menuFood;

  // add cart
  void addCart(Food foodItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
