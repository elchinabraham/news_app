import 'package:flutter/material.dart';

import '../localDatabase/local_storage.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.newsId,
  });

  final String newsId;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  Future _makeFavorite(String newsId) async {
    final localStorage = LocalStorage();
    await localStorage.trigFavorite(newsId);
  }

  Future _removeAllFavorite() async {
    final localStorage = LocalStorage();
    await localStorage.removeAllFavorite();
  }

  @override
  void initState() {
    // _removeAllFavorite();
    _isFavorite();
    super.initState();
  }

  void _isFavorite() async {
    final localStorage = LocalStorage();
    final favorites = await localStorage.getFavorite();

    print("favorites: $favorites");

    setState(() {
      isFavorite = favorites.contains(widget.newsId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await _makeFavorite(widget.newsId);
        if (isFavorite) {
          setState(() {
            isFavorite = false;
          });
        } else {
          setState(() {
            isFavorite = true;
          });
        }
      },
      child: Row(
        children: [
          Icon(
            !isFavorite ? Icons.favorite_border : Icons.favorite,
            color: Colors.red,
          ),
          const SizedBox(width: 4),
          const Text(
            'Sevimlilər',
          ),
        ],
      ),
    );
  }
}
