import 'package:flutter/material.dart';

class CurrentPageProvider extends ChangeNotifier {
  int currentPage = 0;

  setCurrentPage(int val) {
    currentPage = val;
    notifyListeners();
  }
}
