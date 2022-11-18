import 'package:flutter/cupertino.dart';
import '/models/carItem.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;
  
  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.qty! * cartItem.price!);
    });
    return total;
  }

  int get jumlah {
    return _items.length;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty! + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }
    notifyListeners();
  }
}
