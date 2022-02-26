// ignore_for_file: no_logic_in_create_state

import 'dart:typed_data';

import 'package:dev_connect/resources/auth_methods.dart';
import 'package:dev_connect/screens/login_screen.dart';
import 'package:dev_connect/utils/Responsive/mobile_Screen_layout.dart';
import 'package:dev_connect/utils/Responsive/responsive.dart';
import 'package:dev_connect/utils/Responsive/web_screen_layout.dart';
import 'package:dev_connect/utils/colors.dart';
import 'package:dev_connect/utils/utils.dart';
import 'package:dev_connect/wigets/text_feild_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class signUPScreen extends StatefulWidget {
  const signUPScreen({Key? key}) : super(key: key);

  @override
  _signUPScreenState createState() => _signUPScreenState();
}

class _signUPScreenState extends State<signUPScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _userNameController.dispose();
    _collegeNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passWordController.text,
      username: _userNameController.text,
      collegename: _collegeNameController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const responsiveLayout(
                mobileScreenLayout: mobileLayout(),
                webScreenLayout: webLayout(),
              )));
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => loginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 2),
            Image(image: AssetImage('assets/ds.png')),
            SizedBox(height: 12),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('assets/dpic.jpg'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            textInput(
                textEditingController: _userNameController,
                hintText: 'Enter your username',
                textinputType: TextInputType.text),
            SizedBox(height: 24),
            textInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textinputType: TextInputType.emailAddress),
            SizedBox(height: 24),
            textInput(
              textEditingController: _passWordController,
              hintText: 'Enter your password',
              textinputType: TextInputType.text,
              isPass: true,
            ),
            SizedBox(height: 24),
            textInput(
                textEditingController: _collegeNameController,
                hintText: 'Enter your college name',
                textinputType: TextInputType.text),
            SizedBox(height: 24),
            InkWell(
              child: Container(
                child: !_isLoading
                    ? const Text(
                        'Sign up',
                      )
                    : const CircularProgressIndicator(
                        color: primaryColor,
                      ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
              ),
              onTap: signUpUser,
            ),
            SizedBox(height: 12),
            Flexible(child: Container(), flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: navigateToLogin,
                  child: Container(
                    child: Text("Log In",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
