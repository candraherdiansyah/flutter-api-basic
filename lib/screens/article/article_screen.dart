import 'package:flutter/material.dart';

import '../../helpers/size_helper.dart';
import '../../models/article_model.dart';
import 'detail_screen.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({
    Key? key,
    required this.listArticle,
  }) : super(key: key);

  final List<Data> listArticle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black54, Colors.blueAccent]),
      ),
      child: ListView.builder(
          itemBuilder: (context, index) {
            print(listArticle[index].image);
            return Container(
              alignment: Alignment.bottomLeft,
              height: displayHeight(context) * 0.25,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("${listArticle[index].image}"),
                    fit: BoxFit.cover),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailScreen(
                          title: "${listArticle[index].title}",
                          content: "${listArticle[index].content}",
                          image: "${listArticle[index].image}"),
                    ),
                  );
                },
                child: Text("${listArticle[index].title}"),
              ),
            );
          },
          // separatorBuilder: (context, index) {
          //   return Divider();
          // },
          itemCount: listArticle.length),
    );
  }
}
