import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_connect/chatmessenger/home_page.dart';
import 'package:dev_connect/wigets/post_card.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class feedScreen extends StatefulWidget {
  const feedScreen({Key? key}) : super(key: key);

  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Image.asset('assets/name.png', height: 180),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
              icon: const Icon(Icons.messenger_outline))
        ],
      ),
      body: StreamBuilder(
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!
                    .docs /*returns a list of user id's*/ .length /*gives length of post card*/,
                itemBuilder: ((context, index) => PostCard(
                      snap: snapshot.data!.docs[index].data(),
                    )));
          },
          stream: FirebaseFirestore.instance.collection('posts').snapshots()),
    );
  }
}
