import 'package:flutter/material.dart';
import 'package:my_simple_social/models/comment_dao.dart';

import '../models/Comment.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
    required this.text,
  });
  String text;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isCommentPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text, style: TextStyle(fontSize: 20)),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CommentsWidget();
                  });
              setState(() {
                isCommentPressed = !isCommentPressed;
              });
            },
            icon: Icon(isCommentPressed
                ? Icons.comment_rounded
                : Icons.comment_outlined),
          ),
        ],
      ),
    );
  }
}

class CommentsWidget extends StatefulWidget {
  const CommentsWidget();

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  List<Comment> comments = [];
  @override
  void initState() {
    super.initState();
    CommentDao().listComments().then((value) {
      setState(() {
        comments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: comments.map((comment) => Text(comment.content)).toList(),
            ),
          ),
        ),
        TextField()
      ],
    );
  }
}
