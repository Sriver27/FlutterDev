import 'package:flutter/material.dart';
import 'question.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'score.dart';

class landingPage extends StatefulWidget {
  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  QuestionBank question = QuestionBank();
  List<Icon> scoreKeeper = [];
  int scoreCount = 0;

  void checkAnswer(bool userpicked) {
    if (question.isFinished()) {
      Fluttertoast.showToast(
          msg: "Score updating...",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => scorePage(score: scoreCount)));
    }
    setState(() {
      if (userpicked == question.getAnswer()) {
        scoreCount++;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      question.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("images/q.png"),
                fit: BoxFit.fill)),
        child: Column(children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(question.getQuestion(),
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 50,
                          fontWeight: FontWeight.bold))),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("TRUE",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        )),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(true);
                  });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.green)),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("FALSE",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        )),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(false);
                  });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.redAccent)),
          )),
          Row(children: scoreKeeper),
        ]),
      ),
    );
  }
}
