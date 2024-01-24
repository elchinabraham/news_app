import 'package:flutter/material.dart';
import 'package:news_app/localDatabase/local_storage.dart';
import 'package:news_app/services/my_database.dart';

import '../models/news.dart';
import '../services/news_service.dart';
import 'news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList({
    super.key,
    required this.isFavorite,
  });

  final bool isFavorite;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final FocusNode searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  String favorites = '';

  List<News> items = [];

  bool isLoading = false;
  bool isAllLoaded = false;
  bool isSearching = false;

  int currentPageIndex = 0;

  void _getNews(String searchText) async {
    // final s = MyDatabase();
    // s.fetchPaginatedData(3, '-Nop9y4q8AuvHkaUFkKW');

    setState(() {
      isLoading = true;
    });

    final newsService = NewsService();
    final _items = await newsService.getNews();

    if (mounted) {
      setState(() {
        if (searchText.isNotEmpty) {
          items = _items
              .where((news) =>
                  news.title.toLowerCase().contains(searchText.toLowerCase()) ||
                  news.source.toLowerCase().contains(searchText.toLowerCase()))
              .toList();
        } else {
          items = _items;
        }

        isLoading = false;
      });
    }
  }

  void _getFavorites() async {
    final localStorage = LocalStorage();
    favorites = await localStorage.getFavorite();
  }

  @override
  void initState() {
    _getNews("");
    _getFavorites();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchFocusNode.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredItems = items;

    _getFavorites();

    if (widget.isFavorite) {
      filteredItems =
          filteredItems.where((news) => favorites.contains(news.id)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                focusNode: searchFocusNode,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: "Axtarış...",
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                  hintStyle: TextStyle(fontSize: 18),
                ),
                onSubmitted: (e) {
                  _getNews(e);
                })
            : Text(
                widget.isFavorite ? ' Sevimlilər' : ' Ana Səhifə',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                      _getNews('');
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                      searchFocusNode.requestFocus();
                    });
                  }),
        ],
      ),
      body: !isLoading
          ? ListView.builder(
              controller: _scrollController,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return NewsItem(
                  newId: filteredItems[index].id,
                  title: filteredItems[index].title,
                  imageUrl: filteredItems[index].imageUrl,
                  date: filteredItems[index].getDate,
                  time: filteredItems[index].getTime,
                  source: filteredItems[index].source,
                  description: filteredItems[index].description,
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
