import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/screens/login_screen.dart';
import 'package:dev_connect/screens/signup_screen.dart';
import 'package:dev_connect/utils/Responsive/mobile_Screen_layout.dart';
import 'package:dev_connect/utils/Responsive/responsive.dart';
import 'package:dev_connect/utils/Responsive/web_screen_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    options:
    const FirebaseOptions(
        apiKey: 'AIzaSyAXzkkYkFvSw7CNtTGejNun2JSri6OcDpY',
        appId: '1:641829397398:web:9da1c40094ccafcaddb3b7',
        messagingSenderId: '641829397398',
        projectId: 'dev-connect-5e9e4',
        storageBucket: 'dev-connect-5e9e4.appspot.com');
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => userProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Developer Community",
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),

          //persisting with the user state
          home: StreamBuilder(
              stream: FirebaseAuth.instance
                  .authStateChanges(), //gets called when user is signed in or logged out
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const responsiveLayout(
                      mobileScreenLayout: mobileLayout(),
                      webScreenLayout: webLayout(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: primaryColor));
                }
                return const loginScreen();
              })),
    );
  }
}
