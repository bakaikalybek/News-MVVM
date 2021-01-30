import 'package:flutter/material.dart';
import 'package:news_mvvm/screens/news_article_detail_screen.dart';
import 'package:news_mvvm/viewmodels/news_article_view_model.dart';
import 'package:news_mvvm/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  void _showNewsArticleDetailsScreen(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return NewsArticleDetailsScreen(
          article: article,
        );
      }),
    );
  }

  NewsGrid({this.articles});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetailsScreen(context, article);
          },
          child: GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(imageUrl: article.imageUrl),
            ),
            footer: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
