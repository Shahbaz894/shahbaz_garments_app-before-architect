
import 'package:flutter/material.dart';

import '../../data/model/shipping_address_model.dart';



class ShippingAddressProvider with ChangeNotifier {
  List<ShippingAddress> _addresses = [];

  List<ShippingAddress> get addresses => _addresses;

  void addShippingAddress(ShippingAddress address) {
    _addresses.add(address);
    notifyListeners();
  }

  void updateShippingAddress(ShippingAddress address) {
    final index = _addresses.indexWhere((a) => a.id == address.id);
    if (index != -1) {
      _addresses[index] = address;
      notifyListeners();
    }
  }
  void getShippingAddress(ShippingAddress address) {
    final index = _addresses.indexWhere((a) => a.id == address.id);
    if (index != -1) {
      _addresses[index] = address;
      notifyListeners();
    }
  }

  void deleteShippingAddress(int id) {
    _addresses.removeWhere((a) => a.id == id);

    notifyListeners();
  }
}






















// ...


