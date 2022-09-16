import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Xylophone(),
    ),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  Widget buildKey(int keyNum, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playAudio(keyNum);
        },
        child: const Text(
          ' ',
          style: TextStyle(
            backgroundColor: Colors.red,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade700,
      //   title: const Text("Hello Xylophone"),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.blue),
            buildKey(6, Colors.indigo),
            buildKey(7, Colors.purple),
          ],
        ),
      ),
    );
  }

  void playAudio(int num) {
    final player = AudioPlayer();
    player.play(AssetSource("assets_note$num.wav"));
  }
}
