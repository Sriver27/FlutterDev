import 'dart:math';

import 'package:flutter/material.dart';

class memePage extends StatefulWidget {
  @override
  State<memePage> createState() => _memePageState();
}

class _memePageState extends State<memePage> {
  int memeCount = 1;
  void generateMeme() {
    setState(() {
      memeCount = Random().nextInt(11) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff182C4A),
      appBar: AppBar(
        leading: Hero(
            tag: "logo",
            child:
                CircleAvatar(backgroundImage: AssetImage("images/Stuart.png"))),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        title: Text("Memes Main Dunga"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/meme$memeCount.jpg")),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    generateMeme();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Next Bhasadh!!",
                      style: TextStyle(fontSize: 22),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
