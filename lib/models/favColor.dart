import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favColor with ChangeNotifier {
  bool _isFavoriteColorized = true;

  bool get isFavoriteColorized => _isFavoriteColorized;

  set isFavoriteColorized(bool value) {
    _isFavoriteColorized = value;
    notifyListeners();
  }

  Color get color => (_isFavoriteColorized) ? Colors.green : Colors.blue;
}
