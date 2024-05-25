import 'package:flutter/material.dart';

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
              showModalBottomSheet(context: context, builder: (context) {
                // TODO 5. Extract this container into a stateful CommentsWidget
                // TODO 6. In initState of the CommentsWidgetState call listComments
                // TODO 7. In the CommentsWidgetState build method, modify the children of the Column widget to contain the results returned by the listComments (don't forget about setState)
                return Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Comment 1"),
                        Text("Comment 2"),
                        Text("Comment 3"),
                      ],
                    ),
                  ),
                );
              });
              setState(() {
                isCommentPressed = !isCommentPressed;
              });
            },
            icon: Icon(isCommentPressed ? Icons.comment_rounded : Icons.comment_outlined),
          ),
        ],
      ),
    );
  }
}

