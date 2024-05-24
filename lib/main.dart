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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Item'),
                IconButton(
                  onPressed: () {
                    print('First Item');
                  },
                  icon: Icon(Icons.comment_rounded),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Second Item'),
                IconButton(
                    onPressed: () {
                      print('Second Item');
                    },
                    icon: Icon(Icons.comment_rounded))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Third Item'),
                IconButton(
                  onPressed: () {
                    print('Third Item');
                  },
                  icon: Icon(Icons.comment_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
