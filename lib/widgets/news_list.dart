import 'package:flutter/material.dart';

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
  bool isSearching = false;
  final FocusNode searchFocusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();
  List<News> items = [];
  bool isLoading = false;
  bool isAllLoaded = false;
  int currentPageIndex = 0;

  void _getNews(String searchText) async {
    setState(() {
      isLoading = true;
    });

    final newsService = NewsService();
    final _items = await newsService.getNews();

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

  @override
  void initState() {
    _getNews("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var filteredItems = items;

    if (widget.isFavorite) {
      filteredItems = filteredItems
          .where((news) => news.id == "-Nop9y4q8AuvHkaUFkKW")
          .toList();
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
            : const Text(' Ana Səhifə'),
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
