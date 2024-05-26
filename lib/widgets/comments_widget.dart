import 'package:flutter/material.dart';

import '../models/Comment.dart';
import '../models/comment_dao.dart';

class CommentsWidget extends StatefulWidget {
  CommentsWidget({required this.commentPostId});

  String commentPostId;
  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  List<Comment> comments = [];
  String newComment = '';
  @override
  void initState() {
    super.initState();
    CommentDao().listComments(widget.commentPostId).then((value) {
      setState(() {
        comments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    comments.map((comment) => Text(comment.content)).toList(),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  newComment = value;
                },
              ),
            ),
            IconButton(
                onPressed: () async {
                  await CommentDao().createComment(newComment, widget.commentPostId);
                },
                icon: Icon(Icons.send))
          ],
        ),
      ],
    );
  }
}
