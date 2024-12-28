import 'package:flutter/material.dart';
import 'package:happy_petshop/models/product.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Product product, int quantity) {
    _cartItems.add({'product': product, 'quantity': quantity});
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item['product'].id == product.id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item['product'].price * item['quantity'];
    }
    return total;
  }
}
