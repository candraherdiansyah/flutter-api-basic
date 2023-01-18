import 'package:flutter/material.dart';

import 'package:ujikom2023/models/article_model.dart';

import 'helpers/size_helper.dart';
import 'screens/article/article_screen.dart';
import 'screens/article/detail_screen.dart';
import 'service/article_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Get API",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> listArticle = [];
  // ArticleService articleService = ArticleService();

  getData() async {
    var article = await ArticleService.fetchArtikelData();
    listArticle = article.data as List<Data>;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListArticle(listArticle: listArticle),
      ),
    );
  }
}
