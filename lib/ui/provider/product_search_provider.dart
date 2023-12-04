// providers/product_provider.dart
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shahbaz_garments_app/data/model/product_search_model.dart';

class ProductSearchProvider with ChangeNotifier {
  List<ProductSearchModel> _products = [];
  String _error = '';

  List<ProductSearchModel> get products => _products;
  String get error => _error;

  Future<void> fetchProducts(String query) async {
    try {
      final List<ProductSearchModel> allProducts = await _fetchProducts(query);
      _products = query.isEmpty
          ? allProducts
          : allProducts
          .where((product) =>
          product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      _error = 'Error fetching products';
    }
    notifyListeners();
  }

  Future<List<ProductSearchModel>> _fetchProducts(String query) async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products?title=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) {
        return ProductSearchModel(
          title: json['title'],
          price: json['price'].toDouble(),
          image: json['image'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
