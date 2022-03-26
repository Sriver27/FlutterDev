import 'package:chatsy/pages/message_page.dart';
import 'package:chatsy/screens/home_screen.dart';
import 'package:chatsy/screens/login_screen.dart';
import 'package:chatsy/screens/sign_up_screen.dart';
import 'package:chatsy/themes.dart';
import 'package:chatsy/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    appTheme: AppTheme(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appTheme}) : super(key: key);
  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => userProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          )
        ],
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          child:
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme.light,
              title: 'Chatsy',
              darkTheme: appTheme.dark,
              themeMode: themeProvider.themeMode,
              home: StreamBuilder(
                  stream: FirebaseAuth.instance
                      .authStateChanges(), //gets called when user is signed in or logged out
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        return HomeScreen();
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      }
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SignupScreen();
                  }));
        });
  }
}
