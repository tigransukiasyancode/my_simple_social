import 'package:flutter/material.dart';

import '../models/post_dao.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen();

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  String newPost = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              onChanged: (value) {
                newPost = value;
              },
              decoration: InputDecoration(
                hintText: "What's on your mind?",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await PostDao().createPost(newPost);
              Navigator.pop(context);
            },
            child: Text("Post"),
          )
        ],
      ),
    );
  }
}

