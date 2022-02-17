import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xylophone",
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatelessWidget {
  void playSound(int n) {
    final player = AudioCache();
    player.play("note$n.wav");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Xylokey(1, Colors.red),
          Xylokey(2, Colors.blue),
          Xylokey(3, Colors.yellow),
          Xylokey(4, Colors.green),
          Xylokey(5, Colors.black),
          Xylokey(6, Colors.white),
          Xylokey(7, Colors.purple),
        ],
      ),
    );
  }

  Expanded Xylokey(int soundNumber, Color color) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        playSound(soundNumber);
      },
      child: Container(
        color: color,
      ),
    ));
  }
}
