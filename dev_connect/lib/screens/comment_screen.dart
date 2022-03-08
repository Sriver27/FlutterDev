import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_connect/models/user.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/resources/fireStore_methods.dart';
import 'package:dev_connect/utils/utils.dart';
import 'package:dev_connect/wigets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class CommentScreen extends StatefulWidget {
  final postId;
  const CommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentEditingController.dispose();
  }

  void postComment(String uid, String name, String profilePic) async {
    try {
      String res = await FireStoreMethods().postComment(
        widget.postId,
        commentEditingController.text,
        uid,
        name,
        profilePic,
      );

      if (res != "Success") {
        showSnackBar(res, context);
      }
      setState(() {
        commentEditingController.text = "";
      });
    } catch (err) {
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Comments"),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.postId)
            .collection('comments')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (ctx, index) => commentsCard(
              snap: (snapshot.data! as dynamic).docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl!),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                  hintText: "Comment Queries as ${user.username}",
                  border: InputBorder.none,
                )),
              ),
            ),
            InkWell(
                onTap: () => postComment(
                      user.uid,
                      user.username,
                      user.photoUrl!,
                    ),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Text("Post",
                        style: TextStyle(color: Colors.blueAccent))))
          ],
        ),
      )),
    );
  }
}
