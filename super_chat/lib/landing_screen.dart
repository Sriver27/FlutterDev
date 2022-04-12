import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:super_chat/auth_provider.dart';
import 'package:super_chat/home_screen.dart';
import 'package:super_chat/loading.dart';
import 'package:super_chat/styles.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (Context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("Something went wrong");
              } else if (snapshot.hasData) {
                //chat screen
                return HomeScreen();
              } else {
                //login part
               return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        height: 50,
                        width: 225,
                        child: ElevatedButton(
                          onPressed: (){
                            AuthProvider().googleLogin();
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.login,
                                size: 30.0,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "GOOGLE SIGN IN",
                                textAlign: TextAlign.center,
                                style: googleText,
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              }
            }));
  }
}
