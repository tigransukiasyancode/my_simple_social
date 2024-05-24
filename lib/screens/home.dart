import 'package:flutter/material.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.title});
  String title;
  List<String> posts = ['First Item', 'Second Item', 'Third Item'];
  @override
  Widget build(BuildContext context) {
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