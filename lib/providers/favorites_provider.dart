import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<String> _favorites = [];
  final _prefs = SharedPreferences.getInstance();

  List<String> get favorites => _favorites;

  void init() async {
    final prefs = await _prefs;
    _favorites = (prefs.getStringList('favorites') ?? []).toList();
    notifyListeners();
  }

  void toggleFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
    _prefs.then((prefs) => prefs.setStringList(
        'favorites', _favorites.map((e) => e.toString()).toList()));
  }
}
