import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class SelectedNavItem with ChangeNotifier {
  int _selectedItem = 0; // Default selected item is 0

  int get selectedItem => _selectedItem;

  void setSelectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}


