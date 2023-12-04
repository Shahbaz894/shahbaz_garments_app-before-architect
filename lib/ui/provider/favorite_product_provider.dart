import 'package:flutter/foundation.dart';
import '../../data/model/favorite_model.dart';
import '../../domain/db_helper_fav.dart'; // Import your FavoriteProductModel class

class FavoritesProductProvider with ChangeNotifier {
  DBHelperFav favdb = DBHelperFav();
  List<FavoriteProductModel> _favorites = [];

  List<FavoriteProductModel> get favorites => _favorites;

  // Constructor to load favorites when the provider is created
  FavoritesProductProvider() {
    getData();
  }

  void addFavorite(FavoriteProductModel favorite) {
    _favorites.add(favorite);
    notifyListeners();
  }
  Future<List<FavoriteProductModel>> getData() async {
    _favorites = await favdb.getFavoritesList();
    notifyListeners();
    return _favorites;
  }


// Future<void> getData() async {
  //   _favorites = await favdb.getFavoritesList();
  //   notifyListeners();
  //
  // }
}
