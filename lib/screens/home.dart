import 'package:flutter/material.dart';
import 'package:my_simple_social/models/post_dao.dart';
import '../models/Post.dart';
import '../widgets/post_widget.dart';
import 'add_post.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title});
  String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    PostDao().listPosts().then((value) {
      print(value);
      setState(() {
        posts = value!.nonNulls.toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            ),
          ),
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPostScreen()),
            );
          }, icon: Icon(Icons.add_box_outlined))
        ],
      ),
    );
  }
}
