import 'package:flutter/material.dart';
import 'package:my_simple_social/models/post_dao.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.title});
  String title;
  List<String> posts = ['First Item', 'Second Item', 'Third Item'];
  @override
  Widget build(BuildContext context) {
    PostDao().listPosts().then((value) {
      print(value);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(text: posts[index]);
        },
      ),
    );
  }
}