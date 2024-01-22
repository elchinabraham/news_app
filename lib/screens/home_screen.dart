import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';

import '../widgets/news_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _NewsListState();
}

class _NewsListState extends State<HomeScreen> {
  bool isSearching = false;
  final FocusNode searchFocusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();
  List<News> items = [];
  bool isLoading = false;
  bool isAllLoaded = false;
  int currentPageIndex = 0;

  void _getNews() async {
    final newsService = NewsService();
    final _items = await newsService.getNews();
    setState(() {
      items = _items;
    });
  }

  @override
  void initState() {
    _getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                focusNode: searchFocusNode,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  hintText: "Searching...",
                  icon: Icon(
                    Icons.search,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onSubmitted: (e) {})
            : const Text('News'),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Ana səhifə',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Sevimlilər',
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: NewsItem(
              title: items[index].title,
            ),
          );
        },
      ),
    );
  }
}
