import 'package:chatsy/screens/home_screen.dart';
import 'package:chatsy/screens/sign_up_screen.dart';
import 'package:chatsy/services/auth_methods.dart';
import 'package:chatsy/themes.dart';
import 'package:chatsy/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 270,
              color: Colors.deepPurple,
              child: Center(
                  child: Image.network(
                      'https://img.freepik.com/free-vector/people-with-technology-devices_52683-34717.jpg?t=st=1647678835~exp=1647679435~hmac=52725f14a85247ebb2a014f8526c95d1e05d22d9cb135c9e9020f016ba6b79fe&w=900')),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    controller: emailController,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Login Email",
                        hintStyle: TextStyle(
                          fontSize: 19,
                        )),
                  ),
                  SizedBox(height: 10),
                  Text("your email".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                  SizedBox(height: 15),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 6 &&
                          !RegExp(r"^[a-zA-Z0-9]+$").hasMatch(val)) {
                        return "Password must be at least 6 characters long and should be alphanumeric";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Login Password",
                        hintStyle: TextStyle(
                          fontSize: 19,
                        )),
                  ),
                  SizedBox(height: 10),
                  Text("your password".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                  SizedBox(height: 40),
                  InkWell(
                      child: Container(
                        child: const Text('Log In',
                            style: TextStyle(fontSize: 16)),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          color: AppColors.secondary,
                        ),
                      ),
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          String res = await AuthMethods().loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (res == "Success") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            // show the error
                            showSnackBar(res, context);
                          }
                        }
                      }),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("New to Chatsy?"),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen())),
                        child: Container(
                          child: Text("Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
