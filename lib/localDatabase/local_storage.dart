import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setRegime(bool active) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setBool('lightMode', active);
  }

  Future<bool> getRegime() async {
    final SharedPreferences prefs = await _prefs;
    final isLight = prefs.getBool('lightMode');

    return isLight ?? false;
  }

  Future<void> removeAllFavorite() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("favorites");
  }

  Future<void> trigFavorite(String newsId) async {
    final SharedPreferences prefs = await _prefs;
    var favorites = prefs.getString('favorites');

    if (favorites != null) {
      if (favorites.contains(newsId)) {
        favorites = favorites.replaceAll(newsId, '');
      } else {
        favorites += ",$newsId";
      }
    } else {
      favorites = newsId;
    }

    await prefs.remove("favorites");

    if (favorites.isNotEmpty && favorites.substring(0, 1) == ',') {
      favorites = favorites.substring(1);
    }

    if (favorites.isNotEmpty) {
      await prefs.setString('favorites', favorites);
    } else {
      await prefs.remove("favorites");
    }
  }

  Future<String> getFavorite() async {
    final SharedPreferences prefs = await _prefs;
    final favorites = prefs.getString('favorites');

    return favorites ?? "";
  }
}
