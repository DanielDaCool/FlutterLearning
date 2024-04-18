import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromARGB(255, 34, 34, 34);

void main() {
  runApp(const MyApp());
}

String userName = "";

String getPage(int pageValue) {
  String str = "";
  switch (pageValue) {
    case 0:
      str = "Home";
      break;
    case 1:
      str = "Pages";
      break;
  }
  return str;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  @override
  void initState() {
    userName = "";
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: Text("Welcome ${(userName.isEmpty) ? "visitor" : userName}"),
            backgroundColor: Colors.green,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Pages")
            ],
            onTap: (value) => print("Clicked on page " + getPage(value)),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                
                TextField(
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                    
                    
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text("search"),
                ),
                TextButton(
                    onPressed: () => setState(() {
                          userName = "";
                        }),
                    child: Text("Log out")),
              ],
            ),
          ),
        );
      }),
    );
  }
}
