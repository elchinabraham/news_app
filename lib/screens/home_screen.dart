import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:news_app/widgets/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _NewsListState();
}

class _NewsListState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget selectedPage() {
    if (currentPageIndex == 1) {
      return const Settings();
    } else if (currentPageIndex == 2) {
      return const NewsList(isFavorite: true);
    }
    return const NewsList(isFavorite: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.yellow[600],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Ana səhifə',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Tənzimləmələr',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Sevimlilər',
          ),
        ],
      ),
      body: selectedPage(),
    );
  }
}
