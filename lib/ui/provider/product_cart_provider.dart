

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/product_model.dart';
import '../../domain/db_helper.dart';


class ProductCartProvider with ChangeNotifier{

  DBHelper db = DBHelper() ;
  int _counter = 0 ;
  int get counter => _counter;
  int _cartCounter=0;
  int get cartCounter=> _cartCounter;
  double _totalPrice = 0.0 ;
  double get totalPrice => _totalPrice;

  late Future<List<ProductModel>> _cart ;
  Future<List<ProductModel>> get cart => _cart ;

  Future<List<ProductModel>> getData () async {
    _cart = db.getCartList();
    //print(_cart);
    return _cart ;
  }


  void _setPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    _counter = prefs.getInt('cart_item') ??0;
    _totalPrice = prefs.getDouble('total_price') ??0;
    notifyListeners();
  }


  void addTotalPrice (double productPrice){
    _totalPrice = _totalPrice +productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    _totalPrice = _totalPrice  - productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice (){
    _getPrefItems();
    return  _totalPrice ;
  }


  void addCounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter (){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter (){
    _getPrefItems();
    return  _counter ;

  }


  ////////////////////////////
  // void _setCartCounterPref()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance() ;
  //   prefs.setInt('cart_counter_badge', _cartCounter);
  //
  //   notifyListeners();
  // }
  //
  // void _getCartCounterPref()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance() ;
  //   _cartCounter = prefs.getInt('cart_counter_badge') ??0;
  //
  //   notifyListeners();
  // }
  // void addCartNoCounter (){
  //   _cartCounter++;
  //   _setCartCounterPref();
  //   notifyListeners();
  // }
  //
  // void removeCartNoCounter (){
  //   _cartCounter--;
  //   _getCartCounterPref();
  //   notifyListeners();
  // }
  //
  // int getCartCounterNo (){
  //   _getCartCounterPref();
  //   return  _cartCounter ;
  //
  // }


}
