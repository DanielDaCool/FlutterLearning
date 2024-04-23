import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  login({super.key});

  Container _buildHeader(String text, bool withUnderline) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            decoration:
                withUnderline ? TextDecoration.underline : TextDecoration.none),
      ),
    );
  }

  Container _buildInput(String hintText) {
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
            color: tdGray,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: bgColor,
      ),
      body: Center(
        child: Column(
          children: [
            _buildHeader("Username:", false),
            _buildInput("Enter your username"),
            _buildHeader("Password:", false),
            _buildInput("Enter your password"),
          ],
        ),
      ),
    );
  }
}
