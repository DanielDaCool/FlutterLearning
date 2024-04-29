import 'package:flutter/material.dart';
import '/screens/login.dart';

void main() {
  runApp(const MyApp());
}


String name = "";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    name = "";
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      
    );
  }
}

