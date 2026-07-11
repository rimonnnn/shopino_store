import 'dart:convert';

import 'package:ecommerce_app/features/favorite_screen/models/favorit_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteLocalDataSource {
  static const String _key = 'favorite_items';

  Future<void> saveFavorites(List<FavoritItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  Future<List<FavoritItemModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList
        .map((e) => FavoritItemModel.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
