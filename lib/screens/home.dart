import 'package:flutter/material.dart';
import 'package:my_simple_social/models/post_dao.dart';
import '../widgets/post_widget.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title});
  String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> posts = [];

  @override
  void initState() {
    super.initState();
    PostDao().listPosts().then((value) {
      print(value);
      setState(() {
        posts = value!.nonNulls.map((e) => e.content).toList();
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
                return PostWidget(text: posts[index]);
              },
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined))
        ],
      ),
    );
  }
}
