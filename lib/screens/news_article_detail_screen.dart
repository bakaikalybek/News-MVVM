import 'package:flutter/material.dart';
import 'package:news_mvvm/viewmodels/news_article_view_model.dart';
import 'package:news_mvvm/widgets/circle_image.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 250,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Author",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    this.article.author ?? "Undefined",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Divider(
                  color: Colors.amber,
                  height: 80,
                  thickness: 20,
                ),
                Text(
                  "Headline",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Text(
              this.article.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: CircleImage(
                imageUrl: this.article.imageUrl,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              this.article.description,
              style: TextStyle(
                fontSize: 16,
                wordSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
