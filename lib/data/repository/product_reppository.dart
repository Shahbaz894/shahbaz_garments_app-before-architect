import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/product_model.dart';




class MyProductProvider extends ChangeNotifier {

  List<ProductModel> _myProductList = [];

  List<ProductModel> get myDataList => _myProductList;

  Future<List<ProductModel>> getProduct() async {
    final resposne = await http.get(
        Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(resposne.body.toString());
   // print(data);
    if (resposne.statusCode == 200) {
      // _myProductList.clear();
      for (Map<String, dynamic> i in data) {
        _myProductList.add(ProductModel.fromJson(i));
      }
      return _myProductList;
    } else {
      return _myProductList;
    }
  }


}
