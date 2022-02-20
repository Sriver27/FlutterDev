import 'package:flutter/material.dart';
import 'question.dart';

class scorePage extends StatelessWidget {
  int score = 0;

  scorePage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg2.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Your Score is:",
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  Text(score.toString(),
                      style: TextStyle(fontSize: 40, color: Colors.red)),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Correct Attempts: " + score.toString(),
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
