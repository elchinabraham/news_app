import 'package:flutter/material.dart';
import 'package:news_app/screens/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.source,
    required this.description,
  });

  final String title;
  final String imageUrl;
  final String date;
  final String time;
  final String source;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          elevation: 5,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                      // child: Image.asset(
                      //   'assets/images/twitter.png',
                      //   fit: BoxFit.fitWidth,
                      // ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black.withAlpha(0),
                            Colors.black12,
                            Colors.black26
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.source),
                        const SizedBox(width: 5),
                        Text(
                          source,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.date_range),
                        const SizedBox(width: 5),
                        Text(
                          date,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => NewsDetailsScreen(
              title: title,
              date: date,
              time: time,
              description: description,
              imageUrl: imageUrl,
              source: source,
            ),
          ),
        );
      },
    );
  }
}
