import 'package:flutter/material.dart';
class NewsAndArticle extends StatefulWidget {
  const NewsAndArticle({super.key});

  @override
  State<NewsAndArticle> createState() => _NewsAndArticleState();
}

class _NewsAndArticleState extends State<NewsAndArticle> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("News"),),
    );
  }
}
