
import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromARGB(255, 34, 34, 34);

void main() {
  runApp(const MyApp());
  
}

String getPage(int pageValue){
  String str = "";
  switch (pageValue){
    case 0:
      str = "Home";
      break;
    case 1:
      str = "Pages";
      break;
  }
  return str;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text("Main"),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: "Pages"
            )
          ],
          onTap: (value) => print("Clicked on page " + getPage(value)),
        ),
        
      ),
    );
  }
}




