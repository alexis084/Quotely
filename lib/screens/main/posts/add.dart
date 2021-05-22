import 'package:flutter/material.dart';
import 'package:twitter_app/services/posts.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    final PostService _postService = PostService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Nweet'),
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () async {
              _postService.savePost(text);
              Navigator.pop(context);
            },
            child: Text('Nweet'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: new Form(
          child: TextFormField(
            onChanged: (val) {
              setState(() {
                text = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
