import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'Model/article_model.dart';
import 'bottom_nav_bar.dart';
import 'package:http/http.dart' as http;

Future<List<ArticleDataModel>> _fetchArticleList() async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=75757f73a54a462182aaf7a2b409fbca'));

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    // Check if the response contains the key "articles" with a list value
    if (responseBody.containsKey('articles') && responseBody['articles'] is List) {
      final List<dynamic> jsonData = responseBody['articles'];
      return jsonData.map((articleJson) => ArticleDataModel.fromJson(articleJson)).toList();
    } else {
      throw Exception('Invalid API response: Missing "articles" key or invalid data type');
    }
  } else {
    throw Exception('Failed to load News');
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("N E W S   A P P ", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xffEDE9FE),
      ),
      body: FutureBuilder<List<ArticleDataModel>>(
        future: _fetchArticleList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final List<ArticleDataModel>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return NewsTile(articleDataModel: articles[index]);
              },
            );
          } else {
            return Center(
              child: Text("No data available."),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
    );
  }
}
