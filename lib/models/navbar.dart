import 'package:flutter/material.dart';

class NavBar extends ChangeNotifier {
  int index = 4;
  void setCurrentIndex({required int index}) {
    this.index = index;
    notifyListeners();
  }
}
