// lib/providers/cart_provider.dart (UPDATED)

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Part 1: The CartItem Model (WITH NEW FIELDS)
class CartItem {
  final String id; // Unique product ID
  final String title;
  final String genre;   // NEW
  final String format;  // NEW
  final double price;
  int quantity; // Quantity can change

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.genre,  // REQUIRED NEW FIELD
    required this.format, // REQUIRED NEW FIELD
    this.quantity = 1,
  });
}

// Part 2: The CartProvider Class (The Brain)
class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount {
    int total = 0;
    for (var item in _items) {
      total += item.quantity;
    }
    return total;
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += (item.price * item.quantity);
    }
    return total;
  }

  // UPDATED: addItem function now accepts all new parameters
  void addItem(
      String id,
      String title,
      double price,
      String genre, // NEW PARAMETER
      String format, // NEW PARAMETER
      ) {
    var index = _items.indexWhere((item) => item.id == id);

    if (index != -1) {
      // If YES: just increase the quantity 
      _items[index].quantity++;
    } else {
      // If NO: add it to the list as a new item, passing all details
      _items.add(
        CartItem(
          id: id,
          title: title,
          price: price,
          genre: genre,   // PASS NEW FIELD
          format: format, // PASS NEW FIELD
        ),
      );
    }
    notifyListeners(); // Tells the badge and cart screen to rebuild
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}