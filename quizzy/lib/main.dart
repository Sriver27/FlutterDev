import 'package:flutter/material.dart';
import 'Landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:landingPage();
    );
  }
}
