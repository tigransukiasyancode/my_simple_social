import 'package:flutter/material.dart';
import 'package:my_simple_social/models/comment_dao.dart';

import '../models/Comment.dart';
import '../models/Post.dart';
import 'comments_widget.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
    required this.post,
  });
  Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.post.content, style: TextStyle(fontSize: 20)),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CommentsWidget(commentPostId:  widget.post.id);
                    });
              },
              icon: Icon(Icons.comment_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

