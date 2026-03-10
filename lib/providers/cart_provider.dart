import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {

  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

}

class CartProvider extends ChangeNotifier {

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void add(Product product) {

    final index =
        _items.indexWhere((element) => element.product.id == product.id);

    if (index >= 0) {

      _items[index].quantity++;

    } else {

      _items.add(CartItem(product: product));

    }

    notifyListeners();

  }

  void increase(Product product) {

    final item =
        _items.firstWhere((element) => element.product.id == product.id);

    item.quantity++;

    notifyListeners();

  }

  void decrease(Product product) {

    final item =
        _items.firstWhere((element) => element.product.id == product.id);

    if (item.quantity > 1) {

      item.quantity--;

    } else {

      _items.remove(item);

    }

    notifyListeners();

  }

  double get total {

    double sum = 0;

    for (var item in _items) {
      sum += item.product.price * item.quantity;
    }

    return sum;

  }

}