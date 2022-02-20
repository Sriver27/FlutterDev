import 'package:flutter/material.dart';
import 'memePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "imemeto",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SnackBar snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        "Login failed!  Please try again",
        style: TextStyle(color: Colors.black),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff182C4A),
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("images/Stuart.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.domain),
                  trailing: Text("Dank Memes",
                      style: TextStyle(fontSize: 20, fontFamily: "Merienda")),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your Username",
                    hintStyle: TextStyle(color: Colors.white70)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your Password",
                    hintStyle: TextStyle(color: Colors.white70)),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text == "striver_27" &&
                    passwordController.text == "12345678") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => memePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text("Sign In!", style: TextStyle(fontSize: 22)),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
