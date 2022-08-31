import 'package:flutter/material.dart';

class Checker extends ChangeNotifier {
  bool isAgree = false;
  bool isHome = false;
  bool isOffice = false;
  void agree() {
    isAgree = !isAgree;
    notifyListeners();
  }

  void home() {
    isHome = !isHome;
    notifyListeners();
  }

  void office() {
    isOffice = !isOffice;
    notifyListeners();
  }
}
