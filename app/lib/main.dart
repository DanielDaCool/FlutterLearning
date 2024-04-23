import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

String name = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    name = "";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
      
    );
  }
}

