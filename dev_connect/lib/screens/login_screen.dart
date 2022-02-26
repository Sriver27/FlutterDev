import 'package:dev_connect/resources/auth_methods.dart';
import 'package:dev_connect/utils/Responsive/mobile_Screen_layout.dart';
import 'package:dev_connect/utils/Responsive/responsive.dart';
import 'package:dev_connect/utils/Responsive/web_screen_layout.dart';
import 'package:dev_connect/utils/colors.dart';
import 'package:dev_connect/utils/utils.dart';
import 'package:dev_connect/wigets/text_feild_input.dart';
import 'package:flutter/material.dart';
import 'package:dev_connect/assets/flutter_svg.dart';
import 'utils/colors.dart';
import 'package:dev_connect/screens/signup_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passWordController.text);
    if (res == "Success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const responsiveLayout(
                mobileScreenLayout: mobileLayout(),
                webScreenLayout: webLayout(),
              )));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => signUPScreen()));
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
                    SizedBox(height: 64),
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
                    InkWell(
                      onTap: loginUser,
                      child: Center(
                        child: Container(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: primaryColor,
                                ))
                              : const Text('Log in'),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            color: blueColor,
                          ),
                        ),
                      ),
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
                          onTap: navigateToSignUp,
                          child: Container(
                            child: Text("Sign up",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
