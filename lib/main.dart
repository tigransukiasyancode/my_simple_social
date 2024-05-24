import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(title: "Home"),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          PostWidget(text: 'First Item'),
          PostWidget(text: 'Second Item'),
          PostWidget(text: 'Third Item'),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  PostWidget({
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          IconButton(
            onPressed: () {
              print(text);
            },
            icon: Icon(Icons.comment_rounded),
          ),
        ],
      ),
    );
  }
}
