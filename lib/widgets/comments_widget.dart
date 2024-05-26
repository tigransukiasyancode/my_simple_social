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
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      comments.map((comment) => CommentWidget(comment: comment)).toList(),
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
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  CommentWidget( {required this.comment});
  Comment comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(comment.content,
          style: TextStyle(fontSize: 20), ),
      ),
    );
  }
}
