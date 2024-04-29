import 'package:app/Global.dart';
import 'package:app/constants/colorConstants.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color textColor = tdBlue;
  Color buttonColor = Colors.white;
  Container _buildHeader(String text, bool withUnderline, double fontSize) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            decoration:
                withUnderline ? TextDecoration.underline : TextDecoration.none),
      ),
    );
  }

  Container _buildInput(String hintText, user userType) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: tdBlue,
          ),
        ),
        onChanged: (value) {
          
          if (userType == user.USERNAME) {
            Global.username = value;
          } else {
            Global.password = value;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: [
            _buildHeader("Username:", false, 30),
            _buildInput("Enter your username", user.USERNAME),
            _buildHeader("Password:", false, 30),
            _buildInput("Enter your password", user.PASSWORD),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Login page", style: TextStyle(color: Colors.white)),
      backgroundColor: tdBlue,
    );
  }

  Container _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => buttonColor)),
        child: Text("Submit", style: TextStyle(fontSize: 20, color: textColor)),
        onPressed: () {
          Global.setLogin(true);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Home()));
        },
      ),
    );
  }
}
