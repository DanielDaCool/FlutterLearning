import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color backgroundColor = Color.fromARGB(255, 34, 34, 34);

void main() {
  HomePage.initState();
  runApp(const HomePage());
}

String userName = "";

int currentPage = 0;

void getPageGoToPage(int pageValue, BuildContext context) {
  
  if(pageValue == currentPage) return;
  switch(pageValue){
    case 0:
      
      Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (_) => const secondPage()));
      break;
    
      
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static void initState() {
    userName = "";
  }
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    currentPage = 0;
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
            onTap: (value) => (getPageGoToPage(value, context)),
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                 child:  TextField(
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
                    child: const Text("Log out")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => secondPage()));
                    },
                    child: Text("go to page 2")),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ignore: camel_case_types
class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    currentPage = 1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Text("Page 2"),
            ],
          ),
        ),
        backgroundColor: Colors.green,
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Pages")
            ],
            onTap: (value) => (getPageGoToPage(value, context)),
          ),
      ),
      
    );
  }
}
