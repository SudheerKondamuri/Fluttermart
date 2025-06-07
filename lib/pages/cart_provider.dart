import 'package:flutter/material.dart';
import 'package:fluttermart/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    final index = _items.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void increaseQty(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQty(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      _items.remove(product);
    }
    notifyListeners();
  }
  
  void clearCart() {
  _items.clear();
  notifyListeners();
  }

  int get total =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);
}
