import 'dart:io';

import 'package:chatsy/pages/message_page.dart';
import 'package:chatsy/screens/home_screen.dart';
import 'package:chatsy/screens/login_screen.dart';
import 'package:chatsy/services/auth_methods.dart';
import 'package:chatsy/themes.dart';
import 'package:chatsy/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  PageController controller = PageController();

  List<Widget> _list = <Widget>[
    Info(),
  ];
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,
        reverse: true,
        physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
    );
  }
}

class Info extends StatefulWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  XFile? _image;
  bool isLoading = false;

  void selectImage() async {
    final im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = XFile(im.path);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            // ClipPath(
            //   clipper: WaveClipperOne(),
            //   child: Container(
            //     height: 260,
            //     color: Colors.deepPurple,
            //     child: Center(
            //         child: Image.network(
            //             'https://img.freepik.com/free-vector/onboarding-concept-illustration_114360-1000.jpg?t=st=1647783307~exp=1647783907~hmac=e71b88896909dc5061bdd9ac6edf6713b5ddb21bdc3a47e4b06856f0a6953a03&w=900')),
            //   ),
            // ),
            // SizedBox(height: 10),

            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 56,
                          backgroundImage: FileImage(File(_image!.path))
                          //Image(image:) Image.file(File(_image!.path)),
                          )
                      : CircleAvatar(
                          radius: 56,
                          backgroundImage: AssetImage('assets/dpic.jpg'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 70,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val!.length < 4) {
                            return "Username length must be at least 4 characters";
                          } else {
                            return null;
                          }
                        },
                        controller: userNameController,
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
                            hintText: "My username is...",
                            hintStyle: TextStyle(
                              fontSize: 19,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text("username".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          )),
                      SizedBox(height: 15),
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
                            hintText: "My email is...",
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
                            hintText: "My password is...",
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
                            child: isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.cardLight,
                                  ))
                                : const Text('Sign up',
                                    style: TextStyle(fontSize: 16)),
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              color: AppColors.secondary,
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (formkey.currentState!.validate()) {
                              String res = await AuthMethods().signUpUser(
                                email: emailController.text,
                                password: passwordController.text,
                                username: userNameController.text,
                                file: _image!,
                              );
                              if (res == "Success") {
                                setState(() {
                                  isLoading = false;
                                });
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
                            child: Text("Already have an account?"),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginScreen())),
                            child: Container(
                              child: Text("Log In",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
