import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:super_chat/landing_screen.dart';
import 'package:super_chat/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('$snapshot.error'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const App();
          } else {
            return Text("Loading...", textDirection: TextDirection.ltr);
          }
        });
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superchat',
      debugShowCheckedModeBanner: false,
      theme: themeStyle,
      home: const LandingScreen(),
    );
  }
}
