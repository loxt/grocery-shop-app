import 'package:flutter/material.dart';

class ShopItem {
  String name;
  String price;
  String imagePath;
  Color color;

  ShopItem(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.color});
}

class CartModel extends ChangeNotifier {
  final List<ShopItem> _shopItems = [
    ShopItem(
        name: "Avocado",
        price: "4.00",
        imagePath: "lib/images/avocado.png",
        color: Colors.green),
    ShopItem(
        name: "Banana",
        price: "2.59",
        imagePath: "lib/images/banana.png",
        color: Colors.yellow),
    ShopItem(
        name: "Chicken",
        price: "18.00",
        imagePath: "lib/images/chicken.png",
        color: Colors.orange),
    ShopItem(
        name: "Water",
        price: "1.69",
        imagePath: "lib/images/water.png",
        color: Colors.blue)
  ];

  final List<ShopItem> _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
