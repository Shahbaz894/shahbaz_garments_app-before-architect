import 'package:flutter/foundation.dart';
import 'package:shahbaz_garments_app/data/model/profile_model.dart';
import 'package:shahbaz_garments_app/domain/db_profile.dart';
import '../../data/model/favorite_model.dart';
import '../../domain/db_helper_fav.dart'; // Import your FavoriteProductModel class

class ProfileProvider with ChangeNotifier {
  DBProfile pfdb = DBProfile();
  List<ProfileModel> _profiledb = [];

  List<ProfileModel> get profile => _profiledb;

  // Constructor to load favorites when the provider is created
  ProfileProvider() {
    getData();
  }

  void addProfile(ProfileModel profile) {
    _profiledb.add(profile);
    notifyListeners();
  }
  Future<List<ProfileModel>> getData() async {
    _profiledb = await pfdb.getProfileList();
    notifyListeners();
    return _profiledb;
  }


// Future<void> getData() async {
//   _favorites = await favdb.getFavoritesList();
//   notifyListeners();
//
// }
}
