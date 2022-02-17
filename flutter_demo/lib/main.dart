import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
          accentColor: Colors.black),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "Hello, world!";
  _changeText() {
    setState(() {
      if (myText.startsWith("H")) {
        myText = "Welcome to the home";
      } else {
        myText = "Hello, world!";
      }
    });
  }

  _bodyWidget() {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(myText, style: TextStyle(fontSize: 22.0)),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Flutter Page"))),
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeText,
      ),
    );
  }
}
