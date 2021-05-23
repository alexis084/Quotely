import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/models/posts.dart';
import 'package:twitter_app/screens/main/posts/list.dart';
import 'package:twitter_app/services/posts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PostModel>>.value(
      value: _postService.getPostsByUser(FirebaseAuth.instance.currentUser.uid),
      child: Scaffold(
        body: Container(
          child: ListPosts(),
        ),
      ),
      initialData: [],
    );
  }
}
