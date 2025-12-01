import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Xylophone(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}


class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  void playSound(String soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('asset/piano-$soundNumber.mp3'));
  }

  Container buildKey({required Color color, required String key}) {
    return Container( height: 130, color: color,
      child: TextButton(
          style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
        playSound(key);
        },
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Flutter Xylophone', style: TextStyle(color: Colors.white70),),
        backgroundColor: Colors.black,
      ),
      body: ListView(
          children: [
            buildKey(color: Colors.red, key: "c"),
            buildKey(color: Colors.orange, key: "d"),
            buildKey(color: Colors.yellow, key: "e"),
            buildKey(color: Colors.lightGreen, key: "f"),
            buildKey(color: Colors.green, key: "g"),
            buildKey(color: Colors.blue, key: "a"),
            buildKey(color: Colors.purple, key: "b"),
          ],
        ),
    );
  }
}