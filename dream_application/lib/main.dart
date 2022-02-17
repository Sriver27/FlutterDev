import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFE041562),
            centerTitle: true,
            title: (Text('Dream App'))),
        body: Center(child: Image(image: AssetImage("images/teslaa.jpg"))),
        backgroundColor: Colors.black,
      ),
    );
  }
}
