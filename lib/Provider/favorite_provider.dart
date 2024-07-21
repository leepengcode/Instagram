import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selected = [];
  List<int> get selelted => _selected;

  void AddFavorite(int val) {
    selelted.add(val);
    notifyListeners();
  }

  void RemoveFavorite(int val) {
    selelted.remove(val);
    notifyListeners();
  }
}
