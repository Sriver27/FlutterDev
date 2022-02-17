import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var num1 = 0, num2 = 0, sum = 0;
  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");
  void addition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void subtraction() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void multiplication() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void division() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 / num2).toInt();
    });
  }

  void clear() {
    setState(() {
      num1 = 0;
      num2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Calculator"))),
      body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Output:$sum",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "Enter a number"),
                controller: t1,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "Enter a number"),
                controller: t2,
              ),
              Padding(padding: const EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: addition,
                    child: Text("+"),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: subtraction,
                    child: Text("-"),
                    color: Colors.black,
                    textColor: Colors.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: multiplication,
                    child: Text("*"),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: division,
                    child: Text("/"),
                    color: Colors.black,
                    textColor: Colors.white,
                  )
                ],
              ),
              MaterialButton(
                onPressed: clear,
                child: Text("Clear"),
                color: Colors.black,
                textColor: Colors.white,
              )
            ],
          )),
    );
  }
}
