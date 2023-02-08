import 'package:flutter/material.dart';
import 'package:harry_dnd_assistant/pages/home_menu.dart';

//On app load, we need to create a list containing an instance of each monster
//type for later searches

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DND Combat Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeMenu(),
    );
  }
}