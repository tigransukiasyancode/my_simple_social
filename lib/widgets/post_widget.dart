import 'package:flutter/material.dart';

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
