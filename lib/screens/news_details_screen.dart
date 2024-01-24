import 'package:flutter/material.dart';

import '../widgets/favorite_button.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    super.key,
    required this.newId,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.imageUrl,
    required this.source,
  });

  final String newId;
  final String title;
  final String description;
  final String date;
  final String time;
  final String source;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            expandedHeight: 270.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tarix: $date',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Saat: $time',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FavoriteButton(newsId: newId),
                        ],
                      ),
                    ),
                    const Divider(thickness: 0.3),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: Text(description),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 14, bottom: 14, top: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const Icon(Icons.source),
                          const SizedBox(width: 5),
                          const Text('Müəllif:'),
                          const SizedBox(width: 20),
                          Text(
                            source,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
