import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Center(
          child: Text('I Am Poor'),
        ),
      ),
      body: const Center(
        child: Image(
          image: AssetImage("images/coal.png"),
        ),
      ),
    ),
  ));
}
